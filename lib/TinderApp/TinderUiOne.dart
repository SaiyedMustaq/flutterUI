import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

class TinderAppUiOne extends StatefulWidget {
  const TinderAppUiOne({Key? key}) : super(key: key);

  @override
  _TinderAppUiOneState createState() => _TinderAppUiOneState();
}

class _TinderAppUiOneState extends State<TinderAppUiOne> {
  List img = [
    'https://media.istockphoto.com/photos/self-management-is-a-freelancers-greatest-tool-picture-id1294442411?b=1&k=20&m=1294442411&s=170667a&w=0&h=DzebibUiw8fb056LdMdG5oKURp9LJHfohv_nSG1d764=',
    'https://images.pexels.com/photos/2700587/pexels-photo-2700587.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://gank.io/images/31f92f7845f34f05bc10779a468c3c13',
    'https://images.pexels.com/photos/1777689/pexels-photo-1777689.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/1678829/pexels-photo-1678829.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
  ];
  late TCardController _tcard = TCardController();
  var directionSwip, showInswer;
  var value;
  Future refresh() async {
    await Future.delayed(const Duration(seconds: 1));
    _tcard.reset();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 0),
            child: AppBar(
              // backgroundColor: Colors.white,
              // foregroundColor: Colors.red,
              // backgroundColor :Colors.white,
              // elevation: 18,
              title: Text('Tinder One'),
            ),
          )),
      body: Center(
        child: RefreshIndicator(
            onRefresh: refresh,
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverToBoxAdapter(
                      child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TCard(
                        controller: _tcard,
                        slideSpeed: 20,
                        delaySlideFor: 500,
                        lockYAxis: false,
                        onBack: (val, __) {
                          setState(() {
                            print("===========onBack ($val) ($__)============");
                          });
                        },
                        onForward: (val, __) {
                          setState(() {
                            print(
                                "===========onForward ($val) (${__.direction})============");
                            directionSwip = __.direction;
                            if (directionSwip == SwipDirection.Right) {
                              showInswer = "right";
                              print("************* $showInswer");
                            } else {
                              showInswer = "left";
                              print("************* $showInswer");
                            }
                          });
                        },
                        onEnd: () {
                          setState(() {
                            print("===========OnEnd============");
                          });
                        },
                        size: const Size(double.infinity, 600),
                        cards: List.generate(
                          img.length,
                          (int index) {
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    img[index],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18.0),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 17),
                                    blurRadius: 23.0,
                                    spreadRadius: -13.0,
                                    color: Colors.black54,
                                  )
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.red.shade100,
                                          child: CircleAvatar(
                                              backgroundColor: Colors.red,
                                              radius: 30,
                                              child: IconButton(
                                                iconSize: 34,
                                                icon: const Icon(Icons.close),
                                                onPressed: () async {
                                                  setState(() {
                                                    value = 0;
                                                  });
                                                  // await Future.delayed(const Duration(seconds: 1));
                                                  try {
                                                    _tcard.forward(
                                                        direction:
                                                            SwipDirection.Left);
                                                  } catch (e) {
                                                    print("EROR $e ======");
                                                  }
                                                },
                                              )),
                                        ),
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.blue.shade100,
                                          child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.blueAccent,
                                              radius: 20,
                                              child: IconButton(
                                                iconSize: 20,
                                                icon: const Icon(Icons.star),
                                                onPressed: () async {
                                                  setState(() {
                                                    value = 1;
                                                  });
                                                  // await Future.delayed(const Duration(seconds: 1));
                                                  try {
                                                    _tcard.forward(
                                                        direction: SwipDirection
                                                            .Right);
                                                  } catch (e) {
                                                    print("EROR $e ======");
                                                  }
                                                },
                                              )),
                                        ),
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.greenAccent,
                                          child: CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 30,
                                              child: IconButton(
                                                iconSize: 34,
                                                icon:
                                                    const Icon(Icons.favorite),
                                                onPressed: () async {
                                                  setState(() {
                                                    value = 1;
                                                  });
                                                  // await Future.delayed(const Duration(seconds: 1));
                                                  try {
                                                    _tcard.forward(
                                                        direction: SwipDirection
                                                            .Right);
                                                  } catch (e) {
                                                    print("EROR $e ======");
                                                  }
                                                },
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ))
                ])),
      ),
    );
  }
}
