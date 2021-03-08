import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app_ui/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final images = [
    "images/burger.jpg",
    "images/chicken_g.jpg",
    "images/chiken_f.jpeg",
    "images/pizza.jpg",
    "images/spaghetti.jpg",
  ];

  final foodNames = [
    "Hamburguer Grelhado",
    "Frango Grelhado",
    "Frango Frito Crocante",
    "Pizza",
    "Massa",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: ("Recipes"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: ("Subscription"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: ("Settings"),
          ),
        ],
        iconSize: 30,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text("Procurando sua refeição favorita",
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 30,
                            )),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.grey[800],
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications_none),
                        color: Colors.grey[800],
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  height: size.height * 0.25,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return AspectRatio(
                            aspectRatio: 0.9 / 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: ClipRRect(
                                      child: Image.asset(
                                        images[index],
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    " Receitas de ${foodNames[index]} ",
                                    style: GoogleFonts.roboto(
                                      color: Colors.grey[800],
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              ],
                            ),
                      );
                    },
                    separatorBuilder: (context, _) => SizedBox(
                      width: 16,
                    ),
                    itemCount: 5,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  height: size.height * 0.4,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {

                      return GestureDetector(

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                images[4 - index],
                              ),
                            ),
                          );
                        },

                        child: AspectRatio(
                            aspectRatio: 0.9 / 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Hero(
                                    child: Container(
                                      child: ClipRRect(
                                        child: Image.asset(
                                          images[4 - index],
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    tag: images[4 - index],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    " Receitas de ${foodNames[4 - index]} ",
                                    style: GoogleFonts.roboto(
                                      color: Colors.grey[800],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    " Receitas feitas por Luis H. ",
                                    style: GoogleFonts.roboto(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      );
                    },
                    separatorBuilder: (context, _) => SizedBox(
                      width: 16,
                    ),
                    itemCount: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
