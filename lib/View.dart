import 'package:flutter/material.dart';

class Viewlist extends StatefulWidget {
  const Viewlist({super.key});

  @override
  State<Viewlist> createState() => _ViewlistState();
}

class _ViewlistState extends State<Viewlist> {

  TextEditingController UpdatedText = TextEditingController();

  TextEditingController friendlistController = TextEditingController();

List friendlist = ["Haris","Zaman","Humaiyu","Raza","Machar","Bilal","Fahad"];
 addList(){
  setState(() {
    friendlist.add("value");
  });
 }
removeAt({data}){
   setState(() {
                    friendlist.removeAt(data);
                  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: friendlistController,
        ),
        
        actions: [ElevatedButton(onPressed: (){
          setState(() {
            friendlist.add(friendlistController.text);
          friendlistController.clear();
          });
        }, child: Text("Add Name"))],
      ),
      body: SafeArea(

        child: ListView.builder(
              
              itemCount: friendlist.length,
              itemBuilder: (context,index)
              {
                return Container(
                  
                  color: Colors.blueAccent,
                  margin: EdgeInsets.only(bottom: 2),
                  child: ListTile(
                    title: Text(friendlist[index]),
                    trailing: Wrap(
                      children: [
                        IconButton(onPressed: (){
                         removeAt(data: index);
                        }, icon:Icon(Icons.delete)),

                        IconButton(onPressed: (){
                         UpdatedText.text = friendlist[index];
                          showDialog(context: context
                          , builder:(context){
                            return AlertDialog(
                              title: Text("Update Value"),
                            content: TextField(
                              
                              controller: UpdatedText,
                            ),
                            actions: [ElevatedButton(onPressed: (){
                              setState(() {
                              
                                friendlist[index] = UpdatedText.text;
                              });

                              UpdatedText.clear();
                              Navigator.pop(context);
                            }, child: Text("update"))],);
                          });
                        
                        }, icon:Icon(Icons.edit))
                      ],
                    ),
                  
                  ),
                );
              },
              ),
          
        
      ),
    );
  }
}