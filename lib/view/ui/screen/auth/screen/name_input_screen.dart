import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradline/cubit/app_start_cubit.dart';
import 'package:tradline/repository/i_am_repository.dart';

class NameInputScreen extends StatefulWidget {
  @override
  _NameInputScreenState createState() => _NameInputScreenState();
}

class _NameInputScreenState extends State<NameInputScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String name='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 00,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title:  Text("TradLine", style: GoogleFonts.pacifico().copyWith(color: Theme.of(context).colorScheme.secondary)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              onChanged: (text){
                name=text;
              },
              keyboardType: TextInputType.name,
              style: Theme.of(context).textTheme.headline4,
              decoration: InputDecoration(hintText: "Enter Name"),
            ),
          ),

          Row(
            children: [

              Expanded(child: SizedBox(),),

              Container(
                margin: EdgeInsets.symmetric(vertical: 25,horizontal: 50),
                child:

                IconButton(
                  onPressed: _onSubmit,
                  icon: Icon(
                    Icons.login,
                    size: 35,
                  ),
                ),

              ),
            ],
          ),

        ],
      ),
    );
  }


  // when user hit submit button
   void _onSubmit(){
    if(name.isEmpty || name.length<3){
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("The name should be more than 4 character"),));
      return ;
    }
    // save name into hive database
    NameRepository().put(name);

    // send user to authenticated app
    BlocProvider.of<AppStartCubit>(context).add(AppStartCubitEvent.AuthAppStartCubitEvent);
  }

}
