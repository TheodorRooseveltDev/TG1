enum QuizCategory {
  poker('Poker', 'Test your poker knowledge'),
  blackjack('Blackjack', 'Master the 21 game'),
  roulette('Roulette', 'Spin your knowledge'),
  slots('Slot Machines', 'Learn the reels'),
  baccarat('Baccarat', 'High stakes knowledge'),
  craps('Craps', 'Roll the dice facts'),
  general('General Casino', 'All-around casino knowledge');

  final String title;
  final String description;

  const QuizCategory(this.title, this.description);
}

class Question {
  final String id;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final QuizCategory category;
  final String explanation;
  final int points;

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.category,
    required this.explanation,
    this.points = 10,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as String,
      question: json['question'] as String,
      options: (json['options'] as List).map((e) => e as String).toList(),
      correctAnswerIndex: json['correctAnswerIndex'] as int,
      category: QuizCategory.values.firstWhere(
        (c) => c.name == json['category'],
        orElse: () => QuizCategory.general,
      ),
      explanation: json['explanation'] as String,
      points: json['points'] as int? ?? 10,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'options': options,
      'correctAnswerIndex': correctAnswerIndex,
      'category': category.name,
      'explanation': explanation,
      'points': points,
    };
  }
}

class Quiz {
  final String id;
  final String title;
  final QuizCategory category;
  final List<Question> questions;
  final int timeLimit; // in seconds
  final int passingScore;

  Quiz({
    required this.id,
    required this.title,
    required this.category,
    required this.questions,
    this.timeLimit = 600, // 10 minutes default
    this.passingScore = 70,
  });

  int get totalPoints => questions.fold(0, (sum, q) => sum + q.points);

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'] as String,
      title: json['title'] as String,
      category: QuizCategory.values.firstWhere(
        (c) => c.name == json['category'],
        orElse: () => QuizCategory.general,
      ),
      questions: (json['questions'] as List)
          .map((q) => Question.fromJson(q as Map<String, dynamic>))
          .toList(),
      timeLimit: json['timeLimit'] as int? ?? 600,
      passingScore: json['passingScore'] as int? ?? 70,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category.name,
      'questions': questions.map((q) => q.toJson()).toList(),
      'timeLimit': timeLimit,
      'passingScore': passingScore,
    };
  }
}

class QuizResult {
  final String quizId;
  final String userId;
  final int score;
  final int totalPoints;
  final int correctAnswers;
  final int totalQuestions;
  final DateTime completedAt;
  final int timeTaken; // in seconds

  QuizResult({
    required this.quizId,
    required this.userId,
    required this.score,
    required this.totalPoints,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.completedAt,
    required this.timeTaken,
  });

  double get percentage => (score / totalPoints) * 100;

  bool isPassed(int passingScore) => percentage >= passingScore;

  factory QuizResult.fromJson(Map<String, dynamic> json) {
    return QuizResult(
      quizId: json['quizId'] as String,
      userId: json['userId'] as String,
      score: json['score'] as int,
      totalPoints: json['totalPoints'] as int,
      correctAnswers: json['correctAnswers'] as int,
      totalQuestions: json['totalQuestions'] as int,
      completedAt: DateTime.parse(json['completedAt'] as String),
      timeTaken: json['timeTaken'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quizId': quizId,
      'userId': userId,
      'score': score,
      'totalPoints': totalPoints,
      'correctAnswers': correctAnswers,
      'totalQuestions': totalQuestions,
      'completedAt': completedAt.toIso8601String(),
      'timeTaken': timeTaken,
    };
  }
}
