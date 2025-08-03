import 'package:finsense/data/1.dart';

List<money> geter() {
  money upwork = money();
  upwork.name = 'upwork';
  upwork.fee = '650';
  upwork.time = 'today';
  upwork.image = 'Education.png';
  upwork.buy = false;
  money starbucks = money();
  starbucks.buy = true;
  starbucks.fee = '15';
  starbucks.image = 'food.png';
  starbucks.name = 'starbucks';
  starbucks.time = 'today';
  money trasfer = money();
  trasfer.buy = true;
  trasfer.fee = '100';
  trasfer.image = 'Transfer.png';
  trasfer.name = 'trasfer for sam';
  trasfer.time = 'jan 30,2022';
  money snap_food = money();
  snap_food.time = 'jan 30,2022';
  snap_food.image = 'food.png';
  snap_food.buy = true;
  snap_food.fee = '-100';
  snap_food.name = 'macdonald';

  money snap = money();
  snap.image = 'Transfer.png';
  snap.time = 'today';
  snap.buy = true;
  snap.name = 'Transfer';
  snap.fee = '-60';
  return [upwork, starbucks, trasfer, upwork, starbucks, trasfer, snap_food, snap];
}