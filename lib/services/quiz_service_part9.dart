import '../models/quiz.dart';

// NEW CATEGORY: Dealer Psychology - Part 9
final List<Quiz> dealerPsychologyQuizzes = [
  // Beginner
  Quiz(
    id: 'psychology_beginner_1',
    title: 'Mental Fundamentals for Dealers',
    category: QuizCategory.dealerPsychology,
    difficulty: DifficultyLevel.beginner,
    timeLimit: 480,
    passingScore: 70,
    questions: [
      Question(
        id: 'psy_b1_1',
        question: 'Why is emotional control important for dealers?',
        options: [
          'Not important',
          'Maintains professionalism, prevents errors, ensures fair game experience',
          'For tips',
          'Company requirement',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Emotional control maintains professionalism, prevents errors, and ensures a fair, positive game experience.',
        points: 10,
      ),
      Question(
        id: 'psy_b1_2',
        question:
            'What is "dealer fatigue" and how does it affect performance?',
        options: [
          'Not real',
          'Mental and physical exhaustion leading to errors and reduced focus',
          'Boredom',
          'Illness',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Dealer fatigue is exhaustion from long shifts that leads to increased errors and reduced focus.',
        points: 10,
      ),
      Question(
        id: 'psy_b1_3',
        question: 'How should dealers mentally prepare for their shift?',
        options: [
          'No preparation',
          'Rest well, focus mind, review procedures, positive attitude',
          'Just show up',
          'Worry',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Proper preparation includes adequate rest, mental focus, procedure review, and positive attitude.',
        points: 10,
      ),
      Question(
        id: 'psy_b1_4',
        question: 'What is the impact of a dealer\'s mood on table atmosphere?',
        options: [
          'No impact',
          'Dealer mood significantly affects player experience and table energy',
          'Minor',
          'Irrelevant',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Dealer mood significantly influences player experience, table atmosphere, and overall game enjoyment.',
        points: 10,
      ),
      Question(
        id: 'psy_b1_5',
        question: 'Why is taking regular breaks important for dealers?',
        options: [
          'Laziness',
          'Prevents fatigue, maintains focus, reduces errors, protects mental health',
          'Not important',
          'Social time',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Regular breaks prevent fatigue, maintain focus, reduce errors, and protect long-term mental health.',
        points: 10,
      ),
      Question(
        id: 'psy_b1_6',
        question: 'How should dealers handle personal problems during work?',
        options: [
          'Discuss with players',
          'Set aside personal issues, maintain professionalism, seek help if needed',
          'Let it show',
          'Go home',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Dealers should compartmentalize personal issues, maintain professionalism, and seek appropriate help if needed.',
        points: 10,
      ),
      Question(
        id: 'psy_b1_7',
        question: 'What is "mindfulness" and how can it help dealers?',
        options: [
          'Remembering rules',
          'Being present and focused on current moment, reducing stress and errors',
          'Mind reading',
          'Meditation',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Mindfulness means staying present and focused on the current moment, reducing stress and preventing errors.',
        points: 10,
      ),
      Question(
        id: 'psy_b1_8',
        question: 'Why is positive self-talk important for dealers?',
        options: [
          'Silly',
          'Builds confidence, manages stress, maintains positive attitude',
          'Unnecessary',
          'Distraction',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Positive self-talk builds confidence, helps manage stress, and maintains a constructive attitude.',
        points: 10,
      ),
    ],
  ),

  // Intermediate
  Quiz(
    id: 'psychology_intermediate_1',
    title: 'Stress Management Techniques',
    category: QuizCategory.dealerPsychology,
    difficulty: DifficultyLevel.intermediate,
    timeLimit: 540,
    passingScore: 75,
    requiredScore: 400,
    questions: [
      Question(
        id: 'psy_i1_1',
        question: 'What is "pressure resistance" in dealing?',
        options: [
          'Physical strength',
          'Ability to maintain performance under stressful situations',
          'Not resisting',
          'Refusing work',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Pressure resistance is the ability to maintain quality performance under stressful or high-pressure situations.',
        points: 10,
      ),
      Question(
        id: 'psy_i1_2',
        question:
            'How should dealers handle aggressive or hostile players psychologically?',
        options: [
          'Get angry',
          'Stay calm, don\'t take it personally, follow protocols, seek support',
          'Argue back',
          'Cry',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Dealing with hostility requires staying calm, not personalizing attacks, following protocols, and seeking support.',
        points: 10,
      ),
      Question(
        id: 'psy_i1_3',
        question:
            'What is "imposter syndrome" and how might it affect new dealers?',
        options: [
          'Cheating',
          'Feeling inadequate despite competence, causing anxiety and self-doubt',
          'Fake dealer',
          'Training phase',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Imposter syndrome makes competent dealers feel inadequate, causing anxiety and undermining confidence.',
        points: 10,
      ),
      Question(
        id: 'psy_i1_4',
        question: 'What are healthy coping mechanisms for job stress?',
        options: [
          'Alcohol, drugs',
          'Exercise, hobbies, social support, proper sleep, professional help',
          'Ignore it',
          'Quit',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Healthy coping includes exercise, hobbies, social support, adequate sleep, and professional counseling if needed.',
        points: 10,
      ),
      Question(
        id: 'psy_i1_5',
        question: 'How can dealers develop "emotional intelligence"?',
        options: [
          'Not possible',
          'Self-awareness, empathy practice, emotion regulation, social skills',
          'IQ tests',
          'Age only',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Emotional intelligence develops through self-awareness, empathy practice, emotion regulation, and social skills.',
        points: 10,
      ),
      Question(
        id: 'psy_i1_6',
        question: 'What is "burnout" and how can dealers prevent it?',
        options: [
          'Physical injury',
          'Emotional exhaustion from prolonged stress; prevented by self-care and boundaries',
          'Fire hazard',
          'Normal',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Burnout is chronic emotional exhaustion prevented through self-care, boundaries, and work-life balance.',
        points: 10,
      ),
      Question(
        id: 'psy_i1_7',
        question:
            'How should dealers mentally process making significant errors?',
        options: [
          'Panic',
          'Acknowledge, learn from it, don\'t dwell, focus on improvement',
          'Deny it',
          'Quit',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Process errors by acknowledging them, extracting lessons, avoiding rumination, and focusing on improvement.',
        points: 10,
      ),
      Question(
        id: 'psy_i1_8',
        question:
            'What role does "resilience" play in dealer career longevity?',
        options: [
          'Minor',
          'Critical - ability to bounce back from setbacks determines long-term success',
          'Unnecessary',
          'Physical only',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Resilience - bouncing back from setbacks and stress - is critical for long-term dealer career success.',
        points: 10,
      ),
    ],
  ),

  // Advanced
  Quiz(
    id: 'psychology_advanced_1',
    title: 'Advanced Mental Performance',
    category: QuizCategory.dealerPsychology,
    difficulty: DifficultyLevel.advanced,
    timeLimit: 600,
    passingScore: 80,
    requiredScore: 750,
    questions: [
      Question(
        id: 'psy_a1_1',
        question: 'What is "flow state" and how can dealers achieve it?',
        options: [
          'Water flow',
          'Optimal mental state of complete focus and engagement',
          'Going with flow',
          'Relaxation',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Flow state is optimal mental performance with complete focus, achieved through skill-challenge balance.',
        points: 10,
      ),
      Question(
        id: 'psy_a1_2',
        question: 'How does "cognitive load" affect dealer performance?',
        options: [
          'Not relevant',
          'Mental processing burden that can overwhelm working memory and cause errors',
          'Physical load',
          'Game rules',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Cognitive load is mental processing burden that can overwhelm capacity and lead to errors under pressure.',
        points: 10,
      ),
      Question(
        id: 'psy_a1_3',
        question: 'What is "compassion fatigue" in customer-facing dealers?',
        options: [
          'Being mean',
          'Emotional exhaustion from constant empathy demands',
          'Physical tired',
          'Not caring',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Compassion fatigue is emotional exhaustion from continuous empathy and emotional labor demands.',
        points: 10,
      ),
      Question(
        id: 'psy_a1_4',
        question: 'How can dealers develop "mental toughness"?',
        options: [
          'Born with it',
          'Practice stress exposure, positive thinking, goal setting, self-discipline',
          'Impossible',
          'Age',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Mental toughness develops through controlled stress exposure, positive thinking, goal-setting, and discipline.',
        points: 10,
      ),
      Question(
        id: 'psy_a1_5',
        question:
            'What is "attention residue" and how does it affect dealers between tables?',
        options: [
          'Physical residue',
          'Mental focus remaining on previous task, reducing performance on next task',
          'Not real',
          'Cleaning',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Attention residue is lingering focus on previous tasks that impairs performance on new tasks.',
        points: 10,
      ),
      Question(
        id: 'psy_a1_6',
        question: 'How do elite dealers manage "performance anxiety"?',
        options: [
          'Avoid pressure',
          'Breathing techniques, visualization, routine, reframe anxiety as excitement',
          'Medication',
          'Ignore it',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Elite dealers use breathing, visualization, routines, and reframe anxiety as excitement to manage nerves.',
        points: 10,
      ),
      Question(
        id: 'psy_a1_7',
        question: 'What is "metacognition" and why is it valuable for dealers?',
        options: [
          'Beyond cognition',
          'Thinking about thinking; enables self-monitoring and self-correction',
          'Meta games',
          'Advanced rules',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Metacognition is awareness of one\'s thinking processes, enabling effective self-monitoring and correction.',
        points: 10,
      ),
      Question(
        id: 'psy_a1_8',
        question: 'How should dealers cultivate "psychological flexibility"?',
        options: [
          'Physical stretching',
          'Adapt thinking/behavior to changing situations without losing values',
          'Being weak',
          'No principles',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Psychological flexibility means adapting thoughts and behaviors to situations while maintaining core values.',
        points: 10,
      ),
    ],
  ),

  // Expert
  Quiz(
    id: 'psychology_expert_1',
    title: 'Expert Dealer Mental Mastery',
    category: QuizCategory.dealerPsychology,
    difficulty: DifficultyLevel.expert,
    timeLimit: 600,
    passingScore: 85,
    requiredScore: 1100,
    questions: [
      Question(
        id: 'psy_e1_1',
        question:
            'What is "deliberate practice" and how does it differ from regular experience?',
        options: [
          'Slow practice',
          'Focused improvement on specific weaknesses with feedback, not just repetition',
          'Careful work',
          'Years only',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Deliberate practice involves focused work on specific weaknesses with feedback, beyond mere repetition.',
        points: 10,
      ),
      Question(
        id: 'psy_e1_2',
        question: 'How do expert dealers develop "unconscious competence"?',
        options: [
          'Sleep',
          'Extensive practice until skills become automatic, freeing conscious mind',
          'Never learn',
          'Luck',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Unconscious competence develops through extensive practice until skills become automatic and effortless.',
        points: 10,
      ),
      Question(
        id: 'psy_e1_3',
        question: 'What is "cognitive reappraisal" in stress management?',
        options: [
          'Forgetting',
          'Reinterpreting situations to change emotional response',
          'Denial',
          'Approval',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Cognitive reappraisal involves reinterpreting situations to generate different, more adaptive emotional responses.',
        points: 10,
      ),
      Question(
        id: 'psy_e1_4',
        question:
            'How does "growth mindset" vs "fixed mindset" affect dealer development?',
        options: [
          'No difference',
          'Growth mindset sees abilities as developable, leading to continuous improvement',
          'Age factor',
          'Talent only',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Growth mindset views abilities as developable through effort, enabling continuous improvement vs fixed limitations.',
        points: 10,
      ),
      Question(
        id: 'psy_e1_5',
        question:
            'What is "working memory capacity" and how does it impact dealing complex games?',
        options: [
          'Memory time',
          'Ability to hold and manipulate information; critical for tracking multiple elements',
          'Past memory',
          'Computer memory',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Working memory capacity enables holding and manipulating multiple information elements simultaneously during complex games.',
        points: 10,
      ),
      Question(
        id: 'psy_e1_6',
        question:
            'How do elite dealers use "mental imagery" for performance enhancement?',
        options: [
          'Daydreaming',
          'Visualizing perfect execution to strengthen neural pathways and build confidence',
          'Pictures',
          'Not useful',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Mental imagery involves visualizing perfect performance to strengthen neural pathways and boost confidence.',
        points: 10,
      ),
      Question(
        id: 'psy_e1_7',
        question:
            'What is "self-efficacy" and how does it affect dealer performance under pressure?',
        options: [
          'Efficiency',
          'Belief in one\'s ability to succeed; high self-efficacy improves pressure performance',
          'Self-esteem',
          'Energy',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Self-efficacy is belief in one\'s capabilities; higher self-efficacy leads to better performance under pressure.',
        points: 10,
      ),
      Question(
        id: 'psy_e1_8',
        question:
            'What is "psychological capital" and how do dealers build it?',
        options: [
          'Money',
          'Hope, efficacy, resilience, and optimism; built through experience and reflection',
          'Mental bank',
          'City',
        ],
        correctAnswerIndex: 1,
        category: QuizCategory.dealerPsychology,
        explanation:
            'Psychological capital combines hope, efficacy, resilience, and optimism, developed through experience and reflection.',
        points: 10,
      ),
    ],
  ),
];
