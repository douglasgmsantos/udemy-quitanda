import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/home/components/category_title.dart';

import 'package:quitanda/src/config/app_data.dart' as app_data;
import 'package:quitanda/src/pages/home/components/item_tite.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = "Frutas";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title:
            Text.rich(TextSpan(style: const TextStyle(fontSize: 30), children: [
          TextSpan(
              style: TextStyle(color: CustomColors.customSwatchColor),
              text: "Green"),
          TextSpan(
              style: TextStyle(color: CustomColors.customContrastColors),
              text: "grocer")
        ])),
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
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Padding(
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
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none))),
            ),

            //Categorias
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: 40,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => CategoryTitle(
                        onPressed: () {
                          setState(() {
                            selectedCategory = app_data.categories[index];
                          });
                        },
                        category: app_data.categories[index],
                        isSelected:
                            selectedCategory == app_data.categories[index],
                      ),
                  separatorBuilder: (_, index) => const SizedBox(width: 10),
                  itemCount: app_data.categories.length),
            ),

            //itens
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 11.5),
                  itemCount: app_data.items.length,
                  itemBuilder: (_, index) => ItemTite(
                        item: app_data.items[index],
                      )),
            )
          ],
        ),
      ),
    );
  }
}
