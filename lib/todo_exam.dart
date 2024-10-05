import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoExam extends StatefulWidget {
  const ToDoExam({super.key});

  @override
  State<ToDoExam> createState() => _ToDoExamState();
}

class _ToDoExamState extends State<ToDoExam> {
  TextEditingController _controller=TextEditingController();
  Color _color=Colors.blue;
  List<String> _toDo=[];
  List<Color>_colorList=[
    Colors.green,
    Colors.yellow,
    Colors.red,
    Colors.orange,
    Colors.purple
  ];
  @override
  void initState(){
    super.initState();
    loadItems();
  }
  loadItems()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
     List<String>? tasks = prefs.getStringList('todoTasks');
      List<String>? colors = prefs.getStringList('todoColors');
      if(tasks!=null&&colors!=null){
        setState(() {
          
        });
      }
  }
   saveItems(List<String> items) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('items', items);
  }

  void addItem(String item) {
    setState(() {
      _toDo.add(item);
    });
    saveItems(_toDo);
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text("To-Do-List"),centerTitle: true,),
body: Column(
  children: [
    Expanded(child: ListView.builder(
      itemCount: _toDo.length,
      itemBuilder: (context,index){
        return Container(
          color: Colors.purple[400],
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [Text(_toDo[index])],
        ),
        );
      })
      )
  ],
),
floatingActionButton: FloatingActionButton(
  child: Icon(Icons.add),
  onPressed: (){
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: 350,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text("ENTER TASK",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  
                  hintText: "Type here...............",
                  border: OutlineInputBorder()
                ),
                
              ),
              SizedBox(height: 15,),
              Text("Pick a Color",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      _color=_colorList[index];
                    });
                  },
                  child: CircleAvatar(
                    radius: 23,
                    
                    backgroundColor: _colorList[index],
                  ),
                );
                
                  }, separatorBuilder: (context,index){
                    return SizedBox(width: 17,);
                  }, itemCount:_colorList.length,
                  ),
              ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(onPressed: (){
                           if(_controller.text.isNotEmpty);
                           _controller.clear();
                           Navigator.pop(context);
                  }, child: Text("Add Task",style: TextStyle(color: const Color.fromARGB(255, 245, 79, 189),fontWeight: FontWeight.bold),)),
                )
            ],
          ),
        ),
      );
    });
  }),
    );
    
  }
}