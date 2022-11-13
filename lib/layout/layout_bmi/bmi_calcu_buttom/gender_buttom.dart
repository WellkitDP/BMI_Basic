part of 'bmi_service_buttom.dart';

class GenderButtom extends StatefulWidget {
  final Function(int) onChange;

  const GenderButtom({Key? key, required this.onChange}) : super(key: key);

  @override
  State<GenderButtom> createState() => _GenderButtomState();
}

class _GenderButtomState extends State<GenderButtom> {
  int _gender = 0;

  final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
      topColor: Colors.grey[200]!,
      backColor: Colors.grey,
      borderRadius: BorderRadius.circular(20));

  final ChoiceChip3DStyle unselectedStyle = ChoiceChip3DStyle(
      topColor: Colors.white,
      backColor: Colors.grey[300]!,
      borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: _gender == 1 ? selectedStyle : unselectedStyle,
            onSelected: () {
              setState(() {
                _gender = 1;
              });
              widget.onChange(_gender);
            },
            onUnSelected: () {},
            selected: _gender == 1,
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Image.asset(
                  "assets/images/man.png",
                  width: 50,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text('Male'),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: _gender == 2 ? selectedStyle : unselectedStyle,
            onSelected: () {
              setState(() {
                _gender = 2;
              });
              widget.onChange(_gender);
            },
            onUnSelected: () {},
            selected: _gender == 2,
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Image.asset(
                  "assets/images/woman.png",
                  width: 50,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text('Woman'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
