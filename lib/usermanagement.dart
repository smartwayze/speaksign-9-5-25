import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({Key? key}) : super(key: key);

  @override
  _UserManagementScreenState createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        setState(() {
          _users = [currentUser];
        });
      }
    } catch (e) {
      _showErrorDialog('Error loading users: ${e.toString()}');
    }
  }

  Future<void> _addUser() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog('Please enter both email and password');
      return;
    }

    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      setState(() {
        _users.add(userCredential.user!);
        _emailController.clear();
        _passwordController.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User $email created successfully'),
          backgroundColor: Colors.purple,
        ),
      );
    } catch (e) {
      _showErrorDialog('Error creating user: ${e.toString()}');
    }
  }

  Future<void> _deleteUser(User user) async {
    try {
      await user.delete();

      setState(() {
        _users.remove(user);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User ${user.email} deleted successfully'),
          backgroundColor: Colors.purple,
        ),
      );
    } catch (e) {
      _showErrorDialog('Error deleting user: ${e.toString()}');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error', style: TextStyle(color: Colors.purple)),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('OK', style: TextStyle(color: Colors.purple)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Admin Page', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Add New User',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.purple),
                        prefixIcon: Icon(Icons.email, color: Colors.purple),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.purple),
                        prefixIcon: Icon(Icons.lock, color: Colors.purple),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _addUser,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      child: Text(
                        'Add User',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'User List',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(height: 12),
                      Expanded(
                        child: _users.isEmpty
                            ? Center(
                          child: Text(
                            'No users found',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                            : ListView.builder(
                          itemCount: _users.length,
                          itemBuilder: (ctx, index) {
                            final user = _users[index];
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 4),
                              elevation: 2,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.purple.shade100,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.purple,
                                  ),
                                ),
                                title: Text(
                                  user.email ?? 'No email',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  'UID: ${user.uid.substring(0, 8)}...',
                                  style: TextStyle(fontSize: 12),
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _deleteUser(user),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}