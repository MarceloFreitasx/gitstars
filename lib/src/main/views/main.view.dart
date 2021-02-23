import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gitstars/core/styles/styles.dart';
import 'package:gitstars/src/main/controllers/main.controller.dart';
import 'package:gitstars/src/main/widgets/starreditens.widget.dart';
import 'package:gitstars/src/main/widgets/userprofile.widget.dart';

class MainView extends GetView<MainController> {
  const MainView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("GitStars", style: AppStyles.head2.copyWith(color: Colors.white)),
            Container(width: 5),
            Text("by @MarceloFreitasx", style: AppStyles.caption1.copyWith(color: Colors.white)),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () => controller.showSearch = !controller.showSearch,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => controller.showSearch
                ? TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nome do usuário:",
                      labelStyle: AppStyles.caption1,
                      contentPadding: EdgeInsets.all(10),
                    ),
                    style: AppStyles.body2,
                  )
                : Container()),
            Obx(() => controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : controller.userStarsModel.starredRepositories.nodes.length == 0
                    ? Text("Vazio")
                    : ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: controller.userStarsModel.starredRepositories.nodes.length + 1,
                        itemBuilder: (_, index) {
                          if (index == 0) {
                            return UserProfile(user: controller.userStarsModel);
                          } else {
                            final item = controller.userStarsModel.starredRepositories.nodes[index - 1];
                            return StarredItens(node: item);
                          }
                        },
                        separatorBuilder: (_, __) => Divider(height: 1),
                      )),
          ],
        ),
      ),
    );
  }
}
