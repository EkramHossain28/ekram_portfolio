import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _messageController = TextEditingController();
  String _selectedTopic = 'ERP Architecture'; // ডিফল্ট সিলেক্টেড টপিক

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Slate Black Background
      appBar: AppBar(
        title: const Text(
          'Inquiry & Collaboration',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ১. কনসালটেশন হেডার কার্ড
              const _ConsultantHeader(),
              const SizedBox(height: 32),

              // ২. কুইক প্রজেক্ট ক্যাটাগরি সিলেকশন
              const Text(
                'Select Consultation Topic',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              _buildTopicSelector(),
              const SizedBox(height: 32),

              // ৩. মেসেজ ইনপুট ফর্ম
              const Text(
                'Your Message / Project Brief',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              _buildMessageForm(),
              const SizedBox(height: 24),

              // ৪. সেন্ড বাটন
              _buildSendButton(),
            ],
          ),
        ),
      ),
    );
  }

  //--- কুইক টপিক সিলেক্টর উইজেট ---
  Widget _buildTopicSelector() {
    final topics = [
      'ERP Architecture',
      'Database Tuning',
      'System Audit',
      'RMG / Real Estate Solutions',
    ];
    return Wrap(
      spacing: 8,
      runSpacing: 10,
      children: topics.map((topic) {
        final isSelected = _selectedTopic == topic;
        return ChoiceChip(
          label: Text(topic),
          selected: isSelected,
          selectedColor: const Color(0xFF38BDF8),
          backgroundColor: const Color(0xFF1E293B),
          labelStyle: TextStyle(
            color: isSelected ? Colors.black : const Color(0xFF94A3B8),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
          onSelected: (bool selected) {
            setState(() {
              if (selected) _selectedTopic = topic;
            });
          },
        );
      }).toList(),
    );
  }

  //--- মেসেজ লেখার টেক্সট ফিল্ড ---
  Widget _buildMessageForm() {
    return TextField(
      controller: _messageController,
      maxLines: 6,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        hintText: 'Describe your system requirements, current tech stack, or hiring needs...',
        hintStyle: const TextStyle(color: Color(0xFF64748B), fontSize: 14),
        fillColor: const Color(0xFF1E293B),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF38BDF8), width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF334155), width: 1),
        ),
      ),
    );
  }

  //--- সাবমিশন বাটন ---
  Widget _buildSendButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () {
          // এখানে ব্যাকএন্ড বা ইমেইল সেন্ডিং মেথড কল করতে পারেন
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Inquiry generated for $_selectedTopic!')),
          );
        },
        icon: const Icon(Icons.send_rounded, size: 18, color: Colors.black),
        label: const Text(
          'Submit Secure Inquiry',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF38BDF8), // অ্যাকসেন্ট ব্লু
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}

//--- ১. কনসালটেন্ট হেডার উইজেট ---
class _ConsultantHeader extends StatelessWidget {
  const _ConsultantHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: const Color(0xFF38BDF8).withOpacity(0.1),
                child: const Icon(
                  Icons.code_rounded,
                  color: Color(0xFF38BDF8),
                  size: 28,
                ),
              ),
              const CircleAvatar(
                radius: 8,
                backgroundColor: Colors.greenAccent, // অনলাইন ইন্ডিকেটর
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Enterprise Consultancy',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Direct communication channel with Md. Ekram Hossain. Ideal for system design reviews, architecture audits, and software engineering management.',
                  style: TextStyle(
                    fontSize: 12,
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
