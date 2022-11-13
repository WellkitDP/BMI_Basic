part of 'bmi_service_buttom.dart';

class AgeWeightBottom extends StatefulWidget {
  final Function(int) onChange;

  final String title;

  final int iniValue;

  final int min;

  final int max;

  const AgeWeightBottom(
      {Key? key,
      required this.onChange,
      required this.title,
      required this.iniValue,
      required this.min,
      required this.max})
      : super(key: key);

  @override
  State<AgeWeightBottom> createState() => _AgeWeightBottomState();
}

class _AgeWeightBottomState extends State<AgeWeightBottom> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    counter = widget.iniValue;
  }

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
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      setState(
                        () {
                          if (counter > widget.min) {
                            counter--;
                          }
                        },
                      );
                      widget.onChange(counter);
                    },
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    counter.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if (counter < widget.max) {
                          counter++;
                        }
                      });
                      widget.onChange(counter);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
