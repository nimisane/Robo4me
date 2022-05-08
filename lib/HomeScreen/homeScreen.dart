import 'package:flutter/material.dart';
import 'package:robo4me/Models/topCoinsModel.dart';
import 'package:robo4me/WalletScreen/wallet.dart';
import 'package:robo4me/appColors.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> duration = ["30m", "30m"];
  Widget customRadio(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          duration[index] = text;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: (text == duration[index])
              ? AppColors.appGreyColor
              : AppColors.primaryColor,
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 12,
              color: (text == duration[index])
                  ? Colors.white
                  : AppColors.radioButtonColor),
        ),
      ),
    );
  }

  List<TopCoinModel> topCoinModelList = [
    TopCoinModel(
        logo: 'bitcoin_logo.png',
        cryptnoName: 'BTC',
        cryptoAmount: "46523.25",
        cryptoColor: Colors.orange,
        percentage: 2.09),
    TopCoinModel(
        logo: 'e_logo.png',
        cryptnoName: 'ETH',
        cryptoAmount: "26524.43",
        cryptoColor: Colors.cyan[700]!,
        percentage: -1.90),
  ];

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: AppColors.appGreyColor,
                      padding: EdgeInsets.all(15)),
                  onPressed: () {},
                  child: Icon(Icons.sort, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Current Balance API
            /*
              POST REQUEST
              parameter :- User ID,
              Response:- 
              1) Current Balance of the user
              2) Percentage of Profit/Loss.

             */
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Current Balance",
                style: TextStyle(color: AppColors.textGreyColor, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              width: deviceWidth,
              child: Row(
                children: [
                  RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: "9.029411",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      TextSpan(
                        text: " BTC",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.appGreyColor,
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "+10.23 %",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Icon(
                    Icons.attach_money_outlined,
                    color: AppColors.textGreyColor,
                  ),
                  Text(
                    "418,623.25",
                    style: TextStyle(
                        color: AppColors.textGreyColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),

                        //Crypto Holding percentage API
                        /*
                          POST REQUEST
                          parameter :- User ID,
                          Response:- 
                          Percentage of each crypto holding
                          
                        */

                        const Text(
                          "Bitcoin: 70%",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.cyan[700],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.cyan[700]!.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "ETH: 25%",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.yellow.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "BNB: 9%",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                color: AppColors.appGreyColor,
                thickness: 0.2,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            //Deposit API
            /*
              POST REQUEST
              parameter :- User ID,Account Number,Amount
              Response:- 
              Success/Failure
              
            */
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: deviceWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            shape: const StadiumBorder(),
                          ),
                          child: Text(
                            "Deposit",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    //Withdraw API
                      /*
                        POST REQUEST
                        parameter :- User ID,Account Number,Amount
                        Response:- 
                        Success/Failure
                        
                      */
                    Expanded(
                      child: Container(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.appGreyColor,
                            shape: const StadiumBorder(),
                          ),
                          child: const Text(
                            "Withdraw",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Top Coins API
            /*
              GET REQUEST
              
              Response:- 
              LIST of top coins
              1) Coin name/Logo
              2) current value
              3) Profit/loss percentage
              4) coordinates to plot graph
              
            */
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Top Coins",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Filter",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Image.asset(
                          'assets/images/two_arrows.png',
                          height: 10,
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                height: 300,
                child: ListView.builder(
                    itemCount: topCoinModelList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      String s = topCoinModelList[index].cryptoAmount;

                      String result = s.substring(0, s.indexOf('.'));
                      String result2 = s.substring(s.indexOf('.') + 1);

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => Wallet()),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            elevation: 4,
                            color: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side:
                                  BorderSide(color: AppColors.cardBorderColor),
                            ),
                            child: Container(
                              height: 280,
                              width: 250,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/${topCoinModelList[index].logo}',
                                              height: 25,
                                              width: 25,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "${topCoinModelList[index].cryptnoName}/USDT",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 8),
                                          decoration: BoxDecoration(
                                            color: AppColors.appGreyColor,
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            border: Border.all(
                                                color: AppColors
                                                    .containerBorderColor),
                                          ),
                                          child: Text(
                                            topCoinModelList[index].percentage >
                                                    0
                                                ? "+${topCoinModelList[index].percentage} %"
                                                : "${topCoinModelList[index].percentage} %",
                                            style: TextStyle(
                                                color: topCoinModelList[index]
                                                            .percentage >
                                                        0
                                                    ? Colors.green
                                                    : Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 5,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            color: topCoinModelList[index]
                                                .cryptoColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: topCoinModelList[index]
                                                    .cryptoColor
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                    text: "$result",
                                                    style: TextStyle(
                                                        color: topCoinModelList[
                                                                index]
                                                            .cryptoColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                  TextSpan(
                                                    text: "${result2}",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: topCoinModelList[
                                                              index]
                                                          .cryptoColor,
                                                    ),
                                                  ),
                                                ]),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 20,
                                                  child: Icon(
                                                    Icons.attach_money_outlined,
                                                    color:
                                                        AppColors.textGreyColor,
                                                  ),
                                                ),
                                                Text(
                                                  "${topCoinModelList[index].cryptoAmount}",
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .textGreyColor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 80,
                                    child: LineChart(
                                      LineChartData(
                                        minX: 0,
                                        maxX: 11,
                                        minY: 0,
                                        maxY: 6,
                                        gridData: FlGridData(
                                          show: false,
                                        ),
                                        titlesData: FlTitlesData(
                                          show: false,
                                        ),
                                        borderData: FlBorderData(show: false),
                                        lineBarsData: [
                                          LineChartBarData(
                                              belowBarData: BarAreaData(
                                                show: true,
                                                color: AppColors.appGreyColor
                                                    .withOpacity(0.3),
                                              ),
                                              isCurved: true,
                                              color: AppColors.graphLineColor,
                                              spots: [
                                                FlSpot(0, 3),
                                                FlSpot(2.6, 2),
                                                FlSpot(4.2, 6),
                                                FlSpot(6.8, 2.5),
                                                FlSpot(8, 4),
                                                FlSpot(9.5, 3),
                                                FlSpot(11, 4),
                                              ]),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        customRadio("30m", index),
                                        customRadio("1H", index),
                                        customRadio("4H", index),
                                        customRadio("1D", index),
                                        customRadio("7D", index),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
