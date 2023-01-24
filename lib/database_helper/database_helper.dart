import 'dart:io';
import 'package:notebook/constant/constant.dart';
import 'package:notebook/models/note_book.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{

  //যতবার ডাটাবেজ কানেক্ট করব ততবার initDatabase করতে হবে।
  Future<Database> initDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'notebook.db');
    return openDatabase(path,version: 1,onCreate: (db,version){

      // নিচের উপায়ে যতখুশি টেবিল তৈরি করা যাবে।
      db.execute('CREATE TABLE ${AppConstant.noteTable} (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT, content TEXT, date TEXT)');

    });
  }

  Future<int>insertNote(NoteBook noteBook) async{
    Database db = await initDatabase();
    return db.insert(AppConstant.noteTable, noteBook.toMap(),);
  }

  Future<List> fetchNoteList(NoteBook noteBook) async {
    Database db = await initDatabase();
    List<Map<String, dynamic>> notebookMapList =
        await db.query(AppConstant.noteTable);

    return List.generate(notebookMapList.length, (index) {
      Map<String, dynamic> mNoteBook = notebookMapList[index];
      return NoteBook(
          id: mNoteBook['id'],
          title: mNoteBook['title'],
          content: mNoteBook['content'],
          date: mNoteBook['date']);
    });
  }

  Future<int>updateNote(NoteBook noteBook) async{
    Database db = await initDatabase();
    return db.update(AppConstant.noteTable, noteBook.toMap(),
    where: 'id = ?', whereArgs: [noteBook.id]);
  }

  Future<int>deleteNote(int id) async{
    Database db = await initDatabase();
    return db.delete(AppConstant.noteTable, where: 'id = ?', whereArgs: [id]);
  }

  Future<int>deleteTable(String tableName) async{
    Database db = await initDatabase();
    return db.delete(AppConstant.noteTable);
  }


}