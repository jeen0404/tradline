import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradline/model/trading_list_card_model.dart';


class TradingListCard extends StatefulWidget {
  final TradingListCardModel tradingListCardModel;
  const TradingListCard({Key key, this.tradingListCardModel}) : super(key: key);

  @override
  _TradingListCardState createState() => _TradingListCardState();
}

class _TradingListCardState extends State<TradingListCard> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Center(
            child: Text(
          widget.tradingListCardModel.tradingDataModel.companyName
              .substring(0, 2),
          style: Theme.of(context).textTheme.headline6,
        )),
      ),
      title: Text(
        widget.tradingListCardModel.tradingDataModel.companyName,
        style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 15,fontWeight: FontWeight.normal),
      ),
      trailing: Wrap(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle, border: Border.all(color: Colors.blue)),
            child: IconButton(
              iconSize: 15,
              onPressed: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    context: context,
                    builder: (builder){
                      return new Container(
                        margin: EdgeInsets.all(10),
                        height: 360.0,
                        color: Colors.transparent,
                        child:Column(
                        //  mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(width:50,height: 2,color: Theme.of(context).primaryColor,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 30,
                                child: Center(
                                    child: Text(
                                      widget.tradingListCardModel.tradingDataModel.companyName
                                          .substring(0, 2),
                                      style: Theme.of(context).textTheme.headline6,
                                    )),
                              ),
                            ),
                            Text(
                              widget.tradingListCardModel.tradingDataModel.companyName,
                              style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 15,fontWeight: FontWeight.normal,letterSpacing: 2),
                            ),
                          ],
                        )
                      );
                    }
                );
              },
              icon: Column(
                children: [
                  Icon(Icons.keyboard_arrow_up),
                  Text("BUY"),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle, border: Border.all(color: Colors.red)),
            child: IconButton(
              iconSize: 15,
              onPressed: () {},
              icon: Column(
                children: [
                  Text("SELL"),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
        ],
      ),
      subtitle: StreamBuilder<UpdateTradingModel>(
        stream: widget.tradingListCardModel.updateTradingModel.stream,
        builder: (context, stream) {
          if (stream.data == null) {
            return Text(
                widget.tradingListCardModel.tradingDataModel.value.toStringAsFixed(2));
          } else {
            return RichText(
              text: TextSpan(
                  text: stream.data.newValue.toStringAsFixed(2),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 12,fontWeight: FontWeight.normal),
                  children: [
                    TextSpan(text: "  |  "),
                    TextSpan(
                        text:
                            stream.data.percentageChange.toStringAsFixed(2) +
                            " %",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            color: stream.data.isPositive
                                ? Colors.blue
                                : Colors.red,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),
                  ]),
            );
          }
        },
      ),
    );
  }

  @override

  bool get wantKeepAlive => true;
}



class DoubleCubit extends Bloc<double,double> {

  DoubleCubit({double initialState=0}) : super(initialState);

@override
  Stream<double> mapEventToState(double event) async*{
    yield event;
  }

}