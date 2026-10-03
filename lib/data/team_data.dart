import 'package:flutter/material.dart';
import '../models/team.dart';

const List<Team> kTeams = [
  Team(
    name: 'McLaren Formula 1 Team',
    teamColor: Color(0xFFFF8000),
    imagePath: 'assets/images/cars/mclaren-f1-car.jpg',
    chassis: 'MCL40',
    engineSupplier: 'Mercedes-AMG',
    description:
        'MCL40 dibangun di atas filosofi aero-elastis McLaren, membuat sayap '
        'depan sedikit melentur demi efisiensi optimal di kecepatan tinggi. '
        'Dipadu mesin Mercedes-AMG, mobil ini dikenal lincah di sirkuit jalan '
        'raya yang sempit.',
    seasonPoints: 306,
    seasonStats: TeamSeasonStats(
      gpRaces: 14, gpPoints: 306, gpWins: 2, gpPodiums: 7, gpPoles: 2, gpTop10s: 20,
      fastestLaps: 3, dnfsSeason: 6, sprintRaces: 5, sprintPoints: 0, sprintWins: 0,
      sprintPodiums: 0, sprintPoles: 0, sprintTop10s: 0,
    ),
    summaryStats: TeamSummaryStats(
      grandsPrixEntered: 224, teamPoints: 2546, highestRaceFinish: '1 (x11)',
      podiums: 63, highestGridPosition: '1 (x12)', polePositions: 15, worldChampionships: 0,
    ),
  ),
  Team(
    name: 'Scuderia Ferrari',
    teamColor: Color(0xFFE10600),
    imagePath: 'assets/images/cars/ferrariF1-car.jpg',
    chassis: 'SF-26',
    engineSupplier: 'Ferrari',
    description:
        'Filosofi desain SF-26 menekankan efisiensi aerodinamika tinggi dengan '
        'downforce presisi di setiap tikungan cepat. Ferrari mengandalkan power '
        'unit V6 turbo-hybrid generasi terbaru untuk menyalurkan tenaga secara '
        'instan tanpa turbo lag.',
    seasonPoints: 358,
    seasonStats: TeamSeasonStats(
      gpRaces: 14, gpPoints: 358, gpWins: 2, gpPodiums: 9, gpPoles: 4, gpTop10s: 24,
      fastestLaps: 3, dnfsSeason: 3, sprintRaces: 5, sprintPoints: 0, sprintWins: 0,
      sprintPodiums: 0, sprintPoles: 0, sprintTop10s: 0,
    ),
    summaryStats: TeamSummaryStats(
      grandsPrixEntered: 539, teamPoints: 6649, highestRaceFinish: '1 (x107)',
      podiums: 256, highestGridPosition: '1 (x134)', polePositions: 134, worldChampionships: 7,
    ),
  ),
  Team(
    name: 'Oracle Red Bull Racing',
    teamColor: Color(0xFF1E41FF),
    imagePath: 'assets/images/cars/Red-Bull-car.jpg',
    chassis: 'RB22',
    engineSupplier: 'Red Bull Ford Powertrains',
    description:
        'RB22 melanjutkan filosofi sasis ramping Red Bull yang mengutamakan '
        'efisiensi udara di sekitar sidepod. Dipadukan dengan tenaga dari Red '
        'Bull Ford Powertrains, mobil ini dirancang unggul di trek dengan '
        'kombinasi tikungan cepat dan lambat.',
    seasonPoints: 230,
    seasonStats: TeamSeasonStats(
      gpRaces: 14, gpPoints: 216, gpWins: 0, gpPodiums: 7, gpPoles: 1, gpTop10s: 20,
      fastestLaps: 3, dnfsSeason: 5, sprintRaces: 5, sprintPoints: 0, sprintWins: 0,
      sprintPodiums: 0, sprintPoles: 0, sprintTop10s: 0,
    ),
    summaryStats: TeamSummaryStats(
      grandsPrixEntered: 256, teamPoints: 3281.5, highestRaceFinish: '1 (x68)',
      podiums: 123, highestGridPosition: '1 (x46)', polePositions: 46, worldChampionships: 4,
    ),
  ),
  Team(
    name: 'Mercedes-AMG Petronas',
    teamColor: Color(0xFF00D2BE),
    imagePath: 'assets/images/cars/mercedesf1-car.jpg',
    chassis: 'W17',
    engineSupplier: 'Mercedes-AMG',
    description:
        'W17 membawa evolusi konsep sidepod ramping Mercedes menuju kestabilan '
        'aero yang lebih baik di segala kondisi lintasan. Power unit '
        'Mercedes-AMG dikenal efisien dalam manajemen energi baterai sepanjang '
        'balapan.',
    seasonPoints: 503,
    seasonStats: TeamSeasonStats(
      gpRaces: 14, gpPoints: 503, gpWins: 10, gpPodiums: 19, gpPoles: 7, gpTop10s: 23,
      fastestLaps: 6, dnfsSeason: 2, sprintRaces: 5, sprintPoints: 0, sprintWins: 0,
      sprintPodiums: 0, sprintPoles: 0, sprintTop10s: 0,
    ),
    summaryStats: TeamSummaryStats(
      grandsPrixEntered: 181, teamPoints: 1778, highestRaceFinish: '1 (x14)',
      podiums: 42, highestGridPosition: '1 (x12)', polePositions: 12, worldChampionships: 0,
    ),
  ),
  Team(
    name: 'BWT Alpine F1 Team',
    teamColor: Color(0xFFE4007C),
    imagePath: 'assets/images/cars/Alpine-car.jpg',
    chassis: 'A526',
    engineSupplier: 'Renault',
    description:
        'A526 mengusung livery biru-pink khas BWT dengan fokus perbaikan '
        'efisiensi aerodinamika bagian belakang. Alpine mengandalkan mesin '
        'Renault yang terus disempurnakan demi mengejar ketertinggalan dari '
        'tim papan atas.',
    seasonPoints: 68,
    seasonStats: TeamSeasonStats(
      gpRaces: 14, gpPoints: 68, gpWins: 0, gpPodiums: 0, gpPoles: 0, gpTop10s: 17,
      fastestLaps: 0, dnfsSeason: 1, sprintRaces: 5, sprintPoints: 0, sprintWins: 0,
      sprintPodiums: 0, sprintPoles: 0, sprintTop10s: 0,
    ),
    summaryStats: TeamSummaryStats(
      grandsPrixEntered: 209, teamPoints: 568, highestRaceFinish: '1 (x1)',
      podiums: 4, highestGridPosition: '2 (x1)', polePositions: 0, worldChampionships: 0,
    ),
  ),
  Team(
    name: 'Racing Bulls F1 Team',
    teamColor: Color(0xFF1660AD),
    imagePath: 'assets/images/cars/visarb-car.jpg',
    chassis: 'VCARB 03',
    engineSupplier: 'Red Bull Ford Powertrains',
    description:
        'VCARB 03 dirancang sebagai mobil pengembangan bakat muda Red Bull, '
        'mengusung filosofi sasis yang mirip dengan tim senior namun dengan '
        'anggaran yang lebih terbatas. Musim ini tim tampil dengan nama baru '
        '"Racing Bulls" setelah melepas sponsor titel sebelumnya.',
    seasonPoints: 77,
    seasonStats: TeamSeasonStats(
      gpRaces: 14, gpPoints: 90, gpWins: 0, gpPodiums: 0, gpPoles: 0, gpTop10s: 19,
      fastestLaps: 0, dnfsSeason: 2, sprintRaces: 5, sprintPoints: 0, sprintWins: 0,
      sprintPodiums: 0, sprintPoles: 0, sprintTop10s: 0,
    ),
    summaryStats: TeamSummaryStats(
      grandsPrixEntered: 63, teamPoints: 142, highestRaceFinish: '5 (x1)',
      podiums: 0, highestGridPosition: '5 (x1)', polePositions: 0, worldChampionships: 0,
    ),
  ),
  Team(
    name: 'Audi F1 Team',
    teamColor: Color(0xFFBB0A30),
    imagePath: 'assets/images/cars/audi-car.jpg',
    chassis: 'C26',
    engineSupplier: 'Audi',
    description:
        'C26 menjadi mobil pertama Audi sebagai tim pabrikan penuh di Formula '
        '1, dengan livery silver-orange khas identitas balap Audi. Power unit '
        'dikembangkan sendiri oleh Audi sebagai bagian dari investasi jangka '
        'panjang mereka di F1.',
    seasonPoints: 17,
    seasonStats: TeamSeasonStats(
      gpRaces: 14, gpPoints: 17, gpWins: 0, gpPodiums: 0, gpPoles: 0, gpTop10s: 6,
      fastestLaps: 0, dnfsSeason: 5, sprintRaces: 5, sprintPoints: 0, sprintWins: 0,
      sprintPodiums: 0, sprintPoles: 0, sprintTop10s: 0,
    ),
    summaryStats: TeamSummaryStats(
      grandsPrixEntered: 274, teamPoints: 695, highestRaceFinish: '4 (x1)',
      podiums: 0, highestGridPosition: '2 (x1)', polePositions: 0, worldChampionships: 0,
    ),
  ),
  Team(
    name: 'MoneyGram Haas F1 Team',
    teamColor: Color(0xFF6E7275),
    imagePath: 'assets/images/cars/haas-car.jpg',
    chassis: 'VF-26',
    engineSupplier: 'Ferrari',
    description:
        'VF-26 mengusung livery putih-hitam-merah klasik Haas, dengan sasis '
        'yang dirancang seramping mungkin untuk meminimalkan drag. Haas '
        'mengandalkan power unit Ferrari, sama seperti yang dipakai Scuderia '
        'Ferrari sendiri.',
    seasonPoints: 21,
    seasonStats: TeamSeasonStats(
      gpRaces: 14, gpPoints: 21, gpWins: 0, gpPodiums: 0, gpPoles: 0, gpTop10s: 5,
      fastestLaps: 0, dnfsSeason: 4, sprintRaces: 5, sprintPoints: 0, sprintWins: 0,
      sprintPodiums: 0, sprintPoles: 0, sprintTop10s: 0,
    ),
    summaryStats: TeamSummaryStats(
      grandsPrixEntered: 233, teamPoints: 601, highestRaceFinish: '1 (x1)',
      podiums: 3, highestGridPosition: '1 (x1)', polePositions: 0, worldChampionships: 0,
    ),
  ),
  Team(
    name: 'Cadillac Formula 1 Team',
    teamColor: Color(0xFF8C8C8C),
    imagePath: 'assets/images/cars/cadillac-car.jpg',
    chassis: 'C1',
    engineSupplier: 'Ferrari',
    description:
        'C1 menjadi debut Cadillac di grid Formula 1, membawa filosofi sasis '
        'konservatif namun matang berkat dukungan pengalaman dari Andretti '
        'Global. Mengandalkan power unit Ferrari untuk musim-musim awalnya '
        'sebelum mengembangkan mesin sendiri.',
    seasonPoints: 0,
    seasonStats: TeamSeasonStats(
      gpRaces: 14, gpPoints: 0, gpWins: 0, gpPodiums: 0, gpPoles: 0, gpTop10s: 0,
      fastestLaps: 0, dnfsSeason: 10, sprintRaces: 5, sprintPoints: 0, sprintWins: 0,
      sprintPodiums: 0, sprintPoles: 0, sprintTop10s: 0,
    ),
    summaryStats: TeamSummaryStats(
      grandsPrixEntered: 14, teamPoints: 0, highestRaceFinish: '13 (x1)',
      podiums: 0, highestGridPosition: '14 (x1)', polePositions: 0, worldChampionships: 0,
    ),
  ),
  Team(
    name: 'Aston Martin Aramco F1 Team',
    teamColor: Color(0xFF00594F),
    imagePath: 'assets/images/cars/aston-martin-car.jpg',
    chassis: 'AMR26',
    engineSupplier: 'Honda',
    description:
        'AMR26 mengusung livery hijau khas Aston Martin dengan investasi besar '
        'pada fasilitas pabrik baru. Mulai musim ini, tim beralih memakai '
        'power unit Honda, menandai era baru kemitraan teknis mereka.',
    seasonPoints: 3,
    seasonStats: TeamSeasonStats(
      gpRaces: 14, gpPoints: 3, gpWins: 0, gpPodiums: 0, gpPoles: 0, gpTop10s: 2,
      fastestLaps: 0, dnfsSeason: 15, sprintRaces: 5, sprintPoints: 0, sprintWins: 0,
      sprintPodiums: 0, sprintPoles: 0, sprintTop10s: 0,
    ),
    summaryStats: TeamSummaryStats(
      grandsPrixEntered: 614, teamPoints: 2703, highestRaceFinish: '1 (x32)',
      podiums: 109, highestGridPosition: '1 (x22)', polePositions: 22, worldChampionships: 2,
    ),
  ),
  Team(
    name: 'Williams Racing',
    teamColor: Color(0xFF0B1F63),
    imagePath: 'assets/images/cars/williams-car.jpg',
    chassis: 'FW48',
    engineSupplier: 'Mercedes',
    description:
        'FW48 melanjutkan kebangkitan Williams dengan sasis yang lebih '
        'kompetitif berkat investasi baru di terowongan angin. Ditenagai '
        'mesin Mercedes, tim legendaris ini terus berusaha kembali bersaing '
        'di papan atas.',
    seasonPoints: 11,
    seasonStats: TeamSeasonStats(
      gpRaces: 14, gpPoints: 11, gpWins: 0, gpPodiums: 0, gpPoles: 0, gpTop10s: 5,
      fastestLaps: 0, dnfsSeason: 6, sprintRaces: 5, sprintPoints: 0, sprintWins: 0,
      sprintPodiums: 0, sprintPoles: 0, sprintTop10s: 0,
    ),
    summaryStats: TeamSummaryStats(
      grandsPrixEntered: 374, teamPoints: 1761, highestRaceFinish: '1 (x3)',
      podiums: 28, highestGridPosition: '1 (x6)', polePositions: 6, worldChampionships: 0,
    ),
  ),
];