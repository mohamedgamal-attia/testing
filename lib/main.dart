import 'package:flutter/material.dart';

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
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final GlobalKey<FormState> _formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               TextFormField(
                 validator: (value){
                   if(value!.isNotEmpty && value.length>2){
                     return null;
                   }else if(value.isNotEmpty && value.length>3){
                     return 'no way your name is that short';
                   }else{
                     return 'please give us your name already';
                   }
                 },
               ),
              RaisedButton(
                  onPressed: (){
                    if(!_formKey.currentState!.validate()){
                      return;
                    }
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Got your name and age!'),
                    ));
                  },
                child: Icon(Icons.file_copy),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
