import 'package:flutter/material.dart';

const String kAboutName = 'Akmal Priyatama Fadilah Ramadhan';

const String kAboutPhotoPath = 'assets/images/profile/fadils.png';

const String kAboutSubtitle = 'Pembuat Aplikasi';

const String kAboutFlag = '🇮🇩';

const String kAboutBio =
    'Halo! Saya pembuat aplikasi web F1 ini. Hobi saya main game Fate Grand Order, '
    'menonton anime, terutama genre Isekai, dan menonton Formula 1 ';

const String kAboutProjectText =
    'Aplikasi ini menampilkan profil driver, klasemen, spesifikasi mobil tiap '
    'tim, dan jadwal sirkuit musim 2026 dalam satu tempat. Dibangun dengan '
    'Flutter dan Dart.';

const List<_AboutInfo> _kAboutInfos = [
  _AboutInfo(Icons.mail_outline, 'EMAIL', 'akmalpriyatamafr26@email.com'),
  _AboutInfo(Icons.code, 'GITHUB', 'fadilsss-ai'),
  _AboutInfo(Icons.camera_alt_outlined, 'INSTAGRAM', '@faadills'),
];

class AboutMeTabView extends StatelessWidget {
  const AboutMeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
          children: [
            const _ProfileCard(),
            const SizedBox(height: 28),

            const _SectionTitle('TENTANG SAYA'),
            const SizedBox(height: 12),
            const _InfoCard(
              child: Text(
                kAboutBio,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.6,
                  fontFamily: 'GoogleSans',
                ),
              ),
            ),

            const SizedBox(height: 28),
            const _SectionTitle('TENTANG PROYEK INI'),
            const SizedBox(height: 12),
            const _InfoCard(
              child: Text(
                kAboutProjectText,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.6,
                  fontFamily: 'GoogleSans',
                ),
              ),
            ),

            const SizedBox(height: 28),
            const _SectionTitle('INFO'),
            const SizedBox(height: 12),
            for (final info in _kAboutInfos) ...[
              _InfoTile(icon: info.icon, label: info.label, value: info.value),
              const SizedBox(height: 10),
            ],
          ],
        ),
      ),
    );
  }
}

class _AboutInfo {
  final IconData icon;
  final String label;
  final String value;

  const _AboutInfo(this.icon, this.label, this.value);
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    const teamColor = Color(0xFFE10600);
    final parts = kAboutName.split(' ');
    final firstName = parts.first;
    final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.lerp(teamColor, Colors.black, 0.82)!,
              Color.lerp(teamColor, Colors.black, 0.45)!,
            ],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, box) {
            final photoWidth = (box.maxWidth * 0.52).clamp(0.0, 210.0);
            return Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: _DotTexturePainter(color: teamColor),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 10,
                  bottom: 0,
                  width: photoWidth,
                  child: Image.asset(
                    kAboutPhotoPath,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter,
                    filterQuality: FilterQuality.high,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.black.withValues(alpha: 0.25),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.person,
                        size: 56,
                        color: Colors.white.withValues(alpha: 0.35),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 14, photoWidth + 16, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        firstName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'GoogleSans',
                          color: Colors.white,
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white70,
                        ),
                      ),
                      Text(
                        lastName,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'GoogleSans',
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        kAboutSubtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'GoogleSans',
                          color: Colors.white.withValues(alpha: 0.75),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 14,
                  bottom: 12,
                  child: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(kAboutFlag, style: TextStyle(fontSize: 14)),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _DotTexturePainter extends CustomPainter {
  final Color color;

  _DotTexturePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color.withValues(alpha: 0.10);
    const double spacing = 10;
    const double radius = 1.1;

    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotTexturePainter oldDelegate) =>
      oldDelegate.color != color;
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

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return _InfoCard(
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