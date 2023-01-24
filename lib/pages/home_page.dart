import 'package:flutter/material.dart';
import 'package:notebook/models/note_book.dart';
import 'package:notebook/pages/drawer_page.dart';
import 'package:notebook/pages/note_add_page.dart';
import 'package:notebook/util/util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<NoteBook> notebookList = [];

  @override
  void initState() {
    super.initState();
    notebookList = [
      NoteBook(title: 'My Insta', content: 'Insta content', date: '20-12-2020'),
      NoteBook(title: 'My Phone', content: 'Insta phone ok', date: '21-12-2020'),
      NoteBook(title: 'My Fabu', content: 'Fabu content', date: '24-12-2020'),

    ];


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.only(right: 20, bottom: 20),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const NoteAddPage();
            }));
          },
          child: const Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Note Book',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      drawer: const DrawerPage(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.menu_book,
                  size: 40,
                ),
                const Text(' Hello Palash, '),
                Text(Util.greeting()),
              ],
            ),
            Container(
              height: 55,
              margin: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search bt Title...',
                  filled: true,
                  fillColor: Colors.grey.shade400,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index){
                  return const SizedBox(
                    height: 8.0,
                  );
                } ,
                itemCount: notebookList.length,
                itemBuilder: (BuildContext context, int index) {
                  NoteBook myNoteBook = notebookList[index];
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    myNoteBook.title??'',  // nullable sign অর্থাৎ ভ্যালু না দিলেও সেভ হবে। ভ্যালু দিলে ?? এর আগে বসবে আর ভ্যালু না দিলে ‘’ এর মধ্যে সেভ হবে।
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Text(
                                    myNoteBook.content??'',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    myNoteBook.date??'',
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              PopupMenuButton<int>(
                                itemBuilder: (BuildContext context) {
                                  return <PopupMenuEntry<int>>[
                                    PopupMenuItem(
                                      value: 0,
                                      child: Row(
                                        children: [
                                          const Icon(Icons.edit),
                                          const SizedBox(
                                            width: 8.0,
                                          ),
                                          const Text('Edit'),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: 1,
                                      child: Row(
                                        children: [
                                          const Icon(Icons.delete_forever),
                                          const SizedBox(
                                            width: 8.0,
                                          ),
                                          const Text('Delete'),
                                        ],
                                      ),
                                    ),
                                  ];
                                },
                                padding: EdgeInsets.zero,
                                icon: const Icon(Icons.more_vert),
                                onSelected: (int value) {
                                  if(value == 0){
                                    //Do Edit
                                  } else if(value == 1){
                                    //Do Delete
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
