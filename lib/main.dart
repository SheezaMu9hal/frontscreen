import 'package:flutter/material.dart';

void main() {
  runApp(const PointRixApp());
}

class PointRixApp extends StatelessWidget {
  const PointRixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true; // toggle login / register

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F1EC), // light green background
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Illustration placeholder
              Container(
                height: 180,
                width: 180,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(Icons.people, size: 100, color: Colors.black54),
              ),

              const SizedBox(height: 24),

              // Title
              Text(
                isLogin ? "Login" : "Register",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                isLogin
                    ? "Please Sign in to continue"
                    : "Create your account to continue",
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 24),

              // Card for form
              Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Username or email (always present)
                      TextField(
                        decoration: InputDecoration(
                          labelText: isLogin ? "Username or Email" : "Username",
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),

                      if (!isLogin) ...[
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],

                      // Password
                      TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),

                      if (!isLogin) ...[
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "Roll No",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],

                      if (isLogin)
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (_) {}),
                            const Text("Remember Me"),
                          ],
                        ),

                      const SizedBox(height: 16),

                      // Button
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(isLogin ? "Sign In" : "Sign Up"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Bottom link
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Text(
                  isLogin
                      ? "Don’t have an account? Sign Up"
                      : "Already have an account? Sign In",
                  style: const TextStyle(fontSize: 14),
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                "⚡ PointRix",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
