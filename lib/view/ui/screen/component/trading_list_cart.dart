import 'package:flutter/material.dart';
import 'package:tradline/model/trading_list_card_model.dart';

class TradingListCard extends StatefulWidget {
  final TradingListCardModel tradingListCardModel;
  const TradingListCard({Key key, this.tradingListCardModel}) : super(key: key);

  @override
  _TradingListCardState createState() => _TradingListCardState();
}

class _TradingListCardState extends State<TradingListCard>
    with AutomaticKeepAliveClientMixin {

  @override
  void dispose() {
    this.widget.tradingListCardModel.updateTradingModel.close();
    super.dispose();
  }

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
              onPressed: () {},
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
