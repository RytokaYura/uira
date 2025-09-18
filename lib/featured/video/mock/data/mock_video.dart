import '../../video_path.dart';
import '../../../../common/common_path.dart';

class MockVideo {

  final List<MockVideoModel> data = [
    MockVideoModel(
      title: 'I Love You',
      description: 'A seemingly perfect relationship between two people begins to fracture when dark secrets from the past are revealed. Psychological terror and manipulation start to loom, turning love into a deadly obsession. At a remote motel, they must face the reality that the love they cherished might be the biggest lie of all.',
      genre: ['Psychological', 'Drama', 'Thriller'],
      duration: const Duration(hours: 1, minutes: 58),
      release: DateTime(2025),
      director: 'Adrian Vance',
      actor: ['Liam Carter', 'Eleanor Vance', 'Marcus Thorne'],
      studio: 'Crimson Peak Pictures',
      country: 'United States',
      poster: ImagePath.love,
    ),

    MockVideoModel(
      title: 'Arjuna',
      description: 'In the heart of a futuristic metropolis, a young man discovers he is the reincarnation of Arjuna, a legendary warrior from ancient mythology. As divine powers awaken within him, he becomes the target of a malevolent technological entity seeking to control his abilities. Now, with a lightning bow in hand, he must fight to save two worlds: the modern world and his mythological heritage.',
      genre: ['Sci-Fi', 'Action', 'Adventure'],
      duration: const Duration(hours: 2, minutes: 15),
      release: DateTime(2026),
      director: 'Vikram Singh',
      actor: ['Rohan Kapoor', 'Priya Sharma', 'General Zartus'],
      studio: 'Future Mythos Studios & Stellar Entertainment',
      country: 'India / United States',
      poster: ImagePath.arjuna,
    ),

    MockVideoModel(
      title: 'Pulled Over',
      description: "On his way home late at night, a man is stopped by a police officer on a deserted road. However, this routine interrogation turns into a nightmare when he realizes the officer knows every sin he has ever committed. Trapped in the middle of nowhere, he must find a way to escape a supernatural enforcer who won't let him leave until all his debts are paid.",
      genre: ['Horror', 'Thriller', 'Mystery'],
      duration: const Duration(hours: 1, minutes: 42),
      release: DateTime(2024),
      director: 'James Holloway',
      actor: ['Ethan Miller', 'Officer Graves'],
      studio: 'Nightfall Films',
      country: 'United States',
      poster: ImagePath.pulled,
    ),
    MockVideoModel(
      title: 'The Crimson Bloom',
      description: 'In feudal Japan, a disgraced ronin is tasked with protecting a princess whose bloodline is cursed...',
      genre: ['Action', 'Fantasy', 'Historical Drama'],
      duration: const Duration(hours: 2, minutes: 25),
      release: DateTime(2025),
      director: 'Akira Saito',
      actor: ['Kenji Tanaka', 'Hana Mori', 'General Onimaru'],
      studio: 'Silver Katana Studios',
      country: 'Japan',
      poster: ImagePath.bloom,
    ),

    MockVideoModel(
      title: 'Echoes of Jupiter',
      description: "Decades after a vessel vanished near Jupiter, a new crew arrives on its moon, Europa...",
      genre: ['Sci-Fi', 'Mystery', 'Thriller'],
      duration: const Duration(hours: 2, minutes: 10),
      release: DateTime(2027),
      director: 'Dr. Evelyn Reed',
      actor: ['Commander Eva Rostov', 'Dr. Ben Carter', 'The Entity'],
      studio: 'Celestial Motion Pictures',
      country: 'International',
      poster: ImagePath.jupiter,
    ),

    MockVideoModel(
      title: 'Static Veins',
      description: "In a rain-drenched city run by mega-corporations, a reclusive data-courier with illegal bio-ware takes on a job to decrypt a stolen chip. He's soon pulled into a dark conspiracy, hunted by augmented assassins in the city's grimy underbelly.",
      genre: ['Cyberpunk', 'Thriller', 'Neo-Noir'],
      duration: const Duration(hours: 1, minutes: 45),
      release: DateTime(2024),
      director: 'HEX',
      actor: ['JAX', 'Nyx', 'Silas'],
      studio: 'Glitch Work Pictures',
      country: 'Germany',
      poster: ImagePath.veins,
    ),

    MockVideoModel(
      title: 'Cinder block Sonata',
      description: "A group of disillusioned musicians gather in a soundproof basement to reignite their creative fire through brutal, unsanctioned 'sound clashes'. When the club's enigmatic founder pushes them to their limits, the line between artistic expression and self-destruction blurs.",
      genre: ['Drama', 'Thriller'],
      duration: const Duration(hours: 1, minutes: 55),
      release: DateTime(2025),
      director: 'Anya Petrov',
      actor: ['Rhys Vance', 'Elena Anaya', 'Marcus Cole'],
      studio: 'Bare Knuckle Films',
      country: 'United Kingdom',
      poster: ImagePath.sonata,
    ),
  ];

}