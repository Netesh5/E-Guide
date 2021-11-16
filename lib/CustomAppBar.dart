import 'package:flutter/material.dart';
import 'main.dart';
class CustomAppBar extends StatelessWidget {
  List<BottomNavigationBarItem>bottomBarItems=[];
   final bottomNavigationBarItemStyle =
  TextStyle(fontStyle: FontStyle.normal,color: Colors.black);
  CustomAppBar(){
    bottomBarItems.add(
BottomNavigationBarItem(
  activeIcon: Icon(
    Icons.home,
  color:appTheme.primaryColor,),
  icon: Icon(Icons.home,
  color: Colors.black,),
  title: Text("Home" ,style:bottomNavigationBarItemStyle),
  ),

);
    

    bottomBarItems.add(
BottomNavigationBarItem(
  icon: Icon(Icons.personal_video,
  color: Colors.black,),
  title: Text("Videos" ,style:bottomNavigationBarItemStyle),
  ),

);

    bottomBarItems.add(
BottomNavigationBarItem(
  icon: Icon(Icons.search,
  color: Colors.black,),

  title: Text("Search" ,style:bottomNavigationBarItemStyle),
  ),

);

    bottomBarItems.add(
BottomNavigationBarItem(
  icon: Icon(Icons.notifications,
  color: Colors.black,),
  title: Text("Notifications" ,style:bottomNavigationBarItemStyle),
  ),

);
    bottomBarItems.add(
BottomNavigationBarItem(
  icon: Icon(Icons.person,
  color: Colors.black,),
  title: Text("Profile" ,style:bottomNavigationBarItemStyle),
  ),

);
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation:10.0,
          child: BottomNavigationBar(
        items:bottomBarItems,
        type: BottomNavigationBarType.fixed,

        
      ),
    );
  }
}