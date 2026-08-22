import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Slate Black Background
      appBar: AppBar(
        title: const Text(
          'Executive Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Color(0xFF38BDF8)),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ১. টপ প্রোফাইল কার্ড ও কন্টাক্ট অ্যাকশনস
              const _ProfileHeaderCard(),
              const SizedBox(height: 32),

              // ২. টাইমলাইন বা এক্সপেরিয়েন্স হিস্ট্রি
              const Text(
                'Professional Timeline',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const _CareerTimeline(),
              const SizedBox(height: 32),

              // ৩. কোর ইআরপি ডোমেইন ও মডিউল ব্রেকডাউন
              const Text(
                'Enterprise Module Mastery',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const _ModuleGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

//--- ১. প্রোফাইল হেডার কার্ড উইজেট ---
class _ProfileHeaderCard extends StatelessWidget {
  const _ProfileHeaderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: const Color(0xFF38BDF8).withOpacity(0.1),
                child: const Icon(
                  Icons.psychology,
                  size: 45,
                  color: Color(0xFF38BDF8),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Md. Ekram Hossain',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Deputy Manager (App Dev)',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF38BDF8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Amin Mohammad Foundation Ltd.'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF94A3B8),
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(color: Color(0xFF334155)),
          const SizedBox(height: 12),
          // কন্টাক্ট কুইক একশন বাটন
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildContactButton(Icons.phone, 'Call', () {}),
              _buildContactButton(Icons.email, 'Email', () {}),
              _buildContactButton(Icons.file_download, 'CV', () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF94A3B8), size: 22),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
          ),
        ],
      ),
    );
  }
}

//--- ২. টাইমলাইন উইজেট (১৩ বছরের ক্যারিয়ার ট্র্যাকিং) ---
class _CareerTimeline extends StatelessWidget {
  const _CareerTimeline();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTimelineItem(
          '2021 - Present',
          'Deputy Manager (Application Dev)',
          'Amin Mohammad Foundation Ltd.',
          true,
        ),
        _buildTimelineItem(
          '2016 - 2021',
          'Sr. Software Engineer',
          'Amin Mohammad Group',
          false,
        ),
        _buildTimelineItem(
          '2012 - 2016',
          'Software Engineer',
          'AsroTex Group / Logic Software Ltd.',
          false,
        ),
      ],
    );
  }

  Widget _buildTimelineItem(
    String duration,
    String role,
    String company,
    bool isCurrent,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: isCurrent ? const Color(0xFF38BDF8) : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF38BDF8), width: 3),
              ),
            ),
            Container(width: 2, height: 60, color: const Color(0xFF334155)),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                duration,
                style: const TextStyle(
                  color: Color(0xFF38BDF8),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                role,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                company,
                style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}

//--- ৩. মডিউল গ্রিড উইজেট (আপনার ডিজাইন করা প্রধান মডিউলসমূহ) ---
class _ModuleGrid extends StatelessWidget {
  const _ModuleGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.4,
      children: [
        _buildModuleCard('HRM & Compliance', Icons.badge_outlined),
        _buildModuleCard('Supply Chain', Icons.local_shipping_outlined),
        _buildModuleCard(
          'Cost & Budgeting',
          Icons.account_balance_wallet_outlined,
        ),
        _buildModuleCard('Inventory Control', Icons.inventory_2_outlined),
      ],
    );
  }

  Widget _buildModuleCard(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: const Color(0xFF38BDF8), size: 28),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
