import 'package:flutter/material.dart';
import 'package:saudade/contextExtension.dart';
import 'package:saudade/widgets/customButton.dart';
import 'package:saudade/widgets/portrait.dart';

class GameHouseScreen extends StatefulWidget {
  const GameHouseScreen({ Key? key }) : super(key: key);

  @override
  _GameHouseScreenState createState() => _GameHouseScreenState();
}

class _GameHouseScreenState extends State<GameHouseScreen> {
  //customButton craft = customButton(buttonText: "buttonText", borderColor: Color(0xFFFFFFFF));


  final img = "https://picsum.photos/200";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: context.dynamicWidth(1),
            height: context.dynamicHeigh(1),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white38),
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            ),
            //color: Colors.white24,//Colors.grey.shade900,
            child: Column(
              children: [
                /////////////////////     üst alan     ////////////////////
                Expanded(
                  child: Row(
                    children: [
                      Expanded(flex: 1,child: Portrait(image: img, height: 0.2)),
                      Expanded(flex: 1,child: Portrait(image: img, height: 0.2)),
                      Expanded(flex: 1,child: Portrait(image: img, height: 0.2)),
                     
                     ////         Day-Time    ////
                      Expanded(flex: 1,child: SizedBox(
                        height: context.dynamicHeigh(0.2),
                          child: Card(color: Color(0xFF444444),
                            child: Column(
                              children: [
                                Expanded(child: Center(child: Text("Day 1"))),
                                Expanded(child: Center(child: Text("12:30"))),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Expanded(flex: 3,child: Row(
                        children: [
                          
                          Expanded(flex: 2, child:customButton(buttonText: "Inventory",borderColor: Color(0xFFcd853f),),),
                          Expanded(flex: 1, child:customButton(buttonText: "Exit",borderColor: Color(0xFF8D021F),),),

                        ],
                      ),),
                
                    ],
                  ),
                ),


                ///     orta alan   ///
                Expanded( flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: context.dynamicWidth(1),
                      color: Colors.white24,
                    ),
                  ),
                ),


              ////  Alt   //
              Expanded( flex: 1,
                  child: Row(
                  children: [
                    //Expanded(child: c),
                    
                    Expanded(flex: 2,child:customButton(buttonText: "Craft", borderColor: Color(0xFFcd853f),),),
                    Expanded(flex: 2,child:customButton(buttonText: "Cook", borderColor: Color(0xFFcd853f),),),
                    Expanded(flex: 2,child:customButton(buttonText: "Trap", borderColor: Color(0xFFcd853f),),),
                    Expanded(flex: 2,child:customButton(buttonText: "Info", borderColor: Color(0xFFcd853f),),),
                    Expanded(flex: 3,child:customButton(buttonText: "Finish Day", borderColor: Color(0xFFcd853f),),),





                  ],
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



/* Expanded(flex: 1,child: SizedBox(
                        height: context.dynamicHeigh(0.2),
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network("https://picsum.photos/200", fit: BoxFit.cover,),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
                          ),
                        ),
                      ),
                      Expanded(flex: 1,child: SizedBox(
                        height: context.dynamicHeigh(0.2),
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network("https://picsum.photos/200", fit: BoxFit.cover,),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
                          ),
                        ),
                      ),*/




                    
                   // Expanded(flex: 1, child: SizedBox(height: context.dynamicHeigh(0.25), child: Card(color: Colors.red,),)),
                   // Expanded(flex: 3, child: SizedBox(height: context.dynamicHeigh(0.25), child: Card(color: Colors.red,),)),

//Expanded(flex: 2, child: CircleAvatar(radius: 40,foregroundImage: NetworkImage("https://picsum.photos/200"),)),

/*                    Expanded(flex: 2,child: SizedBox(
                      height: 100,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network("https://picsum.photos/200", fit: BoxFit.cover,),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
                        ),
                      ),
                    ),*/