class User {
  final String id;
  final String email;
  final String username;
  final int totalScore;
  final int quizzesCompleted;
  final String? avatarUrl;
  final int xp;
  final int level;

  User({
    required this.id,
    required this.email,
    required this.username,
    this.totalScore = 0,
    this.quizzesCompleted = 0,
    this.avatarUrl,
    this.xp = 0,
    this.level = 1,
  });

  // XP required for each level (exponential growth)
  int get xpForNextLevel => level * 100;
  int get xpProgress => xp % xpForNextLevel;
  double get xpPercentage => xpProgress / xpForNextLevel;
  
  // Unlock rules: Level 1-2 = 3 quizzes, Level 3-4 = 6 quizzes, Level 5+ = all
  int get unlockedQuizCount {
    if (level <= 2) return 3;
    if (level <= 4) return 6;
    if (level <= 6) return 10;
    if (level <= 8) return 15;
    return 100; // All quizzes
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      totalScore: json['totalScore'] as int? ?? 0,
      quizzesCompleted: json['quizzesCompleted'] as int? ?? 0,
      avatarUrl: json['avatarUrl'] as String?,
      xp: json['xp'] as int? ?? 0,
      level: json['level'] as int? ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'totalScore': totalScore,
      'quizzesCompleted': quizzesCompleted,
      'avatarUrl': avatarUrl,
      'xp': xp,
      'level': level,
    };
  }

  User copyWith({
    String? id,
    String? email,
    String? username,
    int? totalScore,
    int? quizzesCompleted,
    String? avatarUrl,
    int? xp,
    int? level,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      totalScore: totalScore ?? this.totalScore,
      quizzesCompleted: quizzesCompleted ?? this.quizzesCompleted,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      xp: xp ?? this.xp,
      level: level ?? this.level,
    );
  }
  
  // Add XP and check for level up
  User addXP(int earnedXP) {
    int newXP = xp + earnedXP;
    int newLevel = level;
    
    // Check for level ups
    while (newXP >= newLevel * 100) {
      newXP -= newLevel * 100;
      newLevel++;
    }
    
    return copyWith(
      xp: newXP,
      level: newLevel,
    );
  }
}
