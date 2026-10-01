import 'package:flutter/material.dart';

class StatsPanel extends StatelessWidget {
  final String title;
  final String buttonLabel;
  final Widget child;

  const StatsPanel({
    super.key,
    required this.title,
    required this.buttonLabel,
    required this.child,
  });

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
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: Text(buttonLabel),
          ),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String label;
  final String value;
  final double valueSize;

  const StatItem({
    super.key,
    required this.label,
    required this.value,
    this.valueSize = 22,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(fontFamily: 'BebasNeue', fontSize: valueSize, color: Colors.white),
        ),
      ],
    );
  }
}

class StatPairGrid extends StatelessWidget {
  final List<List<StatItem>> pairs;

  const StatPairGrid({super.key, required this.pairs});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final pair in pairs) ...[
          Row(
            children: [
              Expanded(child: pair[0]),
              Expanded(child: pair[1]),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(height: 1, color: Colors.white12),
          ),
        ],
      ],
    );
  }
}

class StatLineList extends StatelessWidget {
  final List<MapEntry<String, String>> rows;

  const StatLineList({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < rows.length; i++) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(rows[i].key, style: const TextStyle(color: Colors.white54, fontSize: 13)),
              Text(
                rows[i].value,
                style: const TextStyle(fontFamily: 'BebasNeue', fontSize: 18, color: Colors.white),
              ),
            ],
          ),
          if (i != rows.length - 1)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(height: 1, color: Colors.white12),
            ),
        ],
      ],
    );
  }
}