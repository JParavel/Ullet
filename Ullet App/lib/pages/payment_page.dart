import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trip_flutter/component/colors.dart';
import 'package:platzi_trip_flutter/widgets/buttons.dart';
import 'package:platzi_trip_flutter/widgets/large_buttons.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 80,left: 20,right: 20),
          height: h,
          width: w,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      "images/paymentbackground.png"
                  )
              )
          ),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: h*0.14,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                            "images/success.png"
                        )
                    )
                ),
              ),
              Text(
                'Success !',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColor.mainColor,
                ),
              ),
              Text(
                'Payment completed successfully',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColor.idColor,
                ),
              ),
              SizedBox(height: h*0.045,),
              Container(
                height: 160,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.withOpacity(0.5)
                  )
                ),
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (_,index){
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 15,left: 20),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.green,
                                  ),
                                  child: Icon(Icons.done,size: 30,color:Colors.white,),
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dunord: Terrace',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.mainColor,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      'ID: 1231412',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.idColor,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  children: [
                                    Text(
                                      '\$13,500.00',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.mainColor,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.mainColor,
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                            Divider(thickness: 2,color: Colors.grey.withOpacity(0.5),),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 15,left: 20),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.green,
                                  ),
                                  child: Icon(Icons.done,size: 30,color:Colors.white,),
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dunord: Cafe',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.mainColor,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      'ID: 1231412',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.idColor,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  children: [
                                    Text(
                                      '\$18,500.00',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.mainColor,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.mainColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: h*0.02,),
              Column(
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.idColor
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    '\$32,000.00',
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColor.idColor,
                      fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
              SizedBox(height:h*0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButtons(icon: Icons.share_sharp, onTap:(){},text: 'Share',),
                  SizedBox(width: 80,),
                  AppButtons(icon: Icons.print_outlined, onTap:(){},text: 'Print',),
                ],
              ),
              SizedBox(height: h*0.02,),
              AppLargeButton(text: 'Done',backgroundColor: Colors.white,textColor: AppColor.mainColor,onTap: (){Get.back();},)
            ],
          ),
        ),
    );
  }
}
