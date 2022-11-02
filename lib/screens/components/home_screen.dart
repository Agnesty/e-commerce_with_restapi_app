import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:ecomerce_store_app/consts/enums.dart';
import 'package:ecomerce_store_app/model/product_model.dart';
import 'package:ecomerce_store_app/services/api_handler.dart';
import 'package:ecomerce_store_app/widgets/widget_export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController = TextEditingController();
    super.dispose;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.height * 0.4,
                        decoration: BoxDecoration(
                          color: Color(0xFF979797).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          controller: _textEditingController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 13),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: "Search product",
                              prefixIcon: Icon(Icons.search)),
                        ),
                      ),
                      AppBarIcons(
                        press: () {},
                        svgSrc: 'assets/icons/Cart Icon.svg',
                      ),
                      AppBarIcons(
                        press: () {
                        },
                        svgSrc: 'assets/icons/Bell.svg',
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: size.height * 0.25,
                        child: Swiper(
                          itemCount: 3,
                          itemBuilder: (ctx, index) {
                            return const SaleWidget();
                          },
                          autoplay: true,
                          pagination: const SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                  color: Colors.white,
                                  activeColor:
                                      Color.fromARGB(255, 5, 24, 53))),
                          // control: const SwiperControl(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SpecialOffer(),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Text(
                            "Latest Product",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: FutureBuilder<List<ProductsModel>>(
                          future: APIHandler.getAllProducts(limit: "3"),
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              Center(
                                child: Text(
                                    "An error occured ${snapshot.error}"),
                              );
                            } else if (snapshot.data == null) {
                              const Center(
                                child: Text("No products has been added yet"),
                              );
                            }
                            return FeedsGridWidget(
                                productsList: snapshot.data!);
                          })),
                    )
                  ]),
                ))
              ],
            ),
          )),
    );
  }
}
