import 'package:animals/Models/animalModels.dart';
import 'package:animals/Screens/animal_details.dart';
import 'package:animals/Widgets/AnimalsCard.dart';
import 'package:flutter/material.dart';


class AnimalsList extends StatefulWidget {
  @override
  _AnimalsListState createState() => _AnimalsListState();
}


class _AnimalsListState extends State<AnimalsList> with SingleTickerProviderStateMixin{
  List<Animal> animalslist =[
        Animal(Color(0xFFe86007), "Kopek", "preamble", "text", "lifespan", 23),
        Animal(Color(0xFFf2b369), "Tavsan", "preamble", "text", "lifespan", 23),
        Animal(Color(0xFF324538), "Ayi", "preamble", "text", "lifespan", 23),
        Animal(Color(0xFF5a967a), "Kedi", "preamble", "text", "lifespan", 23),
        Animal(Color(0xFFc6321e), "Panda", "preamble", "text", "lifespan", 23),
        Animal(Color(0xFFacb1aa), "Ördek", "preamble", "text", "lifespan", 23),
        Animal(Color(0xFFfadbb0), "Zürafa", "preamble", "text", "lifespan", 23),
        Animal(Color(0xFFe86007), "Domuz", "preamble", "text", "lifespan", 23)
      ];
  double x=0.0;
  double xx=0;
  AnimationController _animationCont;
  @override
  void initState() {
    super.initState();
    _animationCont=AnimationController(vsync: this,duration: Duration(milliseconds: 550),upperBound: 0.4,lowerBound: 0.0);
    
    _animationCont.addListener(() { 
      setState(() {
        print(_animationCont.value);
        
      });
    });
  }
  @override
  void dispose() {
    _animationCont.dispose();
    super.dispose();
  }
  
 _onUpdateScroll(ScrollMetrics metrics) {
     //metrics.pixels;
     double updown;
     if(xx<metrics.pixels){
       updown=-0.4;
     }
     else{
       updown=0.4;
     }
     
     
     xx=metrics.pixels;
      setState(() {
        x=-updown;
        
             });
    }_onEndScroll(ScrollMetrics metrics) {
      setState(() {
        x=0;
      });
    }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.menu,size: 35,),
                  Text("Hayvanlar", style: TextStyle(color: Colors.black,fontSize: 30),),
                  Image.asset("assets/images/image_part_007.png",fit: BoxFit.fill,alignment: Alignment.bottomRight,height: 55,)
                ],
              ),
            ),
            Expanded(
                          child: NotificationListener<ScrollNotification>(

                onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollUpdateNotification) {
                          _onUpdateScroll(scrollNotification.metrics);
                        } else if (scrollNotification is ScrollEndNotification) {
                          _onEndScroll(scrollNotification.metrics);
                        }
                        },
                      child: ListView.builder(
                        
                  itemBuilder: (context, index) {
                    return Transform(
                      transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(x),
                      alignment: FractionalOffset.center,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context)=> AnimalDetail(index, animalslist[index])));
                        },
                                        child: Hero(
                          tag: index.toString(),
                          child: AnimalCard(index,animalslist[index])),
                      ));
                  },
                  itemCount: animalslist.length,
                  ),
              ),
            ),
          ],
        )
      ),
    );
  }
}