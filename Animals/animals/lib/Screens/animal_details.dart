import 'package:animals/Models/animalModels.dart';
import 'package:flutter/material.dart';

class AnimalDetail extends StatefulWidget {
  int _index;
  Animal _animal;
  AnimalDetail(int index,Animal animal){
    _index=index;
    _animal=animal;
  }
  @override
  _AnimalDetailState createState() => _AnimalDetailState();

}

class _AnimalDetailState extends State<AnimalDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: widget._animal.color,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                    
                  ),
                  height: 280,

                  width: MediaQuery.of(context).size.width,
                  
                               child: Hero(
                                 
                    tag: widget._index.toString(),
                                 child: Padding(
                                   padding: const EdgeInsets.all(40.0),
                                   child: Container(
                                     width: 200,
                                     alignment: Alignment.center,
                                    margin: EdgeInsets.all(10),
                                     child: Image.asset("assets/images/image_part_00"+widget._index.toString()+".png",)
                                   ),
                                 ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.keyboard_backspace,color: Colors.white,size: 55,)))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Text(widget._animal.name,style: TextStyle(fontSize: 30),),
                       Text(widget._animal.text,style: TextStyle(fontSize: 20,color: Colors.grey),),
                       Text("Ömür",style: TextStyle(fontSize: 26),),
                       Text(widget._animal.lifespan,style: TextStyle(fontSize: 20,color: Colors.grey),),
                       Text("Hiz",style: TextStyle(fontSize: 26),),
                       Text(widget._animal.speed.toString(),style: TextStyle(fontSize: 20,color: Colors.grey),),
                     ],
                   ), 
              ),
            )
          ],
        ),
      ),
    );
  }
}