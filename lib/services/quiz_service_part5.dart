import '../models/quiz.dart';

// Additional quizzes for existing categories - Part 5
final List<Quiz> additionalQuizzesPart5 = [
  // Card Handling - Advanced
  Quiz(
    id: 'card_handling_advanced_1',
    title: 'Advanced Card Mechanics',
    category: QuizCategory.cardHandling,
    difficulty: DifficultyLevel.advanced,
    timeLimit: 600,
    passingScore: 80,
    requiredScore: 700,
    questions: [
      Question(
        id: 'ch_a1_1',
        question: 'What is "card mucking" and how is it prevented?',
        options: [
          'Card cleaning',
          'Illegal swapping of cards; prevented by proper card control and surveillance',
          'Card shuffling',
          'Card counting',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Card mucking is illegal card swapping. Prevention requires strict card control, visibility, and surveillance.',
        points: 10,
      ),
      Question(
        id: 'ch_a1_2',
        question:
            'How do dealers protect against "hand mucking" during multi-deck games?',
        options: [
          'Trust players',
          'Maintain constant visual contact with discards, never allow player hands near discard pile',
          'Speed up',
          'Ignore it',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Dealers must maintain visual contact with all discards and never allow players near the discard pile.',
        points: 10,
      ),
      Question(
        id: 'ch_a1_3',
        question: 'What is proper procedure for a "card count" verification?',
        options: [
          'Guess',
          'Stop play, spread all cards face up, count systematically per protocol',
          'Quick glance',
          'Skip it',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Card counts require stopping play, spreading all cards face up, and systematic counting per house protocol.',
        points: 10,
      ),
      Question(
        id: 'ch_a1_4',
        question: 'How should dealers handle a suspected "marked card"?',
        options: [
          'Keep dealing',
          'Discretely remove card, notify supervisor, document incident',
          'Accuse player',
          'Ignore it',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Suspected marked cards should be discretely removed, supervisor notified, and incident documented.',
        points: 10,
      ),
      Question(
        id: 'ch_a1_5',
        question: 'What is "card washing" and when is it used?',
        options: [
          'Cleaning cards',
          'Spreading and mixing cards face-down on table surface',
          'Card counting',
          'Discard procedure',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Card washing involves spreading and mixing cards face-down on the table for thorough randomization.',
        points: 10,
      ),
      Question(
        id: 'ch_a1_6',
        question:
            'How do dealers maintain card security during shuffle breaks?',
        options: [
          'Leave cards',
          'Secure cards under hand or in locked box, never unattended',
          'Stack on table',
          'Give to players',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'During breaks, cards must be secured under hand or in locked box and never left unattended.',
        points: 10,
      ),
      Question(
        id: 'ch_a1_7',
        question: 'What is the purpose of "burning" cards in various games?',
        options: [
          'Destroy cards',
          'Remove top card from play to prevent cheating/tracking',
          'Mark cards',
          'Clean cards',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Burning cards removes the top card to prevent card tracking and maintain game integrity.',
        points: 10,
      ),
      Question(
        id: 'ch_a1_8',
        question:
            'How should dealers handle a "card spread" for player verification?',
        options: [
          'Refuse',
          'Spread cards face-up in clear order for camera and player verification',
          'Quick flash',
          'Hide cards',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Card spreads must show all cards face-up in clear order visible to cameras and players.',
        points: 10,
      ),
    ],
  ),

  // Chip Management - Advanced
  Quiz(
    id: 'chip_management_advanced_1',
    title: 'Advanced Chip Operations',
    category: QuizCategory.chipManagement,
    difficulty: DifficultyLevel.advanced,
    timeLimit: 600,
    passingScore: 80,
    requiredScore: 700,
    questions: [
      Question(
        id: 'cm_a1_1',
        question: 'What is "chip splashing" and why is it problematic?',
        options: [
          'Cleaning chips',
          'Throwing chips carelessly making count difficult; prohibited',
          'Stacking chips',
          'Chip colors',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Chip splashing means throwing chips carelessly, making accurate counting difficult and is prohibited.',
        points: 10,
      ),
      Question(
        id: 'cm_a1_2',
        question:
            'How should dealers handle a player betting with mixed denominations?',
        options: [
          'Refuse bet',
          'Accept, clearly announce values, arrange properly before dealing',
          'Guess value',
          'Quick glance',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Mixed denomination bets must be accepted, values clearly announced, and chips properly arranged.',
        points: 10,
      ),
      Question(
        id: 'cm_a1_3',
        question: 'What is proper "fill" procedure when receiving chips?',
        options: [
          'Just take them',
          'Verify count, call out amounts, get supervisor signature, document',
          'Quick count',
          'Trust cage',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Fill procedures require verification, calling amounts, supervisor signature, and proper documentation.',
        points: 10,
      ),
      Question(
        id: 'cm_a1_4',
        question: 'How do dealers prevent "chip sliding" or "past posting"?',
        options: [
          'Nothing',
          'Clear "no more bets" call, watch for late bet changes, secure betting areas',
          'Speed up',
          'Trust players',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Prevention requires clear "no more bets" calls, watching for late changes, and securing betting areas.',
        points: 10,
      ),
      Question(
        id: 'cm_a1_5',
        question: 'What is a "marker" in chip transactions?',
        options: [
          'Pen mark',
          'Casino credit slip allowing players to borrow chips',
          'Chip color',
          'Bet indicator',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'A marker is a casino credit slip that allows approved players to borrow chips against their credit line.',
        points: 10,
      ),
      Question(
        id: 'cm_a1_6',
        question:
            'How should dealers manage a "credit" or "buy" on a busy table?',
        options: [
          'Rush it',
          'Stop dealing, clearly announce amount, get supervisor approval, document properly',
          'Keep dealing',
          'Quick exchange',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Credit transactions require stopping dealing, announcing amounts, supervisor approval, and documentation.',
        points: 10,
      ),
      Question(
        id: 'cm_a1_7',
        question:
            'What is proper procedure for "table inventory" reconciliation?',
        options: [
          'Guess',
          'Systematic count of all chips by denomination, compare to expected inventory',
          'Quick estimate',
          'Skip it',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Table inventory requires systematic counting of all denominations and comparison to expected inventory.',
        points: 10,
      ),
      Question(
        id: 'cm_a1_8',
        question: 'How do dealers handle counterfeit chip suspicions?',
        options: [
          'Accept them',
          'Discretely remove chip, notify supervisor immediately, document incident',
          'Confront player',
          'Ignore it',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Suspected counterfeit chips should be discretely removed, supervisor notified, and incident documented.',
        points: 10,
      ),
    ],
  ),

  // Customer Service - Advanced
  Quiz(
    id: 'customer_service_advanced_1',
    title: 'Advanced Player Management',
    category: QuizCategory.customerService,
    difficulty: DifficultyLevel.advanced,
    timeLimit: 600,
    passingScore: 80,
    requiredScore: 700,
    questions: [
      Question(
        id: 'cs_a1_1',
        question:
            'How should dealers handle a "whale" (high-roller) with specific demands?',
        options: [
          'Refuse',
          'Accommodate reasonable requests while maintaining game integrity and rules',
          'Break rules',
          'Ignore them',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.customerService,
        explanation:
            'High-rollers deserve excellent service but dealers must maintain game integrity and house rules.',
        points: 10,
      ),
      Question(
        id: 'cs_a1_2',
        question: 'What is proper protocol for handling a player dispute?',
        options: [
          'Argue',
          'Listen calmly, explain rules, call supervisor if unresolved, never argue',
          'Give in',
          'Ignore player',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.customerService,
        explanation:
            'Dealer disputes require calm listening, rule explanation, supervisor involvement if needed, no arguing.',
        points: 10,
      ),
      Question(
        id: 'cs_a1_3',
        question:
            'How do dealers maintain professionalism with intoxicated players?',
        options: [
          'Mock them',
          'Remain courteous, follow house policies, notify supervisor if disruptive',
          'Serve more drinks',
          'Argue',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.customerService,
        explanation:
            'Intoxicated players require courtesy, policy enforcement, and supervisor notification if disruptive.',
        points: 10,
      ),
      Question(
        id: 'cs_a1_4',
        question: 'What is "table atmosphere" management for dealers?',
        options: [
          'Nothing',
          'Creating positive, engaging environment while maintaining control',
          'Being loud',
          'Ignoring players',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.customerService,
        explanation:
            'Dealers create positive, engaging table atmosphere while maintaining professional control.',
        points: 10,
      ),
      Question(
        id: 'cs_a1_5',
        question:
            'How should dealers handle players who want to "tip" in chips?',
        options: [
          'Refuse',
          'Accept graciously per house policy, thank player, follow toke procedures',
          'Pocket immediately',
          'Demand cash',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.customerService,
        explanation:
            'Tips should be accepted graciously per policy with thanks, following proper toke procedures.',
        points: 10,
      ),
      Question(
        id: 'cs_a1_6',
        question:
            'What is proper response to player "superstitions" affecting game pace?',
        options: [
          'Mock them',
          'Respect beliefs while maintaining reasonable game pace, find compromises',
          'Rush them',
          'Change rules',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.customerService,
        explanation:
            'Dealers should respect superstitions while maintaining game pace through professional compromises.',
        points: 10,
      ),
      Question(
        id: 'cs_a1_7',
        question:
            'How do dealers handle a player on a "losing streak" showing distress?',
        options: [
          'Ignore them',
          'Show empathy, maintain professionalism, offer break suggestions',
          'Celebrate',
          'Give advice',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.customerService,
        explanation:
            'Distressed players need empathy, professionalism, and suggestions for breaks without gambling advice.',
        points: 10,
      ),
      Question(
        id: 'cs_a1_8',
        question: 'What is dealer responsibility regarding responsible gaming?',
        options: [
          'None',
          'Recognize problem gambling signs, inform management, never encourage excessive play',
          'Encourage betting',
          'Ignore issues',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.customerService,
        explanation:
            'Dealers must recognize problem gambling signs, inform management, and never encourage excessive play.',
        points: 10,
      ),
    ],
  ),

  // Game Rules - Advanced
  Quiz(
    id: 'game_rules_advanced_1',
    title: 'Complex Game Situations',
    category: QuizCategory.gameRules,
    difficulty: DifficultyLevel.advanced,
    timeLimit: 600,
    passingScore: 80,
    requiredScore: 700,
    questions: [
      Question(
        id: 'gr_a1_1',
        question:
            'In Blackjack, what happens if dealer and player both have 21 on first two cards?',
        options: [
          'Dealer wins',
          'Player wins',
          'Push (tie), player keeps bet',
          'Re-deal',
        ],
        correctAnswerIndex: 2,
        category: QuizCategory.gameRules,
        explanation:
            'When both dealer and player have blackjack, it results in a push and the player\'s bet is returned.',
        points: 10,
      ),
      Question(
        id: 'gr_a1_2',
        question:
            'What is "surrender" option in Blackjack and when can it be used?',
        options: [
          'Give up game',
          'Forfeit hand and lose half bet before dealer checks for blackjack',
          'Full refund',
          'Extra card',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.gameRules,
        explanation:
            'Surrender allows players to forfeit and lose half their bet before dealer checks for blackjack.',
        points: 10,
      ),
      Question(
        id: 'gr_a1_3',
        question: 'In Baccarat, when does the Player hand draw a third card?',
        options: ['Always', 'Never', 'When hand totals 0-5', 'Player decides'],
        correctAnswerIndex: 2,
        category: QuizCategory.gameRules,
        explanation:
            'In Baccarat, the Player hand automatically draws a third card when the total is 0-5.',
        points: 10,
      ),
      Question(
        id: 'gr_a1_4',
        question:
            'What is the house edge difference between single-zero and double-zero Roulette?',
        options: [
          'Same',
          'Single-zero: 2.7%, Double-zero: 5.26%',
          'Double better',
          'No edge',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.gameRules,
        explanation:
            'Single-zero Roulette has 2.7% house edge while double-zero has 5.26% edge.',
        points: 10,
      ),
      Question(
        id: 'gr_a1_5',
        question: 'In Craps, what does "Pass Line" bet win on come-out roll?',
        options: ['Any number', '7 or 11', 'Only 7', '2, 3, or 12'],
        correctAnswerIndex: 1,
        category: QuizCategory.gameRules,
        explanation:
            'Pass Line wins on come-out roll with 7 or 11, loses with 2, 3, or 12.',
        points: 10,
      ),
      Question(
        id: 'gr_a1_6',
        question: 'What is "insurance" bet in Blackjack and what does it pay?',
        options: [
          'Card protection',
          'Side bet paying 2:1 that dealer has blackjack when showing Ace',
          '3:1 payout',
          'Even money',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.gameRules,
        explanation:
            'Insurance is a side bet paying 2:1 that dealer has blackjack when showing an Ace.',
        points: 10,
      ),
      Question(
        id: 'gr_a1_7',
        question: 'In Poker, what is the ranking of "flush" vs "straight"?',
        options: [
          'Equal',
          'Flush beats straight',
          'Straight beats flush',
          'Depends on cards',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.gameRules,
        explanation:
            'In poker hand rankings, a flush (5 cards same suit) beats a straight (5 consecutive cards).',
        points: 10,
      ),
      Question(
        id: 'gr_a1_8',
        question: 'What is "commission" or "vig" in Baccarat Banker bets?',
        options: [
          'Tip',
          '5% commission on winning Banker bets due to slight advantage',
          'Penalty',
          'Bonus',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.gameRules,
        explanation:
            'Banker bets typically pay 5% commission on wins due to the slight statistical advantage.',
        points: 10,
      ),
    ],
  ),

  // Casino Protocol - Expert
  Quiz(
    id: 'casino_protocol_expert_1',
    title: 'Expert Security Procedures',
    category: QuizCategory.casinoProtocol,
    difficulty: DifficultyLevel.expert,
    timeLimit: 600,
    passingScore: 85,
    requiredScore: 1000,
    questions: [
      Question(
        id: 'cp_e1_1',
        question: 'What is "eye in the sky" and its role in casino operations?',
        options: [
          'Window',
          'Surveillance camera system monitoring all gaming activities',
          'Light fixture',
          'Decoration',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.casinoProtocol,
        explanation:
            'Eye in the sky refers to the comprehensive surveillance camera system monitoring all casino activities.',
        points: 10,
      ),
      Question(
        id: 'cp_e1_2',
        question:
            'How should dealers respond to a "code" announcement on radio?',
        options: [
          'Ignore',
          'Immediately follow trained protocol for that specific code, maintain composure',
          'Panic',
          'Ask players',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.casinoProtocol,
        explanation:
            'Dealers must immediately follow trained protocols for specific codes while maintaining professional composure.',
        points: 10,
      ),
      Question(
        id: 'cp_e1_3',
        question: 'What is dealer responsibility during a "table audit"?',
        options: [
          'Leave',
          'Stop dealing, secure all chips/cards, assist count, document discrepancies',
          'Continue playing',
          'Hide items',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.casinoProtocol,
        explanation:
            'During audits, dealers stop dealing, secure all items, assist with counting, and document any issues.',
        points: 10,
      ),
      Question(
        id: 'cp_e1_4',
        question: 'How do dealers handle suspected "card counting" by players?',
        options: [
          'Accuse player',
          'Continue dealing professionally, notify pit boss discretely, never confront',
          'Shuffle constantly',
          'Kick out player',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.casinoProtocol,
        explanation:
            'Suspected card counting requires professional dealing, discrete pit boss notification, never direct confrontation.',
        points: 10,
      ),
      Question(
        id: 'cp_e1_5',
        question: 'What is proper "drop box" procedure for dealers?',
        options: [
          'Ignore it',
          'Never touch drop box, ensure all cash goes in properly, notify if issues',
          'Open it',
          'Remove contents',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.casinoProtocol,
        explanation:
            'Dealers never touch drop boxes but ensure all cash is properly deposited and report any issues.',
        points: 10,
      ),
      Question(
        id: 'cp_e1_6',
        question:
            'How should dealers handle a medical emergency at their table?',
        options: [
          'Panic',
          'Call for medical assistance, secure table, document incident, cooperate with security',
          'Continue dealing',
          'Move patient',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.casinoProtocol,
        explanation:
            'Medical emergencies require calling assistance, securing the table, documenting, and cooperating with security.',
        points: 10,
      ),
      Question(
        id: 'cp_e1_7',
        question: 'What is "Title 31" reporting and why is it important?',
        options: [
          'Card game',
          'Federal anti-money laundering regulations requiring transaction reporting',
          'Chip color',
          'Table number',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.casinoProtocol,
        explanation:
            'Title 31 refers to federal anti-money laundering regulations requiring casinos to report large transactions.',
        points: 10,
      ),
      Question(
        id: 'cp_e1_8',
        question:
            'How do dealers maintain "game protection" in high-stakes games?',
        options: [
          'Nothing special',
          'Enhanced vigilance, strict procedures, additional security, camera coverage',
          'Same as regular',
          'Relax rules',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.casinoProtocol,
        explanation:
            'High-stakes games require enhanced vigilance, strict procedures, additional security, and camera coverage.',
        points: 10,
      ),
    ],
  ),
];
