import 'package:flutter/material.dart';
import 'package:practice3/model/store.dart';

class RemainStatWidget extends StatelessWidget {
 final Store store;

   RemainStatWidget(this.store);

  @override
  Widget build(BuildContext context) {
    return _buildRemainStatWidget(store);
  }
}

Widget _buildRemainStatWidget(Store store) {
  var remainStat = '판매중지';
  var description = '';
  var color = Colors.black;
  switch (store.remainStat) {
    case 'plenty':
      remainStat = '충분';
      description = '100개 이상';
      color = Colors.green;
      break;
    case 'some':
      remainStat = '보통';
      description = '30개 이상';
      color = Colors.yellow;
      break;
    case 'few':
      remainStat = '부족';
      description = '2개 이상';
      color = Colors.red;
      break;
    case 'empty':
      remainStat = '소진임밥';
      description = '1개 이하';
      color = Colors.grey;
      break;
    default:
  }

  return Column(
    children: <Widget>[
      Text(remainStat, style: TextStyle(color: color)),
      Text(description, style: TextStyle(color: color)),
    ],
  );
}