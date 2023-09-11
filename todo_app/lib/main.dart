import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alparslans Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController descriptionConroller = TextEditingController();

  final List<ListTile> ltList = <ListTile>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Alparslans Flutter'),
      ),
      body: Center(
          child: Column(
        children: [
          Expanded(
            child: Text(""),
            flex: 1,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(hintText: "Name"),
              controller: nameController,
            ),
            flex: 5,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(hintText: "Number"),
              controller: numberController,
            ),
            flex: 5,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(hintText: "Description"),
              controller: descriptionConroller,
            ),
            flex: 5,
          ),
          Expanded(
            child: OutlinedButton(
              child: const Text(" Add to List"),
              onPressed: () {
                final name = nameController.text;
                final number = numberController.text;
                final descripton = descriptionConroller.text;
                setState(() {
                  ltList.add(ListTile(
                    title: Text(name),
                    iconColor: Color.fromARGB(255, 175, 63, 29),
                    leading: CircleAvatar(
                        child: Text(number,
                            style: TextStyle(
                                color: Color.fromARGB(255, 236, 236, 236))),
                        backgroundColor: Color.fromARGB(255, 175, 63, 29)),
                    subtitle: Text(descripton),
                    trailing: Icon(Icons.more_vert),
                  ));
                });
              },
            ),
            flex: 3,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ltList.length,
              itemBuilder: (context, index) {
                return ltList[index];
              },
            ),
            flex: 20,
          )
        ],
      )),
    );
  }
}
