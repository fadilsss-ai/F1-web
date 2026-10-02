import 'package:flutter/material.dart';
import '../utils/driver_standings.dart';
import '../widgets/driver_card.dart';
import 'about_me_tab.dart';
import 'car_specs_tab.dart';
import 'circuit_tab.dart';
import 'driver_detail_page.dart';
import 'profile_page.dart';
import 'statistics_tab.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _openProfile(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfilePage(username: widget.username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orderedDrivers = driversInOfficialGridOrder();

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A),
        elevation: 0,
        title: Image.asset(
          'assets/images/F1-Logo.png',
          height: 24,
          filterQuality: FilterQuality.high,
        ),
        actions: [
          IconButton(
            onPressed: () => _openProfile(context),
            icon: const Icon(Icons.person, color: Colors.white),
            tooltip: 'Profile',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 22,
                  width: double.infinity,
                  child: CustomPaint(painter: _HeaderStripesPainter()),
                ),
                const SizedBox(height: 12),
                const Text(
                  '2026 SEASON',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'BebasNeue',
                    fontSize: 34,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),

          TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.red,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
            labelStyle: const TextStyle(fontFamily: 'BebasNeue', fontSize: 18, letterSpacing: 1.5),
            unselectedLabelStyle: const TextStyle(fontFamily: 'BebasNeue', fontSize: 18, letterSpacing: 1.5),
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            tabAlignment: TabAlignment.start,
            tabs: const [
              Tab(text: 'DRIVERS'),
              Tab(text: 'STANDINGS'),
              Tab(text: 'TEAMS'),
              Tab(text: 'SCHEDULE'),
              Tab(text: 'ABOUT ME'),
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 700;
                    return GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                      itemCount: orderedDrivers.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isWide ? 2 : 1,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: isWide ? 3.1 : 2.5,
                      ),
                      itemBuilder: (context, index) {
                        final driver = orderedDrivers[index];
                        return DriverCard(
                          driver: driver,
                          rank: driverStandingPosition(driver),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => DriverDetailPage(driver: driver)),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                const StatisticsTabView(),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: CarSpecsTabView(),
                ),
                const CircuitTabView(),
                const AboutMeTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderStripesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    const double stripeHeight = 6;
    const double gap = 4;

    for (int i = 0; i < 3; i++) {
      final double y = i * (stripeHeight + gap);
      final double widthFactor = 1 - (i * 0.12);
      final path = Path()
        ..moveTo(0, y)
        ..lineTo(size.width * widthFactor, y)
        ..lineTo(size.width * widthFactor - 18, y + stripeHeight)
        ..lineTo(0, y + stripeHeight)
        ..close();
      paint.color = Colors.red.withValues(alpha: 1 - (i * 0.25));
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}