import '../models/quiz.dart';

// NEW CATEGORY: Specialty Games - Part 8
final List<Quiz> specialtyGamesQuizzes = [
  // Beginner
  Quiz(
    id: 'specialty_beginner_1',
    title: 'Introduction to Specialty Games',
    category: QuizCategory.specialtyGames,
    difficulty: DifficultyLevel.beginner,
    timeLimit: 480,
    passingScore: 70,
    questions: [
      Question(
        id: 'sp_b1_1',
        question: 'What is Baccarat?',
        options: [
          'Card counting game',
          'Card game betting on Player or Banker hand closest to 9',
          'Dice game',
          'Slot machine',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Baccarat is a card game where players bet on which hand (Player or Banker) will total closest to 9.',
        points: 10,
      ),
      Question(
        id: 'sp_b1_2',
        question: 'In Craps, what do the dice determine?',
        options: [
          'Card order',
          'Winning and losing bets based on dice total',
          'Bet limits',
          'Player turns',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'In Craps, the total shown on two dice determines which bets win or lose.',
        points: 10,
      ),
      Question(
        id: 'sp_b1_3',
        question: 'What is Pai Gow Poker?',
        options: [
          'Chinese checkers',
          'Poker variant using 7 cards to make two poker hands',
          'Domino game',
          'Blackjack variant',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Pai Gow Poker uses 7 cards split into a 5-card high hand and 2-card low hand.',
        points: 10,
      ),
      Question(
        id: 'sp_b1_4',
        question:
            'What makes Three Card Poker different from traditional poker?',
        options: [
          'Uses 2 cards',
          'Players make hands with only 3 cards and play against dealer',
          'No dealer',
          'Team game',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Three Card Poker players make hands with 3 cards and play against the dealer, not other players.',
        points: 10,
      ),
      Question(
        id: 'sp_b1_5',
        question: 'In Baccarat, what is the value of face cards and 10s?',
        options: ['10 points', '0 points', '5 points', '1 point'],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'In Baccarat, all 10s and face cards (J, Q, K) have a value of 0 points.',
        points: 10,
      ),
      Question(
        id: 'sp_b1_6',
        question: 'What is Sic Bo?',
        options: [
          'Card game',
          'Ancient Chinese dice game with multiple betting options',
          'Board game',
          'Roulette variant',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Sic Bo is an ancient Chinese game played with three dice and multiple betting options.',
        points: 10,
      ),
      Question(
        id: 'sp_b1_7',
        question: 'What does "Caribbean Stud" refer to?',
        options: [
          'Island casino',
          'Poker variant where players compete against dealer',
          'Dance',
          'Betting system',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Caribbean Stud is a poker variant where players compete against the dealer with 5-card hands.',
        points: 10,
      ),
      Question(
        id: 'sp_b1_8',
        question: 'What are the basic betting options in Baccarat?',
        options: [
          'Hit or Stand',
          'Player, Banker, or Tie',
          'Red or Black',
          'High or Low',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Baccarat offers three main bets: Player hand, Banker hand, or Tie between them.',
        points: 10,
      ),
    ],
  ),

  // Intermediate
  Quiz(
    id: 'specialty_intermediate_1',
    title: 'Baccarat Dealing Procedures',
    category: QuizCategory.specialtyGames,
    difficulty: DifficultyLevel.intermediate,
    timeLimit: 540,
    passingScore: 75,
    requiredScore: 400,
    questions: [
      Question(
        id: 'sp_i1_1',
        question: 'When does the Banker hand draw a third card in Baccarat?',
        options: [
          'Always',
          'Never',
          'Depends on Banker total and Player\'s third card value',
          'Player decides',
        ],
        correctAnswerIndex: 2,
        category: QuizCategory.specialtyGames,
        explanation:
            'Banker draws based on complex rules involving Banker total and Player\'s third card value.',
        points: 10,
      ),
      Question(
        id: 'sp_i1_2',
        question: 'Why is 5% commission charged on Banker bets in Baccarat?',
        options: [
          'Tradition',
          'Banker has slight statistical advantage',
          'Player penalty',
          'Casino profit',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            '5% commission on Banker bets compensates for the Banker hand\'s slight statistical advantage.',
        points: 10,
      ),
      Question(
        id: 'sp_i1_3',
        question:
            'In Baccarat, if Player has 5 and draws a 4, what is the new total?',
        options: ['9', '5', '4', '10'],
        correctAnswerIndex: 0,
        category: QuizCategory.specialtyGames,
        explanation:
            'Baccarat uses modulo 10: 5 + 4 = 9. Only the last digit counts.',
        points: 10,
      ),
      Question(
        id: 'sp_i1_4',
        question: 'What is "squeeze" or "peeking" in Baccarat?',
        options: [
          'Cheating',
          'Slowly revealing cards for drama and superstition',
          'Bet type',
          'Shuffle method',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Squeezing involves slowly revealing cards for dramatic effect, popular with high-rollers.',
        points: 10,
      ),
      Question(
        id: 'sp_i1_5',
        question:
            'In Mini-Baccarat vs regular Baccarat, what is the main difference?',
        options: [
          'Different rules',
          'Smaller table, dealer handles all cards, faster pace, lower limits',
          'Card count',
          'Payouts',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Mini-Baccarat has smaller table, dealer handles all cards, faster pace, and typically lower limits.',
        points: 10,
      ),
      Question(
        id: 'sp_i1_6',
        question: 'What is typical payout for Tie bet in Baccarat?',
        options: ['1:1', '2:1', '8:1 or 9:1', '35:1'],
        correctAnswerIndex: 2,
        category: QuizCategory.specialtyGames,
        explanation:
            'Tie bets typically pay 8:1 or 9:1, though they have high house edge.',
        points: 10,
      ),
      Question(
        id: 'sp_i1_7',
        question: 'How should dealers announce Baccarat results?',
        options: [
          'Silently',
          'Clearly announce Player/Banker total and winner',
          'Quietly',
          'Not needed',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Dealers must clearly announce both totals and the winning hand for players and surveillance.',
        points: 10,
      ),
      Question(
        id: 'sp_i1_8',
        question: 'What is "commission tracking" in Baccarat?',
        options: [
          'Nothing',
          'Recording owed commission from Banker wins for later collection',
          'Tip tracking',
          'Card tracking',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Dealers track owed 5% commission from Banker wins and collect at end or periodically.',
        points: 10,
      ),
    ],
  ),

  // Advanced
  Quiz(
    id: 'specialty_advanced_1',
    title: 'Craps Procedures and Bets',
    category: QuizCategory.specialtyGames,
    difficulty: DifficultyLevel.advanced,
    timeLimit: 600,
    passingScore: 80,
    requiredScore: 750,
    questions: [
      Question(
        id: 'sp_a1_1',
        question: 'What is the "come-out roll" in Craps?',
        options: [
          'Final roll',
          'First roll of new game establishing point or resolving Pass/Don\'t Pass',
          'Any roll',
          'Dealer roll',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Come-out roll is the first roll establishing a point or immediately resolving Pass/Don\'t Pass bets.',
        points: 10,
      ),
      Question(
        id: 'sp_a1_2',
        question: 'What are "odds bets" in Craps and why are they significant?',
        options: [
          'House bets',
          'Additional bets behind Pass/Come with no house edge (true odds)',
          'Long shots',
          'Commission bets',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Odds bets are additional wagers behind Pass/Come that pay true odds with no house edge.',
        points: 10,
      ),
      Question(
        id: 'sp_a1_3',
        question: 'In Craps, what does "Hard 8" mean?',
        options: [
          'Total of 8',
          'Rolling 4-4 (double 4s) to make 8',
          'Difficult bet',
          'Eight rolls',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Hard 8 means rolling 4-4 (double 4s) rather than other combinations totaling 8.',
        points: 10,
      ),
      Question(
        id: 'sp_a1_4',
        question: 'What is the "box man" responsibility at a Craps table?',
        options: [
          'Box chips',
          'Supervises game, handles cash, watches for errors',
          'Security',
          'Player',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Box man supervises the Craps game, handles money drops, and watches for dealing errors.',
        points: 10,
      ),
      Question(
        id: 'sp_a1_5',
        question: 'In Pai Gow Poker, what is the "house way"?',
        options: [
          'Casino rules',
          'Standardized method for arranging dealer hands',
          'Betting limit',
          'Shuffle procedure',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'House way is the standardized method dealers use to arrange their 7 cards into two hands.',
        points: 10,
      ),
      Question(
        id: 'sp_a1_6',
        question: 'What is "proposition bet" area in Craps?',
        options: [
          'Main bets',
          'Center table area for one-roll bets with high payouts and high house edge',
          'Player proposals',
          'Side area',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Proposition bets are center-table one-roll wagers with high payouts and high house edge.',
        points: 10,
      ),
      Question(
        id: 'sp_a1_7',
        question: 'In Three Card Poker, when does dealer "qualify"?',
        options: [
          'Always',
          'With Queen-high or better',
          'With pair or better',
          'With Ace-high',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'In Three Card Poker, dealer must have Queen-high or better to qualify and play against player hands.',
        points: 10,
      ),
      Question(
        id: 'sp_a1_8',
        question: 'What is "joker" role in Pai Gow Poker?',
        options: [
          'Wild card',
          'Semi-wild: completes straights/flushes or acts as Ace',
          'No joker',
          'Discarded',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'In Pai Gow Poker, joker is semi-wild: completes straights/flushes or otherwise acts as an Ace.',
        points: 10,
      ),
    ],
  ),

  // Expert
  Quiz(
    id: 'specialty_expert_1',
    title: 'Expert Specialty Game Dealing',
    category: QuizCategory.specialtyGames,
    difficulty: DifficultyLevel.expert,
    timeLimit: 600,
    passingScore: 85,
    requiredScore: 1100,
    questions: [
      Question(
        id: 'sp_e1_1',
        question:
            'What is "EZ Baccarat" and how does it differ from traditional Baccarat?',
        options: [
          'Easier rules',
          'No commission on Banker, but Banker bet pushes on winning three-card 7',
          'Automated',
          'Faster',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'EZ Baccarat eliminates commission but pushes Banker bets when Banker wins with three-card total of 7.',
        points: 10,
      ),
      Question(
        id: 'sp_e1_2',
        question:
            'In Craps, what is "controlled shooting" and why do casinos monitor it?',
        options: [
          'Illegal',
          'Dice throwing technique allegedly reducing randomness; monitored as potential advantage',
          'Dealer skill',
          'Normal throwing',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Controlled shooting is a dice technique allegedly influencing outcomes; casinos monitor as potential advantage play.',
        points: 10,
      ),
      Question(
        id: 'sp_e1_3',
        question: 'What is "dragon bonus" side bet in Baccarat?',
        options: [
          'Free bet',
          'Bet paying based on point margin of winning hand',
          'Dragon symbol',
          'Asian variant',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Dragon Bonus is a side bet paying based on how many points the winning hand beats the losing hand by.',
        points: 10,
      ),
      Question(
        id: 'sp_e1_4',
        question: 'In Pai Gow Poker, what is "banking" option?',
        options: [
          'Chip storage',
          'Players can act as banker, covering all other bets at table',
          'Dealer break',
          'Betting limit',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Banking option allows a player to act as the bank, covering all other bets at the table.',
        points: 10,
      ),
      Question(
        id: 'sp_e1_5',
        question: 'What is "fire bet" in Craps and what does it pay?',
        options: [
          'Dangerous bet',
          'Bet on shooter making multiple different points; pays up to 1000:1',
          'Hot dice',
          'Rapid betting',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Fire bet wagers on shooter making multiple different point numbers, paying up to 1000:1 for six points.',
        points: 10,
      ),
      Question(
        id: 'sp_e1_6',
        question:
            'How do dealers handle "dispute resolution" in fast-paced Craps games?',
        options: [
          'Guess',
          'Stop game, consult box man/surveillance, follow house procedures',
          'Ignore',
          'Player decides',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Craps disputes require stopping game, consulting box man/surveillance, and following house procedures.',
        points: 10,
      ),
      Question(
        id: 'sp_e1_7',
        question:
            'What is "Chemin de Fer" and how does it differ from Punto Banco Baccarat?',
        options: [
          'Same game',
          'Players can choose to draw third card; players bank against each other',
          'European name',
          'Faster version',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Chemin de Fer allows player decisions on drawing and features player banking against other players.',
        points: 10,
      ),
      Question(
        id: 'sp_e1_8',
        question:
            'What is "coopering" in Pai Gow and how should dealers prevent it?',
        options: [
          'Cooperation',
          'Players showing cards to each other; prevented by proper card security',
          'Team play',
          'Legal strategy',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.specialtyGames,
        explanation:
            'Coopering is players showing cards to each other; dealers prevent by maintaining strict card security.',
        points: 10,
      ),
    ],
  ),
];
