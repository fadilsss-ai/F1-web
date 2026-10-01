import 'package:flutter/material.dart';
import '../models/circuit.dart';
import '../data/circuit_data.dart';
import '../widgets/track_outline.dart';
import 'circuit_detail_page.dart';

class CircuitTabView extends StatelessWidget {
  const CircuitTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 700;
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: kCircuits.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isWide ? 2 : 1,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: isWide ? 2.15 : 1.7,
          ),
          itemBuilder: (context, index) {
            final circuit = kCircuits[index];
            return _CircuitCard(
              circuit: circuit,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CircuitDetailPage(circuit: circuit)),
                );
              },
            );
          },
        );
      },
    );
  }
}

class _CircuitCard extends StatelessWidget {
  final Circuit circuit;
  final VoidCallback onTap;

  const _CircuitCard({required this.circuit, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0D0D0D),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 12,
              bottom: 12,
              width: 150,
              height: 100,
              child: circuit.trackMapPath != null
                  ? Image.asset(circuit.trackMapPath!, fit: BoxFit.contain)
                  : Opacity(
                      opacity: 0.9,
                      child: TrackOutline(points: circuit.trackOutline, color: Colors.white),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    circuit.roundLabel,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.55),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(circuit.countryFlag, style: const TextStyle(fontSize: 20)),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          circuit.countryName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'BebasNeue',
                            fontSize: 26,
                            letterSpacing: 0.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    circuit.raceName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.5),
                      fontSize: 11,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    circuit.dateRange,
                    style: const TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 20,
                      letterSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}