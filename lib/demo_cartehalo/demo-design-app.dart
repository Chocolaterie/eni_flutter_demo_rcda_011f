import 'package:flutter/material.dart';

import 'blend-mask.dart';

void main() {
  runApp(DemoNavApp());
}

class DemoNavApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Demo Nav",
        home: PageOne());
  }
}

const w_card =256.0;
const h_card = 500.0;

class PageOne extends StatefulWidget {
  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> with SingleTickerProviderStateMixin {

  late AnimationController haloController;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    haloController = AnimationController(vsync: this,
    duration: Duration(seconds : 1));
    animation = Tween<double>(
      begin: 0.05, end : 0.95).animate(haloController);

    animation.addListener(() { setState(() {

    });});

    haloController.forward();
    haloController.addListener(() {
      if (haloController.isCompleted){
        haloController.repeat(reverse: true);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      body: Center(child:
      SizedBox(width: w_card, height: h_card, child:
      Stack(
        children: [
          Image.asset("images/carte.png"),
          BlendMask(
            Transform.translate(
              offset: Offset(animation.value*100, animation.value),
              child: Image.asset(
                'images/halo.png',
                repeat: ImageRepeat.repeat,
              ),
            ),
            opacity: (animation.value * 0.2) + 0.3,
            blendMode: BlendMode.plus,
          ),
          BlendMask(
            Image.asset(
              'images/star.png',
            ),
            opacity: 0.2,
            blendMode: BlendMode.plus,
          ),
          // Opacity(opacity: 0.5, child: Image.asset("images/halo.png",)),
          // Opacity(opacity: 0.5, child: Image.asset("images/star.png",))
        ],
      ),)),
    );
  }
}