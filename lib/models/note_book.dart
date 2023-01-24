class NoteBook{
  int? id;
  String? title;
  String? content;
  String? date;
  NoteBook({this.id, this.title, this.content, this.date}); //{} দিয়ে অপশনাল করা হয়েছে।

  Map<String, dynamic> toMap(){
    return <String,dynamic>{
      'id':id,
      'title':title,
      'content':content,
      'date':date,
    };
  }
}