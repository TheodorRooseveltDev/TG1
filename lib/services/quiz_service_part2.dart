// Part 2: Card Handling & Chip Management Quizzes
import '../models/quiz.dart';

final cardHandlingQuizzes = [
  // BEGINNER
  Quiz(
    id: 'card_handling_beginner_1',
    title: 'Card Handling Basics',
    category: QuizCategory.cardHandling,
    difficulty: DifficultyLevel.beginner,
    timeLimit: 480,
    passingScore: 70,
    questions: [
      Question(
        id: 'ch_b1_1',
        question: 'What is the proper way to shuffle cards as a dealer?',
        options: [
          'Riffle shuffle only',
          'Strip shuffle only',
          'Casino-approved shuffle sequence (riffle, strip, riffle)',
          'Any shuffle method is fine',
        ],
        correctAnswerIndex: 2,
        category: QuizCategory.cardHandling,
        explanation:
            'Dealers must follow the casino-approved shuffle sequence, typically including riffle shuffles and strip shuffles in a specific order.',
        points: 10,
      ),
      Question(
        id: 'ch_b1_2',
        question: 'Why must dealers keep cards low to the table?',
        options: [
          'It looks more professional',
          'To prevent players from seeing cards early',
          'To prevent surveillance camera blind spots',
          'Both B and C',
        ],
        correctAnswerIndex: 3,
        category: QuizCategory.cardHandling,
        explanation:
            'Keeping cards low prevents players from seeing cards prematurely and ensures surveillance cameras can monitor all dealing actions.',
        points: 10,
      ),
      Question(
        id: 'ch_b1_3',
        question: 'What should a dealer do if a card is accidentally exposed?',
        options: [
          'Continue dealing normally',
          'Follow house rules for exposed cards',
          'Let the player keep it',
          'Shuffle immediately',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'When a card is exposed, dealers must follow specific house rules, which vary by game and casino policy.',
        points: 10,
      ),
      Question(
        id: 'ch_b1_4',
        question: 'How should a dealer cut the deck after shuffling?',
        options: [
          'Cut it themselves',
          'Offer the cut card to a player',
          'Skip cutting',
          'Cut multiple times',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'After shuffling, dealers should offer the cut card to a player, allowing them to cut the deck before play begins.',
        points: 10,
      ),
      Question(
        id: 'ch_b1_5',
        question: 'What is the purpose of the "burn card"?',
        options: [
          'To discard damaged cards',
          'To prevent card counting and add security',
          'To mark the end of the shoe',
          'To keep table neat',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Burning cards (discarding the top card) adds security by preventing players from tracking or predicting the next card.',
        points: 10,
      ),
      Question(
        id: 'ch_b1_6',
        question: 'How many decks are typically used in a blackjack shoe?',
        options: ['1-2 decks', '4-8 decks', '10-12 decks', 'Varies by day'],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Most casino blackjack games use 6 or 8 decks in a shoe to reduce card counting effectiveness.',
        points: 10,
      ),
      Question(
        id: 'ch_b1_7',
        question: 'What is a "pitch game"?',
        options: [
          'A game where cards are pitched to players',
          'A game dealt from a shoe',
          'A poker variant',
          'A roulette term',
        ],
        correctAnswerIndex: 0,
        category: QuizCategory.cardHandling,
        explanation:
            'A pitch game is typically single or double-deck blackjack where the dealer "pitches" cards face-down to players.',
        points: 10,
      ),
      Question(
        id: 'ch_b1_8',
        question: 'When should cards be replaced during a game?',
        options: [
          'Every hour',
          'When damaged or marked',
          'At the end of each shift',
          'Never during a session',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Cards should be immediately replaced if they become damaged, marked, or compromised in any way.',
        points: 10,
      ),
    ],
  ),

  // INTERMEDIATE
  Quiz(
    id: 'card_handling_intermediate_1',
    title: 'Advanced Card Techniques',
    category: QuizCategory.cardHandling,
    difficulty: DifficultyLevel.intermediate,
    timeLimit: 540,
    passingScore: 75,
    requiredScore: 350,
    questions: [
      Question(
        id: 'ch_i1_1',
        question: 'What is "card mucking" and why is it illegal?',
        options: [
          'A shuffle technique',
          'Secretly switching or hiding cards for cheating',
          'A card cleaning method',
          'A dealing style',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Card mucking is a cheating technique where cards are secretly switched or hidden. Dealers must be vigilant to prevent this.',
        points: 10,
      ),
      Question(
        id: 'ch_i1_2',
        question:
            'How should a dealer handle a player who touches the cards inappropriately?',
        options: [
          'Ignore it',
          'Warn the player and notify supervisor',
          'Reshuffle immediately',
          'Let them continue',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Dealers should politely warn the player about proper card handling and notify a supervisor if the behavior continues.',
        points: 10,
      ),
      Question(
        id: 'ch_i1_3',
        question: 'What is the "wash" or "scramble" shuffle?',
        options: [
          'Mixing cards face-up on the table',
          'Spreading cards face-down and mixing them randomly',
          'A riffle shuffle variant',
          'Cleaning the cards',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'The wash/scramble involves spreading cards face-down on the table and mixing them thoroughly in a circular motion.',
        points: 10,
      ),
      Question(
        id: 'ch_i1_4',
        question:
            'How many riffle shuffles are typically required for proper randomization?',
        options: [
          '1-2 times',
          '3-5 times',
          '7 or more times',
          'It doesn\'t matter',
        ],
        correctAnswerIndex: 2,
        category: QuizCategory.cardHandling,
        explanation:
            'Mathematical studies show that 7 riffle shuffles are needed for proper randomization of a standard deck.',
        points: 10,
      ),
      Question(
        id: 'ch_i1_5',
        question: 'What should a dealer do if they suspect marked cards?',
        options: [
          'Continue dealing',
          'Immediately notify supervisor and stop using the deck',
          'Shuffle more frequently',
          'Flip the cards over',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Suspected marked cards must be reported immediately to a supervisor and removed from play for inspection.',
        points: 10,
      ),
      Question(
        id: 'ch_i1_6',
        question: 'What is "card crimping"?',
        options: [
          'Shuffling technique',
          'Bending cards slightly to identify them later',
          'Card storage method',
          'Dealing style',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Card crimping is a cheating method where cards are slightly bent to identify them during play.',
        points: 10,
      ),
      Question(
        id: 'ch_i1_7',
        question: 'How should dealt cards be positioned for player visibility?',
        options: [
          'Any position is fine',
          'Face-up, slightly fanned, within player\'s reach',
          'Stacked neatly',
          'Scattered randomly',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Cards should be dealt face-up and slightly fanned so players can easily see their hand without touching the cards unnecessarily.',
        points: 10,
      ),
      Question(
        id: 'ch_i1_8',
        question: 'What is the proper way to deal cards from a shoe?',
        options: [
          'Pull cards out quickly',
          'Slide cards smoothly with one hand, maintaining table contact',
          'Use both hands',
          'Lift cards high',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.cardHandling,
        explanation:
            'Cards should be smoothly slid from the shoe with one hand while maintaining contact with the table for visibility.',
        points: 10,
      ),
    ],
  ),
];

final chipManagementQuizzes = [
  // BEGINNER
  Quiz(
    id: 'chip_management_beginner_1',
    title: 'Chip Handling 101',
    category: QuizCategory.chipManagement,
    difficulty: DifficultyLevel.beginner,
    timeLimit: 480,
    passingScore: 70,
    questions: [
      Question(
        id: 'cm_b1_1',
        question: 'How should chips be stacked in the dealer tray?',
        options: [
          'Randomly placed',
          'By color in stacks of 20',
          'All mixed together',
          'In piles of 10',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Chips should be organized by color/denomination in stacks of 20 for easy counting and verification.',
        points: 10,
      ),
      Question(
        id: 'cm_b1_2',
        question: 'What is "cutting cheques"?',
        options: [
          'Destroying old chips',
          'Breaking down chip stacks to make exact payouts',
          'Designing new chips',
          'Exchanging chips for cash',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Cutting cheques means breaking down chip stacks to create the exact amount needed for player payouts.',
        points: 10,
      ),
      Question(
        id: 'cm_b1_3',
        question: 'How should a dealer handle a player buy-in?',
        options: [
          'Take cash into chip tray',
          'Spread cash on table, call amount, wait for approval, exchange',
          'Give chips first',
          'Count privately',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Dealers must spread cash openly, announce the amount, wait for floor approval, then exchange for chips under camera.',
        points: 10,
      ),
      Question(
        id: 'cm_b1_4',
        question: 'What are the standard chip colors in most casinos?',
        options: [
          'Random colors',
          'White (), Red (), Green (), Black ()',
          'All gold',
          'Blue and yellow only',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Standard chip colors are white (\), red (\), green (\), and black (\), though variations exist.',
        points: 10,
      ),
      Question(
        id: 'cm_b1_5',
        question: 'What should a dealer do if they make an incorrect payout?',
        options: [
          'Quietly fix it',
          'Immediately call floor supervisor',
          'Ask player to return chips',
          'Ignore it',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Any payout errors must be reported immediately to a floor supervisor for proper correction and documentation.',
        points: 10,
      ),
      Question(
        id: 'cm_b1_6',
        question: 'Why must dealers announce "change" or "color coming in"?',
        options: [
          'Tradition',
          'To alert surveillance and management of transactions',
          'Player courtesy',
          'No specific reason',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Announcing transactions alerts surveillance cameras and floor supervisors to monitor the exchange properly.',
        points: 10,
      ),
      Question(
        id: 'cm_b1_7',
        question: 'How should winning bets be paid?',
        options: [
          'In any order',
          'Starting from dealer\'s right, moving left',
          'Largest bets first',
          'Randomly',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Dealers typically pay winning bets systematically, starting from their right and moving left around the table.',
        points: 10,
      ),
      Question(
        id: 'cm_b1_8',
        question: 'What is a "lammer"?',
        options: [
          'A chip',
          'A marker button placed on bets',
          'A card',
          'A dealing tool',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'A lammer is a marker button dealers use to indicate specific bet conditions or player status at the table.',
        points: 10,
      ),
    ],
  ),

  // INTERMEDIATE
  Quiz(
    id: 'chip_management_intermediate_1',
    title: 'Professional Chip Handling',
    category: QuizCategory.chipManagement,
    difficulty: DifficultyLevel.intermediate,
    timeLimit: 540,
    passingScore: 75,
    requiredScore: 400,
    questions: [
      Question(
        id: 'cm_i1_1',
        question: 'What is a "fill" and when is it needed?',
        options: [
          'Adding players',
          'Bringing more chips to replenish dealer tray',
          'Refilling drinks',
          'Break time',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'A fill is when additional chips are brought to a table to replenish the dealer\'s chip tray during play.',
        points: 10,
      ),
      Question(
        id: 'cm_i1_2',
        question: 'What is a "credit" and how does it work?',
        options: [
          'Player reward',
          'Removing excess chips from table and returning to cage',
          'Dealer bonus',
          'Customer discount',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'A credit is when excess chips are removed from the dealer\'s tray and returned to the casino cage.',
        points: 10,
      ),
      Question(
        id: 'cm_i1_3',
        question: 'How should a dealer "size into" a bet when paying?',
        options: [
          'Stack chips randomly',
          'Match player bet stack, then add payout on top',
          'Count out loud',
          'Use different colors',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Sizing into a bet means matching the player\'s bet stack size, then placing the payout on top for easy verification.',
        points: 10,
      ),
      Question(
        id: 'cm_i1_4',
        question: 'What is "chip coloring up"?',
        options: [
          'Painting chips',
          'Exchanging small chips for larger denominations',
          'Sorting by color',
          'Cleaning chips',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Coloring up means exchanging multiple small-denomination chips for fewer large-denomination chips.',
        points: 10,
      ),
      Question(
        id: 'cm_i1_5',
        question:
            'How should dealers handle a "short pay" (paying less than owed)?',
        options: [
          'Add more chips quickly',
          'Stop, call supervisor, correct under supervision',
          'Ask player if they noticed',
          'Fix quietly',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Short pays must be corrected under supervisor oversight with proper documentation and camera coverage.',
        points: 10,
      ),
      Question(
        id: 'cm_i1_6',
        question: 'What is proper chip-cutting technique?',
        options: [
          'Breaking stacks randomly',
          'Using thumb to precisely separate exact amounts from stacks',
          'Using both hands',
          'Counting one by one',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'Professional dealers use their thumb to precisely cut exact amounts from chip stacks in one smooth motion.',
        points: 10,
      ),
      Question(
        id: 'cm_i1_7',
        question: 'Why must chip transactions be visible to cameras?',
        options: [
          'Tradition',
          'For surveillance to verify all financial transactions',
          'Player trust',
          'Lighting requirements',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'All chip transactions must be clearly visible to surveillance cameras for security and dispute resolution.',
        points: 10,
      ),
      Question(
        id: 'cm_i1_8',
        question: 'What is the "drop box" and what goes in it?',
        options: [
          'Lost items',
          'Cash from buy-ins',
          'Damaged cards',
          'Dealer tips',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.chipManagement,
        explanation:
            'The drop box is where dealers deposit all cash from player buy-ins, which is collected and counted by the casino.',
        points: 10,
      ),
    ],
  ),
];
