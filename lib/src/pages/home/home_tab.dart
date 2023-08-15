import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/home/components/category_title.dart';

import 'package:quitanda/src/config/app_data.dart' as app_data;
import 'package:quitanda/src/pages/home/components/item_tite.dart';
import 'package:quitanda/src/pages/shared/app_name_widget.dart';
import 'package:quitanda/src/pages/shared/custom_shimmer.dart';
import 'package:quitanda/src/utils/utils_services.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = "Frutas";

  final UtilsServices utilsService = UtilsServices();

  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 2), () => setState(() => isLoading = false));
    super.initState();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    GlobalKey<CartIconKey> globalKeyCartItem = GlobalKey<CartIconKey>();
    late Function(GlobalKey) runAddToCartAnimation;

    void itemSelectedCartAnimation(GlobalKey gkImage) =>
        runAddToCartAnimation(gkImage);

    return Scaffold(
      //App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const AppNameWidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: CustomColors.customContrastColors,
                label: const Text(
                  '1',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: AddToCartIcon(
                  key: globalKeyCartItem,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: AddToCartAnimation(
        cartKey: globalKeyCartItem,
        jumpAnimation: const JumpAnimationOptions(
            curve: Curves.ease, duration: Duration(microseconds: 300)),
        createAddToCartAnimation: (runAddToCartAnimationAction) {
          runAddToCartAnimation = runAddToCartAnimationAction;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              //Campo de pesquisa
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    hintText: "Pesquise aqui ...",
                    hintStyle:
                        TextStyle(color: Colors.grey.shade500, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.search,
                      color: CustomColors.customContrastColors,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none))),
              ),

              //Categorias
              Container(
                padding: const EdgeInsets.only(top: 10),
                height: 40,
                child: !isLoading
                    ? ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => CategoryTitle(
                              onPressed: () {
                                setState(() {
                                  selectedCategory = app_data.categories[index];
                                });
                              },
                              category: app_data.categories[index],
                              isSelected: selectedCategory ==
                                  app_data.categories[index],
                            ),
                        separatorBuilder: (_, index) =>
                            const SizedBox(width: 10),
                        itemCount: app_data.categories.length)
                    : ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            10,
                            (index) => Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(right: 12),
                                child: const CustomShimmer(
                                    height: 20, width: 50))),
                      ),
              ),

              //itens
              Expanded(
                child: !isLoading
                    ? GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 9 / 11.5),
                        itemCount: app_data.items.length,
                        itemBuilder: (_, index) => ItemTite(
                            item: app_data.items[index],
                            cartAnimationMethod: itemSelectedCartAnimation))
                    : GridView.count(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 11.5,
                        children: List.generate(
                            10,
                            (index) => CustomShimmer(
                                  height: double.infinity,
                                  width: double.infinity,
                                  borderRadius: BorderRadius.circular(20),
                                )),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
