import 'package:flutter/cupertino.dart';

class IosStyleScreen extends StatefulWidget {
  const IosStyleScreen({super.key});

  @override
  State<IosStyleScreen> createState() => _IosStyleScreenState();
}

class _IosStyleScreenState extends State<IosStyleScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Cupertino A'),
        ),
          child: Center(
            child: Text('Cupertino App')
          )
      ),
    );
  }
}
