import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Space {
  final String id;
  final String image;
  final String description;
  final String home;

  Space(
      {required this.id,
      required this.image,
      required this.description,
      required this.home});
}

final List<Space> spaces = [
  Space(
    id: '2830a9a4-ea96-11ea-adc1-0242ac120002',
    home: 'Lorem ipsum dolor sit, amet consectetur ...',
    image: 'assets/images/space_1.jpg',
    description:
        'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sapiente maiores soluta et recusandae facilis ex cum praesentium aliquam dolorem maxime, obcaecati non harum nostrum magni beatae adipisci tenetur iste expedita? Repellendus minima perferendis dolores modi eum fuga vitae id hic?',
  ),
  Space(
    id: 'a12a93a9-c656-4289-bd70-1a8b3285656c',
    home: 'Lorem ipsum dolor sit, amet consectetur ...',
    image: 'assets/images/space_2.jpg',
    description:
        'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sapiente maiores soluta et recusandae facilis ex cum praesentium aliquam dolorem maxime, obcaecati non harum nostrum magni beatae adipisci tenetur iste expedita? Repellendus minima perferendis dolores modi eum fuga vitae id hic? Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sapiente maiores soluta et recusandae facilis ex cum praesentium aliquam dolorem maxime, obcaecati non harum nostrum magni beatae adipisci tenetur iste expedita? Repellendus minima perferendis dolores modi eum fuga vitae id hic?',
  ),
  Space(
    id: 'd9f7ac72-fa2f-4fba-bcb7-4820a9b20593',
    home: 'Lorem ipsum dolor sit, amet consectetur ...',
    image: 'assets/images/space_3.jpg',
    description:
        'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sapiente maiores soluta et recusandae facilis ex cum praesentium aliquam dolorem maxime.',
  ),
  Space(
    id: 'f1fad323-322d-487b-afec-e1056cbf1231',
    home: 'Lorem ipsum dolor sit, amet consectetur ...',
    image: 'assets/images/space_4.jpg',
    description:
        'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sapiente maiores soluta et recusandae facilis ex cum praesentium aliquam dolorem maxime, obcaecati non harum nostrum magni beatae adipisci tenetur iste expedita? ',
  ),
  Space(
    id: 'c1a95799-73a2-4ab5-96e5-735f946a5e88',
    home: 'Lorem ipsum dolor sit, amet consectetur ...',
    image: 'assets/images/space_5.jpg',
    description:
        'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sapiente maiores soluta et recusandae facilis ex cum praesentium aliquam dolorem maxime.',
  ),
  Space(
    id: '1c54a008-044f-4417-a5e0-419a5d7b2c16',
    home: 'Lorem ipsum dolor sit, amet consectetur ...',
    image: 'assets/images/space_6.jpg',
    description:
        'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sapiente maiores soluta et recusandae facilis ex cum praesentium aliquam dolorem maxime, obcaecati non harum nostrum magni beatae adipisci tenetur iste expedita? Repellendus minima perferendis dolores modi eum fuga vitae id hic?',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double pad = (MediaQuery.of(context).size.width / 100) * 5;
    return Scaffold(
      appBar: AppBar(title: Text("Animations")),
      body: SafeArea(
          child: ListView.builder(
        itemCount: spaces.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: pad / 5,
              top: pad / 5,
              bottom: pad / 5 * 4,
            ),
            child: Column(
              children: [
                InkWell(
                  child: Hero(
                    tag: spaces[index].id,
                    child: Container(
                      width: (MediaQuery.of(context).size.width / 100) * 90,
                      height: (MediaQuery.of(context).size.height / 100) * 12,
                      decoration: new BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(spaces[index].image.toString()),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(10.0),
                              topRight: const Radius.circular(10.0))),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailView(
                              data: spaces[index],
                            )));
                  },
                ),
                Stack(overflow: Overflow.visible, children: [
                  Container(
                    width: (MediaQuery.of(context).size.width / 100) * 90,
                    height: (MediaQuery.of(context).size.height / 100) * 8,
                    decoration: new BoxDecoration(
                        color: Colors.grey,
                        borderRadius: new BorderRadius.only(
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0))),
                    child: Padding(
                      padding: EdgeInsets.only(left: pad) / 5 * 6,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Hero(
                          tag: "${spaces[index].id}-title",
                          child: Material(
                            color: Colors.grey,
                            child: Text(spaces[index].home),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 45,
                    child: Hero(
                      tag: "${spaces[index].id}-button",
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.yellow,
                        child: Icon(Icons.play_arrow),
                      ),
                    ),
                  )
                ])
              ],
            ),
          );
        },
      )),
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.data}) : super(key: key);
  final Space data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("")),
        body: Column(children: [
          Stack(
            children: [
              Hero(
                tag: data.id,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height / 100) * 25,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(data.image.toString()),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 0,
                child: Hero(
                  tag: "${data.id}-button",
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.yellow,
                    child: Icon(Icons.play_arrow),
                  ),
                ),
              ),
            ],
          ),
          Hero(
            tag: "${data.id}-title",
            child: Material(
              child: Text(data.description),
            ),
          ),
        ]));
  }
}
