import '../models/image_find_item.dart';

List<Map<String, String>> items = [];

List<Map<String, String>> options = [];

String targetImage = "";

List<ImageFindItem> imageItems = [];

String match = "";

String berawalan = "";

String kvkv = "";
String option2 = "";
String option3 = "";
String option4 = "";
String appbar = "";
bool isAudioPlayerReady = false;
String assetLocation = "";
String assetName = "";

bool pilih1 = false;
bool pilih2 = false;
bool pilih3 = false;
bool pilih4 = false;
bool timer = false;
bool awal = false;

String voice = "";
String extra1 = "";
String extratext1 = "";
String extra2 = "";
String extratext2 = "";
String extra3 = "";
String extratext3 = "";
String extra4 = "";
String extratext4 = "";
List<String> itemstext = [];
List<String> extraTexts = [];
List<String> images = [];

String sound = "";

bool aktivast1 = false;

// aktivitas 2----------
bool aktivast21 = false;
bool aktivast22 = false;
bool aktivast23 = false;
bool aktivast24 = false;
bool aktivast25 = false;
bool aktivast26 = false;
bool aktivast27 = false;
bool aktivast28 = false;

//-------------------------

// aktivitas 2----------
bool aktivast31 = false;
bool aktivast32 = false;
bool aktivast33 = false;

//-------------------------

// aktivitas 3----------
bool aktivast4 = false;
//-------------------------

// aktivitas 3----------
List<String> options4 = [];
List<String> answer = [];
List<String> correctAnswer = [];
//-------------------------

// aktivitas 5----------
bool aktivast5 = false;
//-------------------------

// aktivitas 6----------
bool aktivast61 = false;
bool aktivast62 = false;
bool aktivast63 = false;

//-------------------------

// aktivitas 7----------
bool aktivast7 = false;
//-------------------------

int aktivitas2 = 0;
int aktivitas3 = 0;
int aktivitas6 = 0;
int point = 0;

//------ susu--------
bool susu1 = false;
bool susu2 = false;
bool susu3 = false;
bool susu4 = false;
bool susu5 = false;
bool susu6 = false;

//------ sawi--------
bool sawi1 = false;
bool sawi2 = false;
bool sawi3 = false;
bool sawi4 = false;
bool sawi5 = false;
bool sawi6 = false;

//------ sapu--------
bool sapu1 = false;
bool sapu2 = false;
bool sapu3 = false;
bool sapu4 = false;
bool sapu5 = false;
bool sapu6 = false;

//------ siku--------
bool siku1 = false;
bool siku2 = false;
bool siku3 = false;
bool siku4 = false;
bool siku5 = false;
bool siku6 = false;

//------ soda--------
bool soda1 = false;
bool soda2 = false;
bool soda3 = false;
bool soda4 = false;
bool soda5 = false;
bool soda6 = false;

//------ bibir--------
bool bibir1 = false;
bool bibir2 = false;
bool bibir3 = false;
bool bibir4 = false;
bool bibir5 = false;
bool bibir6 = false;

//------ badak--------
bool badak1 = false;
bool badak2 = false;
bool badak3 = false;
bool badak4 = false;
bool badak5 = false;
bool badak6 = false;

//------ botol--------
bool botol1 = false;
bool botol2 = false;
bool botol3 = false;
bool botol4 = false;
bool botol5 = false;
bool botol6 = false;

//------ bayam--------
bool bayam1 = false;
bool bayam2 = false;
bool bayam3 = false;
bool bayam4 = false;
bool bayam5 = false;
bool bayam6 = false;

//------ beras--------
bool beras1 = false;
bool beras2 = false;
bool beras3 = false;
bool beras4 = false;
bool beras5 = false;
bool beras6 = false;

//------soal1------
bool soal1 = false;
bool soal2 = false;
bool soal3 = false;
bool soal4 = false;
bool soal5 = false;
bool soal6 = false;

String soundAsesmen = '';
String levelSoundAsesmen = '';
// aktivitas 3----------
List<dynamic> optionsAsesmen = [];
List<dynamic> answerAsesmen = [];
List<dynamic> correctAnswerAsesmen = [];

int games1 = 0;
int games2 = 0;
int games3 = 0;
int games4 = 0;

bool ujian1 = false;
bool ujian2 = false;
bool ujian3 = false;
bool ujian4 = false;
bool ujian5 = false;
bool ujian6 = false;
bool ujian7 = false;
bool ujian8 = false;
bool ujian9 = false;
bool ujian10 = false;

int ujian = 0;

int level = 0;
int activity = 0;
bool answerAssesment = false;
int questionId = 0;

bool soalujian1 = false;
bool soalujian2 = false;
bool soalujian3 = false;
bool soalujian4 = false;
bool soalujian5 = false;
bool soalujian6 = false;
bool soalujian7 = false;
bool soalujian8 = false;
bool soalujian9 = false;
bool soalujian10 = false;

//games2

bool level21 = false;
bool level22 = false;
bool level23 = false;
bool level24 = false;
bool level25 = false;
bool level26 = false;
bool level27 = false;
bool level28 = false;
bool level29 = false;
bool level210 = false;
bool level211 = false;
bool level212 = false;
bool level213 = false;
bool level214 = false;
bool level215 = false;
bool level216 = false;
bool level217 = false;
bool level218 = false;
bool level219 = false;
bool level220 = false;
bool level221 = false;
bool level222 = false;
bool level223 = false;
bool level224 = false;
bool level225 = false;
bool level226 = false;
bool level227 = false;
bool level228 = false;
bool level229 = false;
bool level230 = false;

bool level41 = false;
bool level42 = false;
bool level43 = false;
bool level44 = false;
bool level45 = false;

bool level46 = false;
bool level47 = false;
bool level48 = false;
bool level49 = false;
bool level40 = false;

bool level51 = false;
bool level52 = false;
bool level53 = false;
bool level54 = false;
bool level55 = false;
bool level56 = false;
bool level57 = false;
bool level58 = false;
bool level59 = false;
bool level50 = false;
