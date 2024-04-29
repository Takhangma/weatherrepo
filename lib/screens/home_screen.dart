import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Home",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerRight,
                        child: const Icon(Icons.notifications_active_outlined)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 251, 251, 251),
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: searchController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    label: Text(
                      "Search on kupa",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //shadow jasto baki
                      Stack(
                        children: [
                          //Green container
                          Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: BoxDecoration(
                                    color: const Color(0xff307A59),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Delivery to Home",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Utama Street no. 14,Rumbai",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: Colors.white),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Text("2.4 km"),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 30,
                                bottom: -30,
                                child: Container(
                                  padding: const EdgeInsets.all(30),
                                  decoration: BoxDecoration(
                                    // shape: BoxShape.circle,
                                    borderRadius: BorderRadius.circular(50),
                                    color: const Color(0xff296A4D),
                                    // color: Colors.red,
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.all(2),
                                    padding: const EdgeInsets.all(20),
                                    decoration: const BoxDecoration(
                                        color: Color(0xff307A59),
                                        shape: BoxShape.circle),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            left: 17,
                            right: 17,
                            bottom: -0,
                            child: Container(
                              height: 10,
                              //margin: const EdgeInsets.all(14),
                              //padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                  color: Color(0xffBAD3C8)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // color: const Color(0xffC5CAC6),
                          color: const Color(0xffEBF2EF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Chicken Teriyaki",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Discount 25%",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff2C6A54),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text("Order Now",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: Colors.white)),
                                ),
                              ],
                            ),
                            Container(
                              // height: 50,
                              // width: 50,
                              padding: const EdgeInsets.all(50),
                              decoration: const BoxDecoration(
                                // color: Colors.red,
                                // borderRadius: BorderRadius.circular(1),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("asset/images/tasty.png"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Text(
                          "Top of week",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            topMenuMethod(
                                foodImage: "asset/images/food.jpeg",
                                foodName: "Hongkong hainane",
                                foodPrice: 14.99),
                            topMenuMethod(
                                foodImage: "asset/images/food.jpeg",
                                foodName: "Hot & Sour Corn",
                                foodPrice: 20.09),
                            topMenuMethod(
                                foodImage: "asset/images/food.jpeg",
                                foodName: "Singapura Khaneykura",
                                foodPrice: 24.99),
                            topMenuMethod(
                                foodImage: "asset/images/food.jpeg",
                                foodName: "Good food",
                                foodPrice: 12.99),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomNavigationBar(
                elevation: 0,
                selectedItemColor: const Color(0xff307A59),
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.restaurant_menu_sharp), label: "Menu"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_sharp), label: "Cart"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_rounded), label: "Profile"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget topMenuMethod(
      {required String foodImage,
      required String foodName,
      required double foodPrice}) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            padding: const EdgeInsets.all(10),
            // margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(foodImage),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.006,
          ),
          Text(
            foodName,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.006,
          ),
          Text(
            "\$$foodPrice",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: const Color(0xff307A59), fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
