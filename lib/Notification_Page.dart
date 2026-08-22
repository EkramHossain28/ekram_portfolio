import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Slate Black Background
      appBar: AppBar(
        title: const Text(
          'System Alerts & Logs',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.clear_all, color: Color(0xFF38BDF8)),
            onPressed: () {}, // ক্লিয়ার অল বাটন অ্যাকশন
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // ১. আজকের অ্যালার্টসমূহ
            const _LogSectionTitle(title: 'Today\'s Automated Logs'),
            const SizedBox(height: 10),
            _buildLogTile(
              title: 'HRM Module: Salary Sheet Processed',
              subtitle: 'Automated compliance salary calculation and pay slip generation completed for 52+ team members.',
              time: '10 Mins Ago',
              icon: Icons.people_alt_outlined,
              iconColor: Colors.greenAccent,
            ),
            _buildLogTile(
              title: 'SQL Server: Query Optimization Complete',
              subtitle: 'User-defined functions and nested loops inside SQL Server 2008 optimized successfully. Execution time cut by 40%.',
              time: '1 Hour Ago',
              icon: Icons.storage_rounded,
              iconColor: Color(0xFF38BDF8),
            ),
            _buildLogTile(
              title: 'Supply Chain Alert: Low IT Inventory',
              subtitle: 'Apartment module IT asset threshold reached. Procurement trigger generated for review.',
              time: '3 Hours Ago',
              icon: Icons.inventory_2_outlined,
              iconColor: Colors.orangeAccent,
            ),

            const SizedBox(height: 24),

            // ২. আগের হিস্ট্রি/অ্যালার্টসমূহ
            const _LogSectionTitle(title: 'Yesterday\'s System Triggers'),
            const SizedBox(height: 10),
            _buildLogTile(
              title: 'MIS Control: Financial Cost & Budget Sync',
              subtitle: 'AMG ERM cost sheet aggregated and pushed to senior management dashboard securely.',
              time: '1 Day Ago',
              icon: Icons.analytics_outlined,
              iconColor: Colors.purpleAccent,
            ),
            _buildLogTile(
              title: 'Dhaka Airport 3rd Terminal Project Sync',
              subtitle: 'Application maintenance schedule and infrastructure post-implementation logs synchronized.',
              time: '1 Day Ago',
              icon: Icons.flight_takeoff_outlined,
              iconColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }

  //--- কাস্টম এন্টারপ্রাইজ নোটিফিকেশন টাইল ---
  Widget _buildLogTile({
    required String title,
    required String subtitle,
    required String time,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // নোটিফিকেশন টাইপ আইকন
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 16),
          // নোটিফিকেশন টেক্সট কন্টেন্ট
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF64748B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF94A3B8),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//--- ছোট শিরোনাম উইজেট ---
class _LogSectionTitle extends StatelessWidget {
  final String title;
  const _LogSectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xFF64748B), // মিউটেড টেক্সট কালার
        letterSpacing: 0.5,
      ),
    );
  }
}
