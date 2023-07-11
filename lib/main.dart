import 'package:flutter/material.dart';
import 'package:flutter_pr1/repositories/coindesk/network_manager.dart';
import 'package:flutter_pr1/repositories/coindesk/models/coindesk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      routes: {
        '/':(context) => HomePage(),
        '/page2':(context) => MyHomePage(),
        '/page1bit':(context) => BitPage(),
      },
    );
  }
}



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









class BitPage extends StatelessWidget {
  const BitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bitrate = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(

      appBar: AppBar(title: Text('Page1')),
        
      body: Center(
        child: 
            Text(
              'Rate is  $bitrate',style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
            ),
        ),

    );
    
  }
}





class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),



       body: Center(
        child: 
            const Text(
              'Go to main        ',style: TextStyle(color: Colors.white),
            ),
        ),




      floatingActionButton: Center(
      child: FloatingActionButton(
        child: const Icon(Icons.airplanemode_on),
        onPressed:(){
           Navigator.of(context).pushNamed('/page2');
        } ,
        tooltip: 'Main',
      ),
      ),
    );
  }
}

