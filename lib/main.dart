import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_app/details.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late List<FruitsItem> items = [
    const FruitsItem(title: "Apple", image: 'assets/images/apple_image.png'),
    const FruitsItem(title: "Orange", image: 'assets/images/orange_image.png'),
    const FruitsItem(title: "Mango", image: 'assets/images/mango_image.png'),
    const FruitsItem(title: "Watermelon", image: 'assets/images/watermelon.png'),
    const FruitsItem(title: "Apple", image: 'assets/images/apple_image.png'),
    const FruitsItem(title: "Orange", image: 'assets/images/orange_image.png'),
    const FruitsItem(title: "Mango", image: 'assets/images/mango_image.png'),
    const FruitsItem(title: "Watermelon", image: 'assets/images/watermelon.png'),
    const FruitsItem(title: "Apple", image: 'assets/images/apple_image.png'),
    const FruitsItem(title: "Orange", image: 'assets/images/orange_image.png'),
    const FruitsItem(title: "Mango", image: 'assets/images/mango_image.png'),
    const FruitsItem(title: "Watermelon", image: 'assets/images/watermelon.png')
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScroller) {
            return <Widget>[
              CupertinoSliverNavigationBar(
                leading: const Icon(
                  Icons.menu_open,
                  color: Colors.black54,
                ),
                largeTitle: const Text("Deliver to"),
                border:
                    const Border(bottom: BorderSide(color: Colors.transparent)),
                trailing: Icon(Icons.shopping_cart_outlined,
                    color: parseColor("#1EBF8E")),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8, left: 20),
                    child: Text(
                      "23 Main Street , Mumbai",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: parseColor("#F2F2F2"),
                    shadowColor: Colors.transparent,
                    child: const ListTile(
                      minLeadingWidth: 10,
                      leading: Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),
                      title: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for a Grocery',
                          hintStyle:
                              TextStyle(fontSize: 15.0, color: Colors.black87),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16, left: 20.0, right: 20),
                  child: Wrap(
                      // width:double.maxFinite,
                      // padding: const EdgeInsets.only(top: 25),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                            isScrollable: true,
                            indicator: MaterialIndicator(
                              height: 2,
                              topLeftRadius: 2,
                              topRightRadius: 2,
                              bottomLeftRadius: 2,
                              bottomRightRadius: 2,
                              horizontalPadding: 0,
                              tabPosition: TabPosition.bottom,
                              color: parseColor("#1EBF8E").withAlpha(130),
                            ),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.black54,
                            indicatorSize: TabBarIndicatorSize.label,
                            controller: _tabController,
                            tabs: const [
                              Tab(text: "Fruits"),
                              Tab(text: "Vegetables"),
                              Tab(text: "Grocery"),
                              Tab(text: "test4"),
                              Tab(text: "test5"),
                            ],
                          ),
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            primary: true,
                            physics: const ScrollPhysics(),
                            itemCount: items.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 2.2 / 3,
                                    crossAxisSpacing: 15),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                child: items[index],
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  FruitsDetails(item: items[index],)),
                                  );
                                },
                              );
                            }),
                      ]),
                ),
              ],
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

Color parseColor(String color) {
  String hex = color.replaceAll("#", "");
  if (hex.isEmpty) hex = "ffffff";
  if (hex.length == 3) {
    hex =
        '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
  }
  Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
  return col;
}
