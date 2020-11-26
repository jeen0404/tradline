

import 'package:flutter/material.dart';
import 'package:tradline/cubit/create_portfolio_cubit..dart';
import 'package:tradline/model/trading_list_card_model.dart';
import 'component/trading_list_cart.dart';

class CreatePortfolioScreen extends StatefulWidget {
  static const String route = "create_portfolio_screen";
  @override
  _CreatePortfolioScreenState createState() => _CreatePortfolioScreenState();
}

class _CreatePortfolioScreenState extends State<CreatePortfolioScreen> {
  CreatePortfolioCubit createPortfolioCubit=CreatePortfolioCubit();
  SearchAndFilterPortfolioCubitEvent searchAndFilterPortfolioCubitEvent=SearchAndFilterPortfolioCubitEvent("","");
  @override
  void initState() {
    createPortfolioCubit.add(InitializeCreatePortfolioCubitEvent());
    super.initState();
  }


 @override
  void dispose() {
   createPortfolioCubit.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text('Create Portfolio'),
      ),

      body: NestedScrollView(
        headerSliverBuilder:(context,bool){
          return <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                  [
                    Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("You Can Select 10 Stock from the list to create portfolio."),
                    ))
                  ]),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              leading: SizedBox(),
              flexibleSpace: Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(top: 4, left: 16, right: 16,bottom: 4),
                      child: TextField(
                        onChanged:(text){
                          searchAndFilterPortfolioCubitEvent.search=text;
                          createPortfolioCubit.add(searchAndFilterPortfolioCubitEvent);
                          },   // passing search event to cubit
                       // style: Theme.of(context).textTheme.headline5.copyWith(color: Theme.of(context).colorScheme.background),
                        decoration: InputDecoration(
                          hintText: "Search...",
                       //   hintStyle: Theme.of(context).textTheme.headline5.copyWith(color: Theme.of(context).colorScheme.background),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade400,
                            size: 20,
                          ),
                          filled: true,
                          //fillColor: Colors.grey.shade100,
                          border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 16, right: 16,bottom: 8),
                    child: DropdownButton<String>(
                      hint: Text("Sort & Filter"),
                      items: <String>['Sort By Price', 'Sort By Name'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged:(text){
                        searchAndFilterPortfolioCubitEvent.filter=text;
                        createPortfolioCubit.add(searchAndFilterPortfolioCubitEvent);
                      },
                    ),
                  ),
                ],
              ),
            ),

            StreamBuilder<List<TradingListCardModel>>(
              stream: createPortfolioCubit,
              builder: (context,stream){
                if(!stream.hasData){
                  return SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Center(child: CircularProgressIndicator()),
                        Text('Loading..')
                      ],
                    ),
                  );
                }
                if(stream.hasError){
                  return SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Text('error in loading..')
                      ],
                    ),
                  );
                }
               return  SliverList(
                 delegate: SliverChildBuilderDelegate(
                       (context, index) =>Column(
                         children: [
                           TradingListCard(tradingListCardModel: stream.data[index],
                           ),
                           Divider(height: 1,)
                         ],
                       ),
                   childCount: stream.data.length
                 ),

               );
              },
            ),
          ],
        )
      ),
    );
  }
}
