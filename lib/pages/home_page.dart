import 'package:crud_tarea/services/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //firestore
  final FireStoreservice firestoreService = FireStoreservice();


  //text controller
  final TextEditingController textController = TextEditingController();


  void openNotesBox(){
    showDialog(
      context: context, 
      builder: (context)=> AlertDialog(
        content: TextField(
          controller: textController,
        ),

        actions: [
           ElevatedButton(
            onPressed: (){
              //add note
              fireStoreService.addNote(textController.text);
            },
            child: Text("Agregar"),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context){
   return Scaffold(
      appBar: AppBar (title: Text("Notes")),
      floatingActionButton: FloatingActionButton(
       onPressed:(){},
       child: const Icon(Icons.add),
      ),
    );
  }
}