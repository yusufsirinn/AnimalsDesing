import 'package:animals/Models/animalModels.dart';
import 'package:flutter/material.dart';

class AnimalCard extends StatelessWidget {
  int _index;
  Animal _animal;
  AnimalCard(int index,Animal animal){
    _index=index;
    _animal=animal;
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 5
          ),
          child: Container(
              height:200,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: 
                    Container(
          decoration: BoxDecoration(
            color: _animal.color,
            borderRadius: BorderRadius.all(Radius.circular(20)),),
          height: 200,
          width: MediaQuery.of(context).size.width-90,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Align(
              alignment: Alignment.centerRight,
                                    child: Container(
                height: 160,
                width: MediaQuery.of(context).size.width-180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(_animal.name,style: TextStyle(color: Colors.white,fontSize: 30,letterSpacing: 2,fontWeight: FontWeight.bold),),
                    Text(_animal.preamble,style: TextStyle(color: Colors.white,fontSize: 22),overflow: TextOverflow.ellipsis,maxLines: 3,)
                  ],
                ),
              ),
            ),
          ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    child: 
                    Container(
          alignment: Alignment.centerLeft,
          height: 160,
          width: 120,
          child: Image.asset("assets/images/image_part_00$_index.png",fit: BoxFit.fill,alignment: Alignment.bottomRight,),
                    ),
                  ),
                ],
              ),
            ),
        );
  }
}