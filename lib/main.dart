import 'package:flutter/material.dart';
import 'package:loginpage/page2.dart';
import 'bloc.dart';

void main() => runApp(MyApp());

//  !Main Skeleton
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

//  !Scaffold and Widgets
class HomePage extends StatelessWidget {
  // *Route to PageTwo/next Page
  changeThePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PageTwo()));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page Bloc Pattern"),
      ),

      // !Body Content
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // !Email Input Field
              StreamBuilder<String>(
                // *Explicitly enter 'String' type
                stream: bloc
                    .email, // *Access the 'bloc email' constructor created from 'bloc.dart'
                builder: (context, snapshot) => TextField(
                  onChanged: bloc.emailChanged,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "email@provider.com",
                    labelText: "Email",
                    errorText: snapshot.error,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              // !Password Input Field
              StreamBuilder<String>(
                // *Explicitly enter 'String' type
                stream: bloc
                    .password, // *Access the 'bloc password' constructor created from 'bloc.dart'
                builder: (context, snapshot) => TextField(
                  onChanged: bloc.passwordChanged,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Passphrase more than 6 characters",
                    labelText: "Passphrase",
                    errorText: snapshot.error,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              //  !Submit Button Field
              StreamBuilder<bool>(
                // *Explicitly 'Boolean' type validation
                stream: bloc.submitCheck,
                builder: (context, snapshot) => RaisedButton(
                  color: Colors.tealAccent,

                  // *Check the data inserted and submit or (:) nothing happens
                  // *or you can replace 'bloc.submit' to 'changeThePage' (this is custom method from above)  vice versa
                  onPressed:
                      snapshot.hasData ? () => changeThePage(context) : null,
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
