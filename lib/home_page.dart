import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF0F172A,
      ), // আধুনিক ডার্ক থিম (Slate Black)
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // ১. প্রোফাইল হেডার ও হিরো সেকশন
              _HeroSection(),
              SizedBox(height: 40),

              // ২. লাইভ স্ট্যাটস সেকশন (রেস্পনসিভ গ্রিড/রো)
              _StatsSection(),
              SizedBox(height: 50),

              // ৩. কোর এক্সপার্টাইজ সেকশন
              _SectionTitle(title: 'Core Expertise & Skills'),
              SizedBox(height: 16),
              _ExpertiseSection(),
              SizedBox(height: 50),

              // ৪. প্রজেক্ট এবং কাজের ক্ষেত্র সেকশন
              _SectionTitle(title: 'Featured Enterprise Solutions'),
              SizedBox(height: 16),
              _ProjectsSection(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

//--- সেকশন শিরোনাম উইজেট ---
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFF38BDF8), // স্কাই ব্লু টেক্সট অ্যাকসেন্ট
        letterSpacing: 0.5,
      ),
    );
  }
}

//--- ১. হিরো সেকশন উইজেট ---
class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.verified_user,
              color: Colors.greenAccent,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Microsoft Certified Professional'.toUpperCase(),
              style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          'Md. Ekram Hossain',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const Text(
          'Solutions Architect & Lead ERP Developer',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF94A3B8),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Designing and deploying large-scale, high-concurrency web-based ERP systems for Real Estate and RMG sectors. Proven history in executing mission-critical projects including airport infrastructures and maritime port applications.',
          style: TextStyle(fontSize: 14, color: Color(0xFFCBD5E1), height: 1.6),
        ),
      ],
    );
  }
}

//--- ২. স্ট্যাটস সেকশন উইজেট ---
class _StatsSection extends StatelessWidget {
  const _StatsSection();

  @override
  Widget build(BuildContext context) {
    // স্ক্রিনের সাইজ অনুযায়ী রেস্পনসিভ লেআউট ট্র্যাকিং
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.spaceBetween,
      children: [
        _buildStatCard('13+', 'Years Experience', context, isMobile),
        _buildStatCard('52+', 'Team Members Led', context, isMobile),
        _buildStatCard('20+', 'ERP Modules Built', context, isMobile),
        _buildStatCard('2+', 'Mega Infrastructure Projects', context, isMobile),
      ],
    );
  }

  Widget _buildStatCard(
    String value,
    String label,
    BuildContext context,
    bool isMobile,
  ) {
    final cardWidth = isMobile
        ? (MediaQuery.of(context).size.width - 68) /
              2 // মোবাইলে এক লাইনে ২টি কার্ড
        : (MediaQuery.of(context).size.width - 120) /
              4; // বড় স্ক্রিনে এক লাইনে ৪টি কার্ড

    return Container(
      width: cardWidth,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF334155),
          width: 1,
        ), // .solid এর জায়গায় .all হবে
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
          ),
        ],
      ),
    );
  }
}

//--- ৩. কোর এক্সপার্টাইজ সেকশন উইজেট ---
class _ExpertiseSection extends StatelessWidget {
  const _ExpertiseSection();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        _buildSkillChip('ERP Architecture'),
        _buildSkillChip('PHP & Classic ASP'),
        _buildSkillChip('SQL Server 2008 & MySQL'),
        _buildSkillChip('Supply Chain & Logistics'),
        _buildSkillChip('HRM & Attendance Automation'),
        _buildSkillChip('Financial Cost & Budgeting'),
        _buildSkillChip('User Defined Functions Optimization'),
        _buildSkillChip('Ajax & JavaScript'),
      ],
    );
  }

  Widget _buildSkillChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0284C7).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF0284C7).withOpacity(0.4)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF38BDF8),
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

//--- ৪. ফিচার্ড প্রজেক্টস সেকশন উইজেট ---
class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildProjectCard(
          'Dhaka Airport 3rd Terminal & Payra Port Projects',
          'Enterprise Infrastructure Integrations',
          'Handled high-level MIS controls and infrastructure data flows for flagship national projects.',
          Icons.flight_takeoff,
        ),
        const SizedBox(height: 16),
        _buildProjectCard(
          'AMG ERM System (Real Estate)',
          'Apartment, Land, IT Inventory & Supply Chain Modules',
          'Developed robust table designs, optimized triggers and stored procedures in SQL Server 2008 supporting large business logic arrays.',
          Icons.business,
        ),
        const SizedBox(height: 16),
        _buildProjectCard(
          'Platform ERP (RMG Sector)',
          'Comprehensive HRM, Salary Breakdown & Compliance Process',
          'Automated structural operations including complex shift/holiday policies, salary sheets, and night/tiffin bill calculators for large workforces.',
          Icons.people,
        ),
      ],
    );
  }

  Widget _buildProjectCard(
    String title,
    String subtitle,
    String desc,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF38BDF8), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF38BDF8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF94A3B8),
                    height: 1.5,
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
