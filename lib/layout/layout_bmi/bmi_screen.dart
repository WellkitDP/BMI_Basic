part of 'bmi_layout_service.dart';

class BMIScreenPage extends StatefulWidget {
  const BMIScreenPage({Key? key}) : super(key: key);

  @override
  State<BMIScreenPage> createState() => _BMIScreenPageState();
}

class _BMIScreenPageState extends State<BMIScreenPage> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinish = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Card(
            elevation: 12,
            shape: RoundedRectangleBorder(),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('What Your Gender :'),
                //gender bottom
                GenderButtom(
                  onChange: (genderVal) {
                    _gender = genderVal;
                  },
                ),
                HeightBottom(
                  onChange: (heighVal) {
                    _height = heighVal;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgeWeightBottom(
                      onChange: (ageVal) {
                        _age = ageVal;
                      },
                      title: "Age",
                      iniValue: 30,
                      min: 0,
                      max: 100,
                    ),
                    AgeWeightBottom(
                      onChange: (weightVal) {
                        _weight = weightVal;
                      },
                      title: "Weight",
                      iniValue: 50,
                      min: 0,
                      max: 200,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: SwipeableButtonView(
                    isFinished: _isFinish,
                    onFinish: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                            child: ScreenScore(
                              bmiScore: _bmiScore,
                              age: _age,
                            ),
                            type: PageTransitionType.fade),
                      );
                      setState(() {
                        _isFinish = false;
                      });
                    },
                    onWaitingProcess: () {
                      calculateBmi();

                      Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          _isFinish = true;
                        });
                      });
                    },
                    activeColor: Colors.blue,
                    buttonWidget: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                    buttonText: 'Calculate',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
