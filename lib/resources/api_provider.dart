import 'package:normandy_aviatrainer/models/user.dart';

import '../models/category.dart';
import '../models/question.dart';

const String baseUrl = "https://opentdb.com/api.php";

Future<List<Question>> getQuestions(
    Category category, int total, String difficulty) async {
  // String url = "$baseUrl?amount=$total&category=${category.id}";
  // if (difficulty != "null") {
  //   url = "$url&difficulty=$difficulty";
  // }
  // http.Response res = await http.get(Uri.parse(url));
  // List<Map<String, dynamic>> questions =
  //     List<Map<String, dynamic>>.from(json.decode(res.body)["results"]);

  List<Map<String, dynamic>> questions = [
    {
      'category': 'Вводный урок',
      'type': 'multiple',
      'difficulty': 'easy',
      'question':
          'В какое состояние самолёт должен попасть, чтобы войти в штопор?',
      'info':
          'Штопор самолёта - движение самолёта по вертикальной нисходящей спирали малого радиуса при больших углах атаки, возникающее после потери скорости полёта и сваливания. \n(Авиация: Энциклопедия. — М.: Большая Российская Энциклопедия. Главный редактор Г.П. Свищев. 1994)',
      'correct_answer': 'сваливание',
      'incorrect_answers': [
        'в крутую снижающуюся спираль',
        'частичное сваливание с опущенным одним крылом',
        // 'Неправильный ответ 3',
        // 'Неправильный ответ 4',
        // 'Неправильный ответ 5',
      ],
    },
    {
      'category': 'Вводный урок',
      'type': 'multiple',
      'difficulty': 'easy',
      'question': 'Критический угол атаки крыла "альфа" крит:',
      'info':
          'Угол атаки, при котором подъёмная сила достигает максимального значения, называется критическим углом атаки αкр. Здесь cy - коэффициент подъёмной силы, а как известно, коэффициент cy связан с подъёмной силой Y соотношением: cy = Y / ϱV^2 / 2 * S, поэтому все приведённые рассуждения относительно подъёмной силы справедливы и для её коэффициента. \n(Аэродинамика и динамика полёта летательных аппаратов. В. Б. Байдаков, А. С. Клумов. Изд-во: Машиностроение, 1979 г.)',
      'correct_answer':
          'угол атаки, при котором Су достигает максимального значения',
      'incorrect_answers': [
        'угол атаки, при котором на крыле начинают наблюдаться местные срывные явления',
        'угол атаки, при котором перегрузка при маневрировании достигает критического значения',
      ],
    },
    {
      'category': 'Вводный урок',
      'type': 'boolean',
      'difficulty': 'easy',
      'question':
          'Исходя из каких условий необходимо ограничить наиболее заднее положение центра тяжести?',
      'info':
          'Касторский В.Е. ОСНОВЫ АЭРОДИНАМИКИ И ДИНАМИКИ ПОЛЕТА \nНепосредственное влияние центровки самолета на степень его устойчивости по перегрузке определяет жесткие требования к точному определению центровки и ее выдерживанию в процессе загрузки самолета и летной эксплуатации. При неизменном положении фокуса смещение центра масс вперед приводит к увеличению запаса устойчивости по перегрузке. Увеличение центровки обусловливает уменьшение запаса продольной устойчивости и при совпадении центра масс самолета с фокусом запас устойчивости становится нулевым.',
      'correct_answer':
          'из условий создания запаса продольной устойчивости самолёта по перегрузке',
      'incorrect_answers': [
        'из условий создания большей продольной устойчивости самолёта',
        'из условий создания меньшей продольной управляемости самолёта',
        // 'Неправильный ответ 3',
        // 'Неправильный ответ 4',
        // 'Неправильный ответ 5',
      ],
    },
  ];
  return Question.fromData(questions);
}

final List<User> users = [
  User(name: 'admin', password: 'admin'),
  User(name: 'ivan', password: '12345')
];


  // final String categoryName;
  // final Type type;
  // final Difficulty difficulty;
  // final String question;
  // final String correctAnswer;
  // final List<dynamic> incorrectAnswers;

    //  : categoryName = data["category"],
    //     type = data["type"] == "multiple" ? Type.multiple : Type.boolean,
    //     difficulty = data["difficulty"] == "easy"
    //         ? Difficulty.easy
    //         : data["difficulty"] == "medium"
    //             ? Difficulty.medium
    //             : Difficulty.hard,
    //     question = data["question"],
    //     correctAnswer = data["correct_answer"],
    //     incorrectAnswers = data["incorrect_answers"];