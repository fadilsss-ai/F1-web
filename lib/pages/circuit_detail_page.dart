import 'package:flutter/material.dart';
import '../models/circuit.dart';
import '../widgets/stats_panel.dart';
import '../widgets/track_outline.dart';

class CircuitDetailPage extends StatelessWidget {
  final Circuit circuit;

  const CircuitDetailPage({super.key, required this.circuit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          circuit.roundLabel,
          style: const TextStyle(
            fontFamily: 'BebasNeue',
            fontSize: 20,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(circuit.countryFlag, style: const TextStyle(fontSize: 28)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    circuit.countryName.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 38,
                      letterSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              circuit.raceName,
              style: const TextStyle(color: Colors.white54, fontSize: 12, letterSpacing: 0.3),
            ),
            const SizedBox(height: 4),
            Text(
              circuit.dateRange,
              style: const TextStyle(
                fontFamily: 'BebasNeue',
                fontSize: 22,
                letterSpacing: 1,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                final trackMap = _buildTrackMap(context);

                final raceFacts = _Panel(
                  title: 'RACE FACTS',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatItem(
                        label: 'Circuit Length',
                        value: '${circuit.lengthKm} km',
                        valueSize: 44,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(height: 1, color: Colors.white12),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: StatItem(
                              label: 'Number of Laps',
                              value: '${circuit.laps}',
                              valueSize: 30,
                            ),
                          ),
                          Expanded(
                            child: StatItem(
                              label: 'Turns',
                              value: '${circuit.turns}',
                              valueSize: 30,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(height: 1, color: Colors.white12),
                      ),
                      StatItem(
                        label: 'Race Distance',
                        value:
                            '${(circuit.lengthKm * circuit.laps).toStringAsFixed(1)} km',
                        valueSize: 30,
                      ),
                    ],
                  ),
                );

                final circuitInfo = _Panel(
                  title: 'CIRCUIT INFO',
                  child: StatLineList(rows: [
                    MapEntry('Circuit', circuit.circuitName),
                    MapEntry('Location', circuit.location),
                    MapEntry('First Grand Prix', '${circuit.firstGrandPrix}'),
                    MapEntry('Lap Record', circuit.lapRecord),
                  ]),
                );

            
                if (constraints.maxWidth > 700) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            raceFacts,
                            const SizedBox(height: 16),
                            circuitInfo,
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(flex: 6, child: trackMap),
                    ],
                  );
                }

                
                return Column(
                  children: [
                    trackMap,
                    const SizedBox(height: 16),
                    raceFacts,
                    const SizedBox(height: 16),
                    circuitInfo,
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackMap(BuildContext context) {
    final path = circuit.trackMapPath;
    return GestureDetector(
      onTap: path != null
          ? () => Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => _TrackMapViewer(
                    imagePath: path,
                    title: circuit.circuitName,
                  ),
                ),
              )
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              color: Colors.black,
              child: path != null
                  ? Hero(
                      tag: path,
                      child: AspectRatio(
                        aspectRatio: 1252 / 704,
                        child: Image.asset(
                          path,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: TrackOutline(
                          points: circuit.trackOutline,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
            if (path != null)
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.zoom_out_map,
                      color: Colors.white70, size: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Panel extends StatelessWidget {
  final String title;
  final Widget child;

  const _Panel({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'BebasNeue',
              fontSize: 26,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _TrackMapViewer extends StatelessWidget {
  final String imagePath;
  final String title;

  const _TrackMapViewer({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'BebasNeue',
            fontSize: 20,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: InteractiveViewer(
          minScale: 1,
          maxScale: 5,
          child: Hero(
            tag: imagePath,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ),
    );
  }
}