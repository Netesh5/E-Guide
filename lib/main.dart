

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomShapeClipper.dart';
import 'state_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'CustomAppBar.dart';
import 'SearchBar.dart';


void main() => runApp(MyApp());
Color firstcolor=Color(0xFF00FFFF);
Color secondcolor=Color(0xFFFF00B0);
ThemeData appTheme=ThemeData(

);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


List<String>locations=['Ktm(Nepal)', 'Butwal(Nepal)'];

class HomeScreen extends StatelessWidget {
  
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      
      
      bottomNavigationBar: CustomAppBar(),
              body: LayoutStarts(),
              
              );
            
            }
          }
          class LayoutStarts extends StatelessWidget {
            
            @override
            Widget build(BuildContext context) {
              return Stack(
              
                children: <Widget>[
                  HomeScreenTopPart(),
                  NewLayer(),
                  
                Padding( 
                  padding: EdgeInsets.symmetric(vertical: 25.0,horizontal: 10.0),
                  child:
                   Text("E-Guide",
                   style: TextStyle(
                     fontFamily: 'Pacifico',
                     fontSize: 25.0,
                     color: Colors.white,
                     ),
                     ),
                  
                ),
                
                ],
                

              );
            }
          }
class NewLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomBottomSheet(),
        
      ],
      
    );
  }
}

       

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      
                children: <Widget>[
                  ClipPath(clipper:CustomShapeclipper(),
                  
                       child: Container(
                         
                      height: 370.0,
                    decoration: BoxDecoration(
                         color:Color(0xffed622b),
                         
                      ),
                      
                     
                    
                         
                      child: Column(
                        
                        children: <Widget>[
                        
                          SizedBox(height: 50.0,),   
                                        
                          Padding(
                        
                            padding: const EdgeInsets.all(40.0),
                            
                            
                            child: Row(
                            children: <Widget>[

                              
                              Icon(Icons.location_on,color: Colors.white,
                              
                              ),
                              
                              SizedBox(width:15.0,),
                              
                              PopupMenuButton(
                                child: Row(
                                  children: <Widget>[
                                    Text(locations[0],style:dropDownLabelStyle),
                                    Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                                    
                                    
                                  ],
                                ),
                                itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                                      PopupMenuItem(
                                        child:Text(locations[0], style:dropDownMenuItemsStyle,),
                                      value:0,

                                      ),
                                      
                                     
                                      PopupMenuItem(
                                      child:Text(locations[1], style:dropDownMenuItemsStyle,),
                                      value:1,
                                      ),

                                    

                                    
                                    ],
                              ),
                              Spacer(),
                                    Icon(Icons.settings,color: Colors.white,),
                            ],),
                          ),
                          
                          SizedBox(height: 5.0,),
                          
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text("Let's Start the journey !",style:TextStyle(fontSize:24.0, color:Colors.white ,), textAlign:TextAlign.center),
                          ),
                            SizedBox(height:20.0,),
                          Padding (
                          
                            padding: EdgeInsets.symmetric(horizontal: 45.0),
                            child:Material(
                              elevation:5.0,
                              borderRadius:BorderRadius.all(Radius.circular(30.0)),
                              child:TextField(
                                controller:TextEditingController(text:locations[1]),
                                style:dropDownMenuItemsStyle,
                                cursorColor:appTheme.primaryColor,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 16.0),
                                  suffixIcon: Material(
                                    elevation: 2.0,
                                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                    child: Icon(
                                      Icons.search ,color:Colors.black,
                                    )
                                  )
                                )
                              ),
                              
                          
                        ),
                        
                          ),
                          
                        ],),
                        
                        

                    ),
                    
                   
                  ),
                  
                    
                  
        
                  ],
                             
                
            
                  );
}
          }
   class CustomBottomSheet extends StatefulWidget {
  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with SingleTickerProviderStateMixin {
  double sheetTop = 400;
  double minSheetTop = 30;

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = Tween<double>(begin: sheetTop, end: minSheetTop)
        .animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    ))
          ..addListener(() {
            setState(() {});
          });
  }

  forwardAnimation() {
    controller.forward();
    stateBloc.toggleAnimation();
  }

  reverseAnimation() {
    controller.reverse();
    stateBloc.toggleAnimation();
  }

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: animation.value,
      left: 0,
      child: GestureDetector(
        onTap: () {
           controller.isCompleted ? reverseAnimation() : forwardAnimation();
        },
        onVerticalDragEnd: (DragEndDetails dragEndDetails) {
          
          if (dragEndDetails.primaryVelocity < 0.0) {
            forwardAnimation();
            controller.forward();
          } else if (dragEndDetails.primaryVelocity > 0.0) {
            
            reverseAnimation();
          } else {
            return;
          }
        },
        child: SheetContainer(),
      ),
    );
  }
}    
    
  
class SheetContainer extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    
    return Container(
      
      padding: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      
      decoration: BoxDecoration(
        
          borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
          
          color: Colors.white),
      child: Column(
        children: <Widget>[
          
          drawerHandle(),
          
          Expanded(
            
           child: Dashboard(),
          ),
      
        ],
          
      ),
    );
  }


  drawerHandle() {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      height: 5,
      width: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xffd9dbdb)),
          
    );
  
  }

}






class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {
  Material MyItems (IconData icon,String heading, int color){
  return Material(
    color: Colors.white,
    elevation: 14.0,
    shadowColor: Color(0x802196F3),
    borderRadius: BorderRadius.circular(24.0),
   
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(heading,
                    style: TextStyle(
                      fontSize:17.0,),
                    ),
                  ),
                ),
                //icon
                Material(
                  color: Color(color),
                  borderRadius: BorderRadius.circular(24.0),
                  
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    
                     child: Icon(
                      icon,
                      color: Colors.white,
                      size: 30.0,
                      ),
                  ),
                  
                )
              ],
            )
          ],
        ),

      ),
    ),
    
    );
    
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 70.0,),
        
        
        
      
        children: <Widget>[


           InkWell(
             onLongPress: () => print("long press"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context){
            return Search();
          }));
              },
              child:MyItems(Icons.map,"Places to visit",0xffed622b),
              ),
            


            
           InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context){
            return Search();
          }));
              },
              child:MyItems(Icons.assignment_turned_in,"Thingstodo",0xffed622b),
              ),


              
           InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context){
            return Search();
          }));
              },
              child:MyItems (Icons.near_me,"Nearby",0xffed622b),
              ),


              
           InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context){
            return Search();
          }));
              },
              child:MyItems(Icons.business,"NearbyBanks",0xffed622b),
              ),



              
           InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context){
            return Search();
          }));
              },
              child:MyItems (Icons.local_taxi,"Transportation",0xffed622b),
              ),



              
           InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context){
            return Search();
          }));
              },
              child:MyItems (Icons.hotel,"Hotel Booking",0xffed622b),
              ),



              
           InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context){
            return Search();
          }));
              },
              child:MyItems (Icons.wb_cloudy ,"Weather Report",0xffed622b),
              ),



              
           InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context){
            return Search();
          }));
              },
              child:MyItems (Icons.attach_money,"Curreny Rate",0xffed622b),
              ),



              
           InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context){
            return Search();
          }));
              },
              child:MyItems (Icons.phone_in_talk,"Helpline Numbers",0xffed622b),
              ),



              
           



          
          MyItems(Icons.map,"Places to visit",0xffed622b),
           MyItems(Icons.assignment_turned_in,"Thingstodo",0xffed622b),
           MyItems (Icons.near_me,"Nearby",0xffed622b),
            MyItems(Icons.business,"NearbyBanks",0xffed622b),
            MyItems (Icons.local_taxi,"Transportation",0xffed622b),
            MyItems (Icons.hotel,"Hotel Booking",0xffed622b),
            MyItems (Icons.wb_cloudy ,"Weather Report",0xffed622b),
            MyItems (Icons.attach_money,"Curreny Rate",0xffed622b),
            MyItems (Icons.phone_in_talk,"Helpline Numbers",0xffed622b),
            
           
        ],
          
        
        
        staggeredTiles:[
         
            
          StaggeredTile.extent(1,125.0),
          StaggeredTile.extent(1,125.0),
          StaggeredTile.extent(1,125.0),
          StaggeredTile.extent(1,125.0),
          StaggeredTile.extent(1,125.0),
          StaggeredTile.extent(1,125.0),
          StaggeredTile.extent(1,125.0),
          StaggeredTile.extent(1,125.0),
          StaggeredTile.extent(1,125.0),

         
        ],



        

      
      ),

      
    );
  }
}


 


const TextStyle dropDownLabelStyle =TextStyle(color:Colors.white ,fontSize: 13.0);
const TextStyle dropDownMenuItemsStyle =TextStyle(color: Colors.black, fontSize: 16.0);

  
