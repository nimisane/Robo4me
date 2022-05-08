import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:robo4me/Models/quickWatchModel.dart';
import 'package:robo4me/appColors.dart';
import 'package:dotted_line/dotted_line.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}
//Crypto Details API
/*
  POST REQUEST
  parameter :- Crypto Coin Name/ID
  Response:- 
  Complete Details of the coin
  1) Name/Logo
  2) Profit/Loss percentage
  3) Current Value
  4) Coordinates to plot graph
  5) Volume/High/Low
      
  */
class _WalletState extends State<Wallet> {
  String duration = "30m";
  String dialogDuration = "30m";

  List<QucikWatchModel> quickWatchList = [
    QucikWatchModel(
        amount: "46,512.45",
        cryptoName: 'BTC',
        logoPath: 'bitcoin_logo2.png',
        percentage: "-0.43%",
        profit: false),
    QucikWatchModel(
        amount: "1,6833",
        cryptoName: 'ADA',
        logoPath: 'ada_logo.png',
        percentage: "+1.03%",
        profit: true),
    QucikWatchModel(
        amount: "412,99",
        cryptoName: 'BNB',
        logoPath: 'bnb_logo.png',
        percentage: "-0.43%",
        profit: false),
  ];

  Widget customRadio(
    String text,
    bool dialog,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (dialog) {
            dialogDuration = text;
          } else {
            duration = text;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: !dialog
              ? (text == duration)
                  ? AppColors.appGreyColor
                  : AppColors.primaryColor
              : (text == dialogDuration)
                  ? AppColors.appGreyColor
                  : AppColors.primaryColor,
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              color: !dialog
                  ? (text == duration)
                      ? Colors.white
                      : AppColors.radioButtonColor
                  : (text == dialogDuration)
                      ? Colors.white
                      : AppColors.radioButtonColor),
        ),
      ),
    );
  }


  //Detail of selected Coin api
  /*
  POST REQUEST
  Parameter: coin name,
  response:
  1)Name/logo
  2)value
  3)profit/loss percentage

  */

  walletDialog(String name, bool profit, String amount, String logo) {
    return Dialog(
      backgroundColor: AppColors.primaryColor,
      child: Card(
        elevation: 4,
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: AppColors.cardBorderColor),
        ),
        child: Container(
          height: 300,
          width: 280,
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/$logo',
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$name/USDT",
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
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border:
                            Border.all(color: AppColors.containerBorderColor),
                      ),
                      child: const Text(
                        "+2.09 %",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: profit?Colors.green :Colors.orange,
                        boxShadow: [
                          BoxShadow(
                            color: profit?Colors.green.withOpacity(0.5):Colors.orange.withOpacity(0.5),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: RichText(
                            text:  TextSpan(children: [
                              TextSpan(
                                text: '$amount',
                                style: TextStyle(
                                    color: profit?Colors.green:Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
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
                                color: AppColors.textGreyColor,
                              ),
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
                            color: AppColors.appGreyColor.withOpacity(0.3),
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
                    customRadio("30m", true),
                    customRadio("1H", true),
                    customRadio("4H", true),
                    customRadio("1D", true),
                    customRadio("7D", true),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          elevation: 1,
          backgroundColor: AppColors.primaryColor,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Wallet",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset(
                'assets/images/refresh-button.png',
                height: 20,
                width: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset(
                'assets/images/code-scanning.png',
                height: 20,
                width: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset(
                'assets/images/star.png',
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/bitcoin_logo.png',
                      height: 28,
                      width: 28,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "BTC/USDT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.appGreyColor,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(color: AppColors.containerBorderColor),
                  ),
                  child: const Text(
                    "+2.09 %",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Colors.orange,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                            text: "46523",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                          TextSpan(
                            text: ".25",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
                            color: AppColors.textGreyColor,
                          ),
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
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
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
                      aboveBarData: BarAreaData(
                        show: true,
                        color: AppColors.appGreyColor.withOpacity(0.3),
                      ),
                      isCurved: true,
                      color: AppColors.graphLineColor,
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(2.6, 2),
                        FlSpot(4.2, 8),
                        FlSpot(6.8, 2.5),
                        FlSpot(8, 4),
                        FlSpot(9.5, 3),
                        FlSpot(12, 6),
                        FlSpot(11, 4),
                      ]),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vol",
                      style: TextStyle(
                          color: AppColors.textGreyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "2,528,061,551.80",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    height: 15,
                    width: 1,
                    color: AppColors.textGreyColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "High",
                      style: TextStyle(
                          color: AppColors.textGreyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "52,349.65",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    height: 15,
                    width: 1,
                    color: AppColors.textGreyColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Low",
                      style: TextStyle(
                          color: AppColors.textGreyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "40,8903.2",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DottedLine(
            direction: Axis.horizontal,
            lineLength: double.infinity,
            lineThickness: 2.0,
            dashLength: 6.0,
            dashColor: AppColors.appGreyColor,
            dashGapLength: 8.0,
            dashGapColor: Colors.transparent,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                customRadio("30m", false),
                customRadio("1H", false),
                customRadio("4H", false),
                customRadio("1D", false),
                customRadio("7D", false),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: 1,
            width: deviceWidth,
            color: AppColors.appGreyColor,
          ),
          SizedBox(
            height: 20,
          ),
          //Quick Watch API
            /*
              GET REQUEST
              
              Response:- 
              Quick Watch coins
              1) Name/Logo
              2) value
              3) profit/loss percentage

              
            */
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Quick Watch",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.builder(
              itemCount: quickWatchList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(builder: (context, setState) {
                            return walletDialog(quickWatchList[index].cryptoName,quickWatchList[index].profit,quickWatchList[index].amount,quickWatchList[index].logoPath);
                          });
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: deviceWidth,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/${quickWatchList[index].logoPath}',
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "${quickWatchList[index].cryptoName}",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "-",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          quickWatchList[index].profit
                              ? Icon(Icons.arrow_upward, color: Colors.white)
                              : Icon(Icons.arrow_downward, color: Colors.white),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "${quickWatchList[index].amount}",
                            style: TextStyle(color: Colors.white),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            "${quickWatchList[index].percentage}",
                            style: TextStyle(
                                color: quickWatchList[index].profit
                                    ? Colors.green
                                    : Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          SizedBox(
            height: 10,
          ),
          Container(
            width: deviceWidth,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
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
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.orange,
                      padding: EdgeInsets.all(15)),
                  onPressed: () {},
                  child: Icon(Icons.download, color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
