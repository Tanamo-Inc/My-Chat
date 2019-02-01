Introduction  To Flutter.
========================


Q.1 What is Flutter?

Flutter is Google’s mobile app SDK for crafting high-quality native interfaces on iOS and Android in record time.
Flutter has been written from scratch and still in the beta version. Dart and C++ is been used to create Flutter SDK and engine.

*****************************************************************


Q.2 What is a Widget ?

 A widget in Flutter represents an immutable description of part of the user interface; all graphics, including text, shapes, and animations are created using widgets. 
 
 *****************************************************************
 
 
 Q.3 What is a StatelessWidget ?
 
 A stateless widget is a widget that describes part of the user interface by building a constellation of other widgets that describe the user interface more concretely. A StatelessWidget does not require mutable state.They have no internal state and  have no widget redrawing. 
 
  *****************************************************************
  
  
  Q.4 What is a StatefulWidget ?
   
 StatefulWidget instances themselves are immutable and store their mutable state either in separate State objects that are created by the createState method, or in objects to which that State subscribes, for example Stream or ChangeNotifier objects, to which references are stored in final fields on the StatefulWidget itself.They have internal state and  have widget redrawing. 
 
 
  *****************************************************************
  
 Q.5 What is a Column ?

 Column is also layout widget. It takes a list of children and arranges them vertically. By default, it sizes itself to fit its
 children horizontally, and tries to be as tall as its parent.

 *****************************************************************
 
 
 