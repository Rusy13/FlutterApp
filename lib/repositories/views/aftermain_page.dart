import 'package:flutter/material.dart';
import 'package:flutter_pr1/repositories/services/network_manager.dart';
import 'package:flutter_pr1/repositories/models/coindesk.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key
  });


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  String bitcoinData = ' ';

  void _fetchData() async {
    final data = await NetworkManager().getList();
    setState(() {
      bitcoinData = data.toString();
    });
  }


  List<CoinDesk>? _coindesklist;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SevST',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        titleTextStyle: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.w700),
        
      ),

      body: (_coindesklist == null) 
      ? const SizedBox() :

      ListView.separated(
        itemCount: _coindesklist!.length,
        separatorBuilder: (context, index) => Divider(color: Colors.blue,),
        itemBuilder: (context,i){
          final curr = _coindesklist![i];
          final currName = curr.code;
          final bitrate = curr.rate;
        return ListTile(
          title: Text(currName,style: TextStyle(color: Colors.white),),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
          onTap: (){
            Navigator.of(context).pushNamed('/page1bit',arguments: bitrate);
          },
        );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: () async {
          _coindesklist = await NetworkManager().getList();
          setState(() {
          });
        },
        tooltip: 'GET CURRENCY',
      ),
    );
  }
}

