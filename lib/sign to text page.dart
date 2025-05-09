import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:android_intent_plus/android_intent.dart';
import 'package:permission_handler/permission_handler.dart';

class SignToTextScreen extends StatefulWidget {
  @override
  _SignToTextScreenState createState() => _SignToTextScreenState();
}

class _SignToTextScreenState extends State<SignToTextScreen> {
  String detectedText = "No sign detected yet.";
  File? selectedImage;
  final ImagePicker _picker = ImagePicker();
  Interpreter? _interpreter1;
  Interpreter? _interpreter2;
  List<String> labels1 = [];
  List<String> labels2 = [];
  TextEditingController _textController = TextEditingController();

  String _caretakerName = "";
  String _caretakerPhone = "";
  bool _hasCaretaker = false;

  @override
  void initState() {
    super.initState();
    loadModels();
  }

  Future<void> loadModels() async {
    try {
      _interpreter1 = await Interpreter.fromAsset("assets/tfmodel/model_unquant.tflite");
      _interpreter2 = await Interpreter.fromAsset("assets/tfmodel/model_unquant1.tflite");
      labels1 = await loadLabels("assets/tfmodel/labels.txt");
      labels2 = await loadLabels("assets/tfmodel/labels1.txt");
    } catch (e) {
      print("❌ Error loading models: $e");
      setState(() {
        detectedText = "Error loading models.";
      });
    }
  }

  Future<List<String>> loadLabels(String path) async {
    try {
      String labelsData = await DefaultAssetBundle.of(context).loadString(path);
      return labelsData.split('\n').map((e) => e.trim()).toList();
    } catch (e) {
      print("❌ Error loading labels: $e");
      return [];
    }
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> takePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> detectSign() async {
    if (selectedImage == null) {
      setState(() {
        detectedText = "⚠ No image selected!";
      });
      return;
    }

    if (_interpreter1 == null || _interpreter2 == null) {
      setState(() {
        detectedText = "⚠ Models not loaded!";
      });
      return;
    }

    try {
      Uint8List imageBytes = await selectedImage!.readAsBytes();
      final decodedImage = img.decodeImage(imageBytes);
      if (decodedImage == null) {
        setState(() {
          detectedText = "Error decoding image!";
        });
        return;
      }

      final resizedImage = img.copyResize(decodedImage, width: 224, height: 224);

      List<List<List<List<double>>>> input = [
        List.generate(224, (y) {
          return List.generate(224, (x) {
            final pixel = resizedImage.getPixel(x, y);
            return [
              pixel.r / 255.0,
              pixel.g / 255.0,
              pixel.b / 255.0,
            ];
          });
        }),
      ];

      var output1 = List.generate(1, (i) => List.filled(14, 0.0));
      var output2 = List.generate(1, (i) => List.filled(26, 0.0));

      _interpreter1!.run(input, output1);
      _interpreter2!.run(input, output2);

      int predictedIndex1 = output1[0].indexOf(output1[0].reduce((a, b) => a > b ? a : b));
      int predictedIndex2 = output2[0].indexOf(output2[0].reduce((a, b) => a > b ? a : b));

      if (labels1.length < 14 || labels2.length < 26) {
        setState(() {
          detectedText = "⚠ Label file mismatch!";
        });
        return;
      }

      String predictedSign1 = labels1[predictedIndex1];
      String predictedSign2 = labels2[predictedIndex2];

      setState(() {
        detectedText = "Detected: $predictedSign1 / $predictedSign2";
        _textController.text = detectedText;
      });

      if (_hasCaretaker && _caretakerPhone.isNotEmpty) {
        _sendSMS("Detected Sign: $predictedSign1 / $predictedSign2");
      }
    } catch (e) {
      setState(() {
        detectedText = "Error: $e";
      });
    }
  }

  Future<void> _sendSMS(String message) async {
    try {
      final smsUri = Uri(
        scheme: 'sms',
        path: _caretakerPhone,
        queryParameters: {'body': message},
      );

      if (await canLaunch(smsUri.toString())) {
        await launch(smsUri.toString());
        return;
      }

      final intent = AndroidIntent(
        action: 'android.intent.action.SENDTO',
        data: 'smsto:$_caretakerPhone',
        arguments: {'sms_body': message},
      );
      await intent.launch();
    } catch (e) {
      await Clipboard.setData(ClipboardData(text: "Send to $_caretakerPhone: $message"));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Tap to open Messages app"),
            action: SnackBarAction(
              label: "OPEN",
              onPressed: () => _openMessagesAppManually(message),
            ),
          ),
        );
      }
    }
  }

  Future<void> _openMessagesAppManually(String message) async {
    const apps = [
      'com.google.android.apps.messaging',
      'com.samsung.android.messaging',
      'com.android.mms',
      'com.huawei.message',
    ];

    for (final app in apps) {
      try {
        await launch('package:$app');
        return;
      } catch (_) {}
    }

    await launch('market://details?id=com.google.android.apps.messaging');
  }

  void _showCaretakerBottomSheet() {
    TextEditingController nameController = TextEditingController(text: _caretakerName);
    TextEditingController phoneController = TextEditingController(text: _caretakerPhone);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add Caretaker Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Caretaker Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: "Phone Number (with country code)",
                hintText: "e.g., +919876543210",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
                      setState(() {
                        _caretakerName = nameController.text;
                        _caretakerPhone = phoneController.text;
                        _hasCaretaker = true;
                      });
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Caretaker details saved!")),
                      );
                    }
                  },
                  child: Text("Save"),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Sign-to-Text Converter", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: _showCaretakerBottomSheet,
            tooltip: "Add Caretaker",
          ),
        ],
      ),
      backgroundColor: Colors.purple.shade50,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(detectedText, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: selectedImage != null
                          ? Image.file(selectedImage!, fit: BoxFit.cover)
                          : Center(child: Icon(Icons.cloud_upload, size: 50, color: Colors.purple)),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Container(
                        width: 185,
                        height: 186,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: pickImageFromGallery,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                minimumSize: Size(200, 48),
                              ),
                              child: Text("Pick from Gallery"),
                            ),
                            SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: takePhoto,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                minimumSize: Size(200, 48),
                              ),
                              child: Text("Take a Photo"),
                            ),
                            SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: detectSign,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                minimumSize: Size(200, 48),
                              ),
                              child: Text("Detect Sign"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_hasCaretaker)
            Container(
              padding: EdgeInsets.all(12),
              color: Colors.purple[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text("Caretaker: $_caretakerName", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Phone: $_caretakerPhone"),
                  ]),
                  IconButton(icon: Icon(Icons.edit), onPressed: _showCaretakerBottomSheet),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _interpreter1?.close();
    _interpreter2?.close();
    _textController.dispose();
    super.dispose();
  }
}
