import 'package:flutter/material.dart';
import '../models/driver.dart';


class DriverListTile extends StatelessWidget {
  final Driver driver;
  final int rank;
  final VoidCallback onTap;

  const DriverListTile({
    super.key,
    required this.driver,
    required this.rank,
    required this.onTap,
  });

  String get _rankSuffix {
    if (rank == 1) return 'ST';
    if (rank == 2) return 'ND';
    if (rank == 3) return 'RD';
    return 'TH';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: driver.teamColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 42,
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontFamily: 'BebasNeue', color: Colors.white),
                    children: [
                      TextSpan(text: '$rank', style: const TextStyle(fontSize: 22)),
                      TextSpan(text: _rankSuffix, style: const TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
              ),
              ClipOval(
                child: Image.asset(
                  driver.imagePath,
                  width: 38,
                  height: 38,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  filterQuality: FilterQuality.high,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(driver.countryFlag, style: const TextStyle(fontSize: 13)),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            driver.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 18,
                              letterSpacing: 0.5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (driver.badge != null)
                      Text(
                        driver.badge!,
                        style: const TextStyle(color: Colors.white70, fontSize: 10, letterSpacing: 1),
                      ),
                  ],
                ),
              ),
              // Poin klasemen.
              Text(
                '${driver.points}',
                style: const TextStyle(fontFamily: 'BebasNeue', fontSize: 20, color: Colors.white),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.star_border, color: Colors.white70, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}