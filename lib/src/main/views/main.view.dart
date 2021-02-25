import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gitstars/core/styles/styles.dart';
import 'package:gitstars/core/utils/utils.dart';
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
      body: Column(
        children: [
          Obx(() => controller.showSearch || !controller.userLoaded
              ? TextFormField(
                  controller: controller.userSearch,
                  decoration: InputDecoration(
                    labelText: "Nome do usuário:",
                    labelStyle: AppStyles.caption1,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  style: AppStyles.body2,
                  inputFormatters: [Utils.onlyLettersAndNumbers],
                  onFieldSubmitted: (value) => controller.fetch(),
                )
              : Container()),
          Expanded(
            child: Obx(() => controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : !controller.userLoaded
                    ? controller.userSearch.text.length > 0
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Usuário não encontrado."),
                          )
                        : Container()
                    : Column(
                        children: [
                          UserProfile(
                            user: controller.userStarsModel,
                            showBio: controller.showUserBio,
                            onShowBio: controller.changeUserBio,
                          ),
                          Divider(),
                          controller.userStarsModel.starredRepositories == null ||
                                  controller.userStarsModel.starredRepositories.nodes.length == 0
                              ? Text("Nenhum repositório favoritado.")
                              : Expanded(
                                  child: RefreshIndicator(
                                    onRefresh: () async => controller.fetch(),
                                    child: ListView.builder(
                                      itemCount: controller.userStarsModel.starredRepositories.nodes.length,
                                      itemBuilder: (_, index) {
                                        final item = controller.userStarsModel.starredRepositories.nodes[index];
                                        return StarredItens(
                                          node: item,
                                          onClick: () => controller.goToRepo(item),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                        ],
                      )),
          ),
        ],
      ),
    );
  }
}
