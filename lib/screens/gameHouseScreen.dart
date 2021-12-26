import 'package:flutter/material.dart';
import 'package:saudade/contextExtension.dart';

class GameHouseScreen extends StatefulWidget {
  const GameHouseScreen({ Key? key }) : super(key: key);

  @override
  _GameHouseScreenState createState() => _GameHouseScreenState();
}

class _GameHouseScreenState extends State<GameHouseScreen> {
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
                /////////////////////     1     ////////////////////
                Expanded(
                  child: Row(
                    children: [
                      Expanded(flex: 1,child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: context.dynamicHeigh(0.2),
                            child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage("https://picsum.photos/200"),fit: BoxFit.cover),
                                  border: Border.all(color: Color(0xFF00FF00)),
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                ),
                            ),
                          ),
                      ),
                      ),
                      ////////////////////////          2   /////////////////////
                      Expanded(flex: 1,child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: context.dynamicHeigh(0.2),
                            child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage("https://picsum.photos/200"),fit: BoxFit.cover),
                                  border: Border.all(color: Color(0xFF00FF00)),
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                ),
                            ),
                          ),
                      ),
                      ),
                      ////////////////////////        3     ////////////////////////
                      Expanded(flex: 1,child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: context.dynamicHeigh(0.2),
                            child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage("https://picsum.photos/200"),fit: BoxFit.cover),
                                  border: Border.all(color: Color(0xFF00FF00)),
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                ),
                            ),
                          ),
                      ),
                      ),
                     
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

                      /// Inventory   ///
                      Expanded(flex: 3,child: SizedBox(
                        height: context.dynamicHeigh(0.2),
                          child: Card(
                            child: Row(
                              children: [
                                Expanded(flex: 2, child:ElevatedButton(
                                  child: Container(
                                    child: Center(child: Text("Inventory", style: context.theme.textTheme.headline5,))),
                                  onPressed: (){
                                    
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF545454),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                      side: BorderSide(color: Color(0xFFcd853f)),
                                    )
                                  ),
                                ),),
                                SizedBox(width: 10,),

                                ///   Exit  //
                                Expanded(flex: 1, child:ElevatedButton(
                                  child: Container(
                                    child: Center(child: Text("Exit", style: context.theme.textTheme.headline5,))),
                                  onPressed: (){
                                    
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF545454),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                      side: BorderSide(color: Color(0xFF8D021F)),
                                    )
                                  ),
                                ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                
                    ],
                  ),
                ),

                Expanded( flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: context.dynamicWidth(1),
                      color: Colors.white24,
                    ),
                  ),
                ),



              Expanded( flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: context.dynamicWidth(1),
                      color: Colors.cyan,
                      child: Row(
                      children: [

                        Expanded(
                          flex: 1,
                          child:ElevatedButton(
                            child: Container(
                              child: Center(child: Text("Craft", style: context.theme.textTheme.headline5,))
                            ),
                            onPressed: (){
                                      
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF545454),
                              shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                side: BorderSide(color: Color(0xFFcd853f)),
                              )
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child:ElevatedButton(
                            child: Container(
                              child: Center(child: Text("Cooking", style: context.theme.textTheme.headline6,))
                            ),
                            onPressed: (){
                                      
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF545454),
                              shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                side: BorderSide(color: Color(0xFFcd853f)),
                              )
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child:ElevatedButton(
                            child: Container(
                              child: Center(child: Text("Traps", style: context.theme.textTheme.headline6,))
                            ),
                            onPressed: (){
                                      
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF545454),
                              shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                side: BorderSide(color: Color(0xFFcd853f)),
                              )
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child:ElevatedButton(
                            child: Container(
                              child: Center(child: Text("HouseInfo", style: context.theme.textTheme.headline6,))
                            ),
                            onPressed: (){
                                      
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF545454),
                              shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                side: BorderSide(color: Color(0xFFcd853f)),
                              )
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 2,
                          child:ElevatedButton(
                            child: Container(
                              child: Center(child: Text("Finish The Day", style: context.theme.textTheme.headline5,))
                            ),
                            onPressed: (){
                                      
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF545454),
                              shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                side: BorderSide(color: Color(0xFFcd853f)),
                              )
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