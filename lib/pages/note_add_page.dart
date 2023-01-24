import 'package:flutter/material.dart';
import 'package:notebook/database_helper/database_helper.dart';
import 'package:notebook/models/note_book.dart';



class NoteAddPage extends StatefulWidget {
  const NoteAddPage({Key? key}) : super(key: key);

  @override
  State<NoteAddPage> createState() => _NoteAddPageState();
}

class _NoteAddPageState extends State<NoteAddPage> {

  TextEditingController? titleTextEditingController;
  TextEditingController? contentTextEditingController;
  String? userSelectedDate;
  DatabaseHelper? bd;

  @override
  void initState() {
    super.initState();

    bd = DatabaseHelper();
    titleTextEditingController = TextEditingController();
    contentTextEditingController = TextEditingController();
    userSelectedDate = DateTime.now().toString().substring(0,10);
  }

  void addNoteHelper() async{
    try{
      int isInsert = await bd!.insertNote(NoteBook(title: titleTextEditingController!.text,content: contentTextEditingController!.text,date: userSelectedDate));
      if(isInsert>0){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Your Note has been added successfully'),
          ),
        );
        Navigator.pop(context);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sorry, You cannot be added right now'),
          ),
        );
      }

    }catch(error){
      print(error.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16,),
              child: Text('Note Title *', style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold,
              ),),
            ),
            Container(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0),
              child: TextField(
                controller: titleTextEditingController,
                decoration: InputDecoration(
                  hintText: '',
                  fillColor: Colors.grey.shade400,
                  filled: true,
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 12,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16,),
              child: Text('Note Content *', style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold,
              ),),
            ),
            Container(
              padding: EdgeInsets.only(left: 32.0, right: 32.0),
              child: TextField(
                controller: contentTextEditingController,
                decoration: InputDecoration(
                  hintText: '',
                  fillColor: Colors.grey.shade400,
                  filled: true,
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 12,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16,),
              child: Text('Note Date *', style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold,
              ),),
            ),

            Container(
              color: Colors.grey.shade400,
              margin: EdgeInsets.only(left: 32, right: 32,),
              padding: EdgeInsets.only(left: 8, right: 8,),
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(userSelectedDate!),
                onTap: () {
                  showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1901),
                      lastDate: DateTime(2050),
                  ).then((value){
                    setState(() {
                      userSelectedDate = value.toString().substring(0,10);
                    });
                  });
                },
                trailing: Icon(Icons.calendar_month_outlined),
              ),
            ),


            SizedBox(height: 12,),
            Center(
              child: InkWell(
                onTap: () {
                  if (titleTextEditingController!.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please, Enter Your Title'),
                      ),
                    );
                  }else if (contentTextEditingController!.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please, Enter Your Content'),
                      ),
                    );
                  }else{
                    addNoteHelper();

                 }
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 25, top: 25,),
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 10,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue
                  ),
                  child: Text(
                    'Save Note',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
