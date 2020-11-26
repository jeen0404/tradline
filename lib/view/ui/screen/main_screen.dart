import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradline/repository/i_am_repository.dart';
import 'package:tradline/view/ui/screen/create_portfolio_screen.dart';

class MainScreen extends StatefulWidget {
  static const String route = 'main_screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            title: Text("Tradline",style: GoogleFonts.pacifico(),),
            actions: [
              IconButton(onPressed: (){
              },icon: Icon(Icons.settings_rounded))
            ],
          ),

          body: Column(
            children: [
              PortfolioCard()
            ],
          ),

          floatingActionButton: FloatingActionButton(
            onPressed:()=>Navigator.pushNamed(context, CreatePortfolioScreen.route),
            child: Icon(Icons.add),
          )

        ),
      ),
    );
  }
}



class PortfolioCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey,
      title: Text(NameRepository().get()),
      trailing: Text("+7.5 % up"),
      subtitle: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all()
        ),
      ),
    );
  }
}
