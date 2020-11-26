
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradline/model/trading_list_card_model.dart';
import 'package:tradline/repository/stocks_repository.dart';


class CreatePortfolioCubitEvent{

}

class InitializeCreatePortfolioCubitEvent extends CreatePortfolioCubitEvent{

}
class KeepUpdateCreatePortfolioCubitEvent extends CreatePortfolioCubitEvent{

}
class SearchAndFilterPortfolioCubitEvent extends CreatePortfolioCubitEvent{
  String search; // search keyword
  String filter;

  SearchAndFilterPortfolioCubitEvent(this.search, this.filter);    // 1 for short by name / 2 for short by value /0 means none
}

class CreatePortfolioCubit extends Bloc<CreatePortfolioCubitEvent,List<TradingListCardModel>>{
  StockDataRepository stockDataRepository=StockDataRepository(); //repo
  List<TradingListCardModel> originalTradingListCardModels =[]; //list to be render
  List<TradingListCardModel> tradingListCardModels =[]; //list to be render

  CreatePortfolioCubit() : super([]);

  @override
  Future<void> close() {
    this.originalTradingListCardModels.forEach((element) {
      element.updateTradingModel.close();
    });
    this.tradingListCardModels.forEach((element) {
      element.updateTradingModel.close();
    });

    return super.close();
  }


  @override
  Stream<List<TradingListCardModel>> mapEventToState(CreatePortfolioCubitEvent event) async*{
    if (event is InitializeCreatePortfolioCubitEvent){
      List<TradingDataModel> list = stockDataRepository.getall();

      if(list.isEmpty || list==null || list[0].companyName==null){  // TODO: it is getting null values from cache when app load even data is already  cached. need to fix
        list =await stockDataRepository.getAllNetwork();
      }

      list.forEach((element) {
        TradingListCardModel tradingListCardModel=TradingListCardModel();
        tradingListCardModel.tradingDataModel=element;
        tradingListCardModel.updateTradingModel.sink.add(UpdateTradingModel(element.value,0.0,true));
        tradingListCardModels.add(tradingListCardModel);
      });
      yield tradingListCardModels;
      originalTradingListCardModels=tradingListCardModels;
      this.add(KeepUpdateCreatePortfolioCubitEvent());
    }
    else if(event is KeepUpdateCreatePortfolioCubitEvent){

      // TODO : remove try and catch and fix sink close bug
      try{
        List<TradingDataModel> list = await stockDataRepository.getAllNetwork();
        Map<String, TradingDataModel> map = {};
        list.forEach((element) {
          map.addAll({element.companyName: element});
        });
        tradingListCardModels.forEach((element) {
          element.updateTradingModel.sink.add(checkChanges(
              element.tradingDataModel,
              map[element.tradingDataModel.companyName]));
        });
      }catch(error){
      }
      this.add(KeepUpdateCreatePortfolioCubitEvent());


    }
    else if(event is SearchAndFilterPortfolioCubitEvent){
      if (event.search.isNotEmpty){
        tradingListCardModels=[];
        originalTradingListCardModels.forEach((element) {
          String value =element.tradingDataModel.companyName.toLowerCase();
          if(value.contains(event.search.toLowerCase())){
            tradingListCardModels.add(element);
          }
        });
      }
      else{
        tradingListCardModels=originalTradingListCardModels;
      }

      if(event.filter=="Sort By Price"){
        tradingListCardModels.sort((a, b) => a.tradingDataModel.value.compareTo(b.
        tradingDataModel.value));
      }
      else{
        tradingListCardModels.sort((a, b) => a.tradingDataModel.companyName.compareTo(b.
        tradingDataModel.companyName));
      }
      yield [];
      yield tradingListCardModels;
      this.add(KeepUpdateCreatePortfolioCubitEvent());
    }
  }


  UpdateTradingModel checkChanges(TradingDataModel oldData,TradingDataModel newData){
    double decrease = oldData.value - newData.value;
    double perDecrease = (decrease / oldData.value) * 100;
    return UpdateTradingModel(newData.value,perDecrease,perDecrease>0);
  }


}