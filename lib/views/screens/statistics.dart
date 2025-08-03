import 'package:finsense/common/widgets/charts.dart';
import 'package:finsense/data/dummy_data.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
   List day = ['Day', 'Week', 'Month', 'Year'];
  //List f = [today(), week(), month(), year()];
  int index_color = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 20),
              Text(
                'Statistics',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
               SizedBox(height: 20),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                    ...List.generate(4,
                    (index){
                      return GestureDetector(
                        onTap : (){
                           setState(() {
                              index_color = index;
                              //kj.value = index;
                            });
                        },
                        child: Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: index_color == index
                                          ? Color.fromARGB(255, 47, 125, 121)
                                          : Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      day[index],
                                      style: TextStyle(
                                        color: index_color == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                      );
                    }
                    )
                   ],
                 ),
               ),
                 SizedBox(height: 20),
               SizedBox(
                height: 300,
                 child: Chart(
                  //indexx: index_color,
                               ),
               ),
              SizedBox(height: 20),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Spending',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.swap_vert,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              ],
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context,index){
             return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset("assets/images/${geter()[index].image!}"),
                          ),
                          title: Text(geter()[index].name!,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                          ),),
                          subtitle: Text(geter()[index].time!,
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),),
                          trailing: Text('\$ ${geter()[index].fee!}',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: geter()[index].buy! ?Colors.red :Colors.green,
                          ),),
                        );
                      
          },
          childCount: geter().length,
          ))
         ],
      )),
    );
  }
  
}