import 'package:flutter/material.dart';
import '../data/circuit_data.dart';
import '../data/driver_data.dart';
import '../data/team_data.dart';
import 'logout_page.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  String get _displayName {
    if (username.trim().isEmpty) return 'Driver';
    final name = username.trim();
    return name[0].toUpperCase() + name.substring(1);
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'MASUK PIT STOP?',
          style: TextStyle(color: Colors.white, fontFamily: 'BebasNeue', fontSize: 24),
        ),
        content: const Text(
          'Kamu akan keluar dari akun. Yakin ingin logout?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal', style: TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pushAndRemoveUntil(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 600),
                  pageBuilder: (context, animation, secondaryAnimation) => const LogoutPage(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                ),
                (route) => false,
              );
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final usernameText = username.trim().isEmpty ? 'guest' : username.trim();

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'PROFILE',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'BebasNeue',
            fontSize: 22,
            letterSpacing: 2,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withValues(alpha: 0.15),
                  border: Border.all(color: Colors.red, width: 2),
                ),
                child: const Icon(Icons.person, color: Colors.red, size: 52),
              ),
              const SizedBox(height: 18),
              Text(
                _displayName,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'BebasNeue',
                  fontSize: 28,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '@$usernameText',
                style: const TextStyle(color: Colors.white54, fontSize: 14),
              ),
              const SizedBox(height: 32),

              _ProfileInfoTile(
                icon: Icons.badge_outlined,
                label: 'NAMA AKUN',
                value: _displayName,
              ),
              const SizedBox(height: 12),
              _ProfileInfoTile(
                icon: Icons.alternate_email,
                label: 'USERNAME',
                value: usernameText,
              ),

              const SizedBox(height: 28),

              const _SectionTitle('STATISTIK APLIKASI'),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _StatBox(value: '${kDrivers.length}', label: 'DRIVER')),
                  const SizedBox(width: 12),
                  Expanded(child: _StatBox(value: '${kTeams.length}', label: 'TIM')),
                  const SizedBox(width: 12),
                  Expanded(child: _StatBox(value: '${kCircuits.length}', label: 'SIRKUIT')),
                ],
              ),

              const SizedBox(height: 28),

              const _SectionTitle('TENTANG APLIKASI'),
              const SizedBox(height: 12),
              const _InfoCard(
                child:Text(
                  'Selamat datang di paddock! Aplikasi ini menyajikan profil para driver, '
                  'spesifikasi mobil tiap tim, dan daftar sirkuit Formula 1 dalam satu tempat. '
                  'Ketuk kartu driver untuk melihat statistik musim dan kariernya, atau buka '
                  'tab Teams untuk mengintip mobil favoritmu.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.5,
                    fontFamily: 'GoogleSans',
                  ),
                ),
              ),

              const SizedBox(height: 28),

              const _SectionTitle('FAKTA SERU F1'),
              const SizedBox(height: 12),
              const _FactTile(
                icon: Icons.timer_outlined,
                text: 'Pit stop tercepat tim F1 modern bisa selesai kurang dari 2 detik.',
              ),
              const SizedBox(height: 10),
              const _FactTile(
                icon: Icons.speed,
                text: 'Mobil F1 dapat mengerem dari 300 km/jam sampai berhenti dalam hitungan detik.',
              ),
              const SizedBox(height: 10),
              const _FactTile(
                icon: Icons.flag_outlined,
                text: 'Bendera finis kotak-kotak dikibarkan untuk menandai akhir balapan.',
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton.icon(
                  onPressed: () => _confirmLogout(context),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text(
                    'LOGOUT',
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'BebasNeue',
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 4, height: 18, color: Colors.red),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'BebasNeue',
              fontSize: 20,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final Widget child;

  const _InfoCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: child,
    );
  }
}

class _StatBox extends StatelessWidget {
  final String value;
  final String label;

  const _StatBox({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.withValues(alpha: 0.5)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'BebasNeue',
              fontSize: 30,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 11,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _FactTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FactTile({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return _InfoCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.red, size: 20),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.4,
                fontFamily: 'GoogleSans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ProfileInfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.red, size: 20),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 11,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'GoogleSans',
                    letterSpacing: 0.5,
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