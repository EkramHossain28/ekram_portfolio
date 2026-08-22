import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Slate Black Background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            32.0,
          ), // এখানে সঠিক নিয়মে প্যাডিং দেওয়া হয়েছে
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // অ্যানিমেটেড আর্কিটেকচার আইকন লক
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0xFF334155)),
                  ),
                  child: const Icon(
                    Icons.lock_reset_rounded,
                    color: Color(0xFF38BDF8), // অ্যাকসেন্ট ব্লু
                    size: 60,
                  ),
                ),
                const SizedBox(height: 32),

                // টাইটেল
                const Text(
                  'Session Closed Safely',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),

                // সাবটাইটেল
                const Text(
                  'Your developer workspace & local ERP simulation data have been securely detached.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF94A3B8),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),

                // পুনরায় লগইন বা রি-এন্ট্রি বাটন
                SizedBox(
                  width: 200,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // পুনরায় হোম বা আগের স্ক্রিনে ব্যাক করার কোড
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.login_rounded,
                      size: 18,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Re-Authenticate',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF38BDF8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
