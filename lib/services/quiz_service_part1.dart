// Part 1: Dealer Basics Quizzes (Beginner to Expert)
import '../models/quiz.dart';

final dealerBasicsQuizzes = [
  // BEGINNER LEVEL
  Quiz(
    id: 'dealer_basics_beginner_1',
    title: 'Dealer Fundamentals 101',
    category: QuizCategory.dealerBasics,
    difficulty: DifficultyLevel.beginner,
    timeLimit: 480,
    passingScore: 70,
    questions: [
      Question(
        id: 'db_b1_1',
        question: 'What is the primary responsibility of a casino dealer?',
        options: [
          'Entertaining guests',
          'Managing the game and ensuring fair play',
          'Counting cards',
          'Selling chips',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerBasics,
        explanation:
            'The dealer\'s primary responsibility is to manage the game professionally and ensure fair play for all participants.',
        points: 10,
      ),
      Question(
        id: 'db_b1_2',
        question: 'What should a dealer do before starting their shift?',
        options: [
          'Check social media',
          'Count the chip tray and verify the table',
          'Talk to other dealers',
          'Arrange personal items',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerBasics,
        explanation:
            'Dealers must count and verify the chip tray and ensure the table is properly set up before beginning their shift.',
        points: 10,
      ),
      Question(
        id: 'db_b1_3',
        question: 'How should a dealer handle a player dispute?',
        options: [
          'Argue with the player',
          'Call a floor supervisor immediately',
          'Ignore the situation',
          'Ask other players to decide',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerBasics,
        explanation:
            'When disputes arise, dealers should remain calm and call a floor supervisor to resolve the issue professionally.',
        points: 10,
      ),
      Question(
        id: 'db_b1_4',
        question: 'What is the correct dealer posture at the table?',
        options: [
          'Slouched and relaxed',
          'Standing upright with proper hand positioning',
          'Leaning on the table',
          'Sitting casually',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerBasics,
        explanation:
            'Dealers should maintain professional posture: standing upright with hands visible and properly positioned at all times.',
        points: 10,
      ),
      Question(
        id: 'db_b1_5',
        question: 'When can a dealer take a break during their shift?',
        options: [
          'Whenever they feel tired',
          'Only at designated break times with proper relief',
          'After every few hands',
          'When no players are at the table',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerBasics,
        explanation:
            'Dealers can only take breaks at designated times and must wait for a relief dealer to properly take over the table.',
        points: 10,
      ),
      Question(
        id: 'db_b1_6',
        question: 'What should dealers wear to work?',
        options: [
          'Casual clothes',
          'Casino-provided uniform in pristine condition',
          'Business casual',
          'Whatever they prefer',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerBasics,
        explanation:
            'Dealers must wear their casino-provided uniform, which should always be clean, pressed, and in excellent condition.',
        points: 10,
      ),
      Question(
        id: 'db_b1_7',
        question: 'What is the dealer\'s role regarding casino rules?',
        options: [
          'Make up rules as needed',
          'Enforce house rules consistently',
          'Let players decide',
          'Ignore minor rule breaks',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerBasics,
        explanation:
            'Dealers must enforce all house rules consistently and fairly for every player at the table.',
        points: 10,
      ),
      Question(
        id: 'db_b1_8',
        question: 'How should a dealer communicate with players?',
        options: [
          'Silently',
          'Clearly and professionally',
          'In slang',
          'Minimally',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerBasics,
        explanation:
            'Dealers should communicate clearly, professionally, and courteously with all players at all times.',
        points: 10,
      ),
    ],
  ),

  Quiz(
    id: 'dealer_basics_beginner_2',
    title: 'First Day at the Tables',
    category: QuizCategory.dealerBasics,
    difficulty: DifficultyLevel.beginner,
    timeLimit: 480,
    passingScore: 70,
    requiredScore: 70,
    questions: [
      Question(
        id: 'db_b2_1',
        question: 'What is a "shoe" in casino dealing?',
        options: [
          'Footwear requirement',
          'A device that holds multiple decks of cards',
          'A chip container',
          'The dealer\'s station',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerBasics,
        explanation:
            'A shoe is a dealing box that holds multiple decks of cards for games like blackjack and baccarat.',
        points: 10,
      ),
      Question(
        id: 'db_b2_2',
        question: 'What does "push" mean in casino games?',
        options: [
          'A player wins',
          'The house wins',
          'A tie between player and dealer',
          'An invalid bet',
        ],
        correctAnswerIndex: 2,
        category: QuizCategory.dealerBasics,
        explanation:
            'A push is a tie where neither the player nor the dealer wins, and the player\'s bet is returned.',
        points: 10,
      ),
      Question(
        id: 'db_b2_3',
        question: 'Who is the "pit boss"?',
        options: [
          'The casino owner',
          'A supervisor overseeing multiple tables',
          'The head dealer',
          'Security chief',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerBasics,
        explanation:
            'The pit boss supervises multiple gaming tables and dealers in a specific area of the casino floor.',
        points: 10,
      ),
      Question(
        id: 'db_b2_4',
        question: 'What are "house rules"?',
        options: [
          'Employee break times',
          'Specific game rules set by the casino',
          'Building codes',
          'Dress code requirements',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerBasics,
        explanation:
            'House rules are the specific game variations and procedures that each casino establishes for their games.',
        points: 10,
      ),
      Question(
        id: 'db_b2_5',
        question: 'What is a "toke"?',
        options: [
          'A playing card',
          'A tip given to the dealer',
          'A type of bet',
          'A casino chip',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerBasics,
        explanation:
            'A toke is a tip given to dealers by players, usually pooled and shared among all dealers.',
        points: 10,
      ),
      Question(
        id: 'db_b2_6',
        question: 'Why must dealers keep their hands flat and visible?',
        options: [
          'It looks professional',
          'To prevent palming chips or cards',
          'It\'s more comfortable',
          'Casino tradition',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerBasics,
        explanation:
            'Keeping hands flat and visible prevents accusations of cheating and allows surveillance to monitor all actions.',
        points: 10,
      ),
      Question(
        id: 'db_b2_7',
        question: 'What should a dealer do if they make a mistake?',
        options: [
          'Fix it quietly',
          'Immediately notify the floor supervisor',
          'Ask players what to do',
          'Continue and hope nobody notices',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerBasics,
        explanation:
            'Any mistake must be reported immediately to a supervisor for proper correction and documentation.',
        points: 10,
      ),
      Question(
        id: 'db_b2_8',
        question: 'What is "table minimum"?',
        options: [
          'Number of players needed',
          'The lowest bet allowed at a table',
          'Minimum chips in tray',
          'Break duration',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerBasics,
        explanation:
            'Table minimum is the smallest bet amount a player can place at that particular table.',
        points: 10,
      ),
    ],
  ),
];
