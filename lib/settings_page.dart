import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // কনফিগারেশন স্টেটসমূহ
  bool _isDarkMode = true;
  bool _enableCache = true;
  bool _enableHRMNotifications = true;
  String _preferredDatabase = 'SQL Server 2008'; // আপনার সিভির ডাটাবেজ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Slate Black Background
      appBar: AppBar(
        title: const Text(
          'System Configuration',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            // ১. অ্যাপ ও ইউআই কনফিগারেশন
            const _SettingsSectionHeader(title: 'UI & Environment Settings'),
            const SizedBox(height: 10),
            _buildSwitchTile(
              title: 'Developer Dark Mode',
              subtitle: 'Optimize UI with slate-black enterprise theme.',
              value: _isDarkMode,
              icon: Icons.dark_mode_outlined,
              onChanged: (val) => setState(() => _isDarkMode = val),
            ),
            _buildSwitchTile(
              title: 'Enable Local API Caching',
              subtitle: 'Cache ERP module logs for ultra-fast performance.',
              value: _enableCache,
              icon: Icons.bolt_outlined,
              onChanged: (val) => setState(() => _enableCache = val),
            ),

            const SizedBox(height: 24),

            // ২. ডোমেইন ও মডিউল ফিল্টার (আপনার সিভি বেসড)
            const _SettingsSectionHeader(title: 'Portfolio Module Filters'),
            const SizedBox(height: 10),
            _buildSwitchTile(
              title: 'Live HRM Sync Alerts',
              subtitle: 'Receive triggers for salary processing & compliance.',
              value: _enableHRMNotifications,
              icon: Icons.badge_outlined,
              onChanged: (val) => setState(() => _enableHRMNotifications = val),
            ),
            _buildDropdownTile(
              title: 'Preferred Database Engine',
              subtitle: 'Switch background simulator database logic.',
              value: _preferredDatabase,
              icon: Icons.storage_rounded,
              items: ['SQL Server 2008', 'MySQL Server', 'Classic ASP DB Link'],
              onChanged: (val) => setState(() => _preferredDatabase = val!),
            ),

            const SizedBox(height: 24),

            // ৩. সিকিউরিটি ও ডাটা ম্যানেজমেন্ট
            const _SettingsSectionHeader(title: 'Data & Security Admin'),
            const SizedBox(height: 10),
            _buildActionTile(
              title: 'Clear Application Local Logs',
              subtitle: 'Wipe simulated ERP database state and cache safely.',
              icon: Icons.layers_clear_outlined,
              actionColor: Colors.orangeAccent,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Local simulated state cleared!'),
                  ),
                );
              },
            ),
            _buildActionTile(
              title: 'Reset to System Default',
              subtitle: 'Restore initial architecture configurations.',
              icon: Icons.refresh_rounded,
              actionColor: Colors.redAccent,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  //--- কাস্টম টগল/সুইচ টাইল উইজেট ---
  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required IconData icon,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: SwitchListTile(
        activeColor: const Color(0xFF38BDF8),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        secondary: Icon(icon, color: const Color(0xFF38BDF8), size: 22),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 12,
            height: 1.3,
          ),
        ),
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  //--- কাস্টম ড্রপডাউন টাইল উইজেট ---
  Widget _buildDropdownTile({
    required String title,
    required String subtitle,
    required String value,
    required IconData icon,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF38BDF8), size: 22),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 12,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          DropdownButton<String>(
            value: value,
            dropdownColor: const Color(0xFF1E293B),
            style: const TextStyle(
              color: Color(0xFF38BDF8),
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            underline: Container(),
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
        ],
      ),
    );
  }

  //--- কাস্টম একশন/ক্লিক টাইল উইজেট ---
  Widget _buildActionTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color actionColor,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: actionColor, size: 22),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 12,
            height: 1.3,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: const Color(0xFF64748B),
          size: 14,
        ),
      ),
    );
  }
}

//--- সেটিংস হেডার ক্যাটাগরি শিরোনাম উইজেট ---
class _SettingsSectionHeader extends StatelessWidget {
  final String title;
  const _SettingsSectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Color(0xFF64748B),
        letterSpacing: 0.5,
      ),
    );
  }
}
