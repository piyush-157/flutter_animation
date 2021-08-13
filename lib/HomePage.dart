import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double size1=0;
  double size2=0;
  double size3=0;
  double imageBottom = 10, imageRadius = 20, imageLeft = 15;
  double nameBottom = 22, nameLeft = 70, nameSize = 16;
  double hereBottom = 22, hereLeft = 118, hereSize = 16;
  int seconds = 0;
  bool isTapped = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("inti");
    Future.delayed(Duration.zero, (){
      setState(() {
        size1 = MediaQuery.of(context).size.height * 0.33;
        size2 = MediaQuery.of(context).size.height * 0.33;
        size3 = MediaQuery.of(context).size.height * 0.33;
      });
      // _showModal();
    });
  }

  onSheetClosed() {
    setState(() {
      size1 = MediaQuery.of(context).size.height * 0.33;
      size2 = MediaQuery.of(context).size.height * 0.33;
      size3 = MediaQuery.of(context).size.height * 0.33;
      imageBottom = 10; imageRadius = 20; imageLeft = 15;
      nameBottom = 22; nameLeft = 70; nameSize = 16;
      hereBottom = 22; hereLeft = 118; hereSize = 16;
    });
  }

  // void displayPersistentBottomSheet() {
  //   _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
  //     return Container(
  //       decoration: BoxDecoration(
  //           border: Border(top: BorderSide(color: Colors.black)),
  //           color: Colors.grey),
  //       child: Padding(
  //         padding: const EdgeInsets.all(32.0),
  //         child: Text(
  //           'This is a persistent bottom sheet. Drag downwards to dismiss it.',
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             fontSize: 24.0,
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  // }

  void _showModal() {
    Future<void> future = showModalBottomSheet<void>(
      context: context,
      barrierColor: Colors.black.withOpacity(0),
      builder: (BuildContext context) {
        return Container(
          height: 350.0,
          color: Colors.transparent, //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0))),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Photos",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "Likes",
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          Text(
                            "Collections",
                            style: TextStyle(
                                color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 160,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 0, 25),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: DelayedWidget(
                                  animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                                  animationDuration: Duration(seconds: 1),
                                  child: Container(
                                    // child: Image.asset("assets/plant1.jpg"),
                                    width: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/plant2.jpg"),
                                        fit: BoxFit.cover
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: DelayedWidget(
                                  animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                                  animationDuration: Duration(seconds: 1),
                                  delayDuration: Duration(milliseconds: 300),
                                  child: Container(
                                    // child: Image.asset("assets/plant1.jpg"),
                                    width: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/plant3.jpg"),
                                          fit: BoxFit.cover
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
        );
      },
    );
    future.then((void value) => _closeModal(value));
  }
  void _closeModal(void value) {
    print('modal closed');
    isTapped = false;
    onSheetClosed();
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {



    callBack() {
      setState(() {
        size1 = MediaQuery.of(context).size.height * 0;
        size3 = MediaQuery.of(context).size.height * 0;
        size2 = MediaQuery.of(context).size.height * 1;
        _showModal();
        imageBottom = 650;
        imageLeft = 35;
        imageRadius = 35;
        nameLeft = 35;
        hereLeft = 35;
        nameBottom = 595;
        nameSize = 40;
        hereSize = 40;
        hereBottom = 550;
        seconds = 1;
        isTapped = true;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Plants"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          AnimatedContainer(
            height: size1,
            duration: Duration(milliseconds: 500),
            alignment: Alignment.bottomLeft,
            child: ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/leading1.png"),
              ),
              title: Text(
                "Name Here",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/plant3.jpg"),
                fit:BoxFit.cover,
              )
            ),
          ),
          InkWell(
            onTap: () {
              callBack();
            },
            child: Opacity(
              opacity: 1,
              child: AnimatedContainer(
                width: MediaQuery.of(context).size.width,
                duration: Duration(milliseconds: 500),
                height: size2,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      bottom: imageBottom,
                      left: imageLeft,
                      child: CircleAvatar(
                        radius: imageRadius,
                        backgroundImage: AssetImage("assets/leading2.png"),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      left: nameLeft,
                      bottom: nameBottom,
                        child: Text(
                          "Name",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          fontSize: nameSize
                        ),
                    ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      bottom: hereBottom,
                      left: hereLeft,
                        child: Text(
                          "Here",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          fontSize: hereSize
                        ),
                      ),
                    ),
                    (isTapped == true) ? Positioned(
                      left: 35,
                      top: 270,
                      child: DelayedWidget(
                        animationDuration: Duration(seconds: 1),
                        animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                        child: Text(
                          "@xyz",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                    ): Visibility(child: Text(""), visible: false),
                    (isTapped == true) ? Positioned(
                      left: 35,
                      top: 330,
                      child: DelayedWidget(
                        animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                        animationDuration: Duration(seconds: 1),
                        child: RichText(
                          text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.location_on,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                    text: "City, Country"
                                ),
                              ]
                          ),
                        ),
                      ),
                    ):Visibility(child: Text(""), visible: false),
                    (isTapped)?Positioned(
                      left: 35,
                      top: 350,
                      child: DelayedWidget(
                        animationDuration: Duration(seconds: 1),
                        animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                        child: RichText(
                          text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: FaIcon(
                                    FontAwesomeIcons.instagram,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                                TextSpan(
                                    text: " Instagram handle here"
                                ),
                              ]
                          ),
                        ),
                      ),
                    ):Visibility(child: Text(""), visible: false),
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/plant1.jpg"),
                      fit: BoxFit.cover,
                    )
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: size3,
            alignment: Alignment.bottomLeft,
            child: ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/leading3.png"),
              ),
              title: Text(
                "Name Here",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/plant2.jpg"),
                  fit:BoxFit.cover,
                )
            ),
          )
        ],
      ),
    );
  }
}