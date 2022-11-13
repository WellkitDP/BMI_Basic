part of 'bmi_service_buttom.dart';

class HeightBottom extends StatefulWidget {
  final Function(int) onChange;

  const HeightBottom({Key? key, required this.onChange}) : super(key: key);

  @override
  State<HeightBottom> createState() => _HeightBottomState();
}

class _HeightBottomState extends State<HeightBottom> {
  int _height = 150;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        color: Color.fromARGB(207, 182, 182, 182),
        elevation: 12,
        shape: RoundedRectangleBorder(),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Height',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _height.toString(),
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Cm',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Slider(
              min: 0,
              max: 240,
              value: _height.toDouble(),
              onChanged: (value) {
                setState(
                  () {
                    _height = value.toInt();
                  },
                );
                widget.onChange(_height);
              },
            ),
          ],
        ),
      ),
    );
  }
}
