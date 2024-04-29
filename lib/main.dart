import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() => runApp(SplashScreenApp());

class SplashScreenApp extends StatefulWidget {
  const SplashScreenApp({Key? key}) : super(key: key);

  @override
  _SplashScreenAppState createState() => _SplashScreenAppState();
}

class _SplashScreenAppState extends State<SplashScreenApp> {
  bool showSplashScreen = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showSplashScreen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: showSplashScreen ? SplashScreen() : NavigationBarApp(),
    );
  }
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({Key? key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return MaterialApp(
      theme: theme.copyWith(useMaterial3: true),
      home: Scaffold(
        body: Column(
          children: [
            CustomHeaderWithImage(), // 在所有页面顶部显示的自定义头部
            Expanded(
              child: IndexedStack(
                index: currentPageIndex,
                children: <Widget>[
// Page 1: Home
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '요약하는데는 약 2분 정도 시간이 걸릴 수 있어요!',
                            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            '녹음 파일을 첨부해 주세요.',
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () {
                              // Add functionality to attach recording file
                            },
                            child: Text('첨부하기'),
                          ),
                          SizedBox(height: 10.0),
                          ElevatedButton(
                            onPressed: () {
                              // Add functionality to generate summary
                            },
                            child: Container(
                              width: 325,
                              height: 50.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/buttom.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '요약 생성하기',
                                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),





                  // 页面2: Notifications
                  Center(child: Text('Notifications Page')),

                  // 页面3: Messages
                  Center(child: Text('Messages Page')),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey,
          backgroundColor: theme.backgroundColor,
          onTap: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Badge(
                  child: Image.asset(
                    "assets/icons/1.png",
                    width:40.43,
                    height:40.98,)),
              label: 'Home',

            ),
            BottomNavigationBarItem(
              icon: Badge(
                  child: Image.asset(
                    "assets/icons/2.png",
                    width:40.43,
                    height:40.98,)),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Badge(
                  child: Image.asset(
                    "assets/icons/3.png",
                    width:40.43,
                    height:40.98,)),
              label: 'Messages',
            ),
          ],
        ),
      ),
    );
  }
}


class CustomHeaderWithImage extends StatelessWidget {
  final double headerHeight = 150.0; // 你的头部容器高度

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0), // 添加30px的上边距
      child: SizedBox(
        height: headerHeight,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/icons/4.png',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/top_logo.png',
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'DAKUA',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    textAlign: TextAlign.center,
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
