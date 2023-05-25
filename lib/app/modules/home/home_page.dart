import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      drawer: buildDrawer(),
      controller: controller.drawerController,
      backdropColor: const Color(0xFF022162),
      childDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      openRatio: 0.76,
      openScale: 0.86,
      // disabledGestures: true,
      child: buildView(),
    );
  }

  Widget buildDrawer() {
    return Container(
      padding: const EdgeInsets.only(left: 52),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 98 + 89,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 98,
                  child: CircleAvatar(
                    radius: 89 / 2,
                    backgroundColor: Colors.white.withOpacity(0.6),
                  ),
                ),
                Positioned(
                  left: 196 - 52,
                  top: 80,
                  child: GestureDetector(
                    onTap: () {
                      controller.drawerController.hideDrawer();
                    },
                    child: CircleAvatar(
                      radius: 46 / 2,
                      backgroundColor: Colors.white.withOpacity(0.6),
                      child: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 34),
          Text(
            "Link\nMitchell",
            style: TextStyle(
              color: Colors.white.withOpacity(0.99),
              fontSize: 33,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 28),
          buildMenuTile(
            title: 'Templetes',
            icon: Icon(
              Icons.bookmark_rounded,
              color: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 22),
          buildMenuTile(
            title: 'Categories',
            icon: Icon(
              Icons.category_rounded,
              color: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 22),
          buildMenuTile(
            title: 'Analytics',
            icon: Icon(
              Icons.analytics_rounded,
              color: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 22),
          buildMenuTile(
            title: 'Settings',
            icon: Icon(
              Icons.settings_rounded,
              color: Colors.grey.shade300,
            ),
          ),
          const Spacer(),
          const Text(
            "Good",
            style: TextStyle(
              color: Color(0x4cffffff),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Consistency",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 90),
        ],
      ),
    );
  }

  Widget buildMenuTile({
    String? title,
    Widget? icon,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              child: icon,
            ),
            const SizedBox(width: 16),
            Text(
              "$title",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildView() {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/new-task');
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.drawerController.showDrawer();
                  },
                  child: const Icon(
                    Icons.menu_rounded,
                    color: Colors.black54,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.search_rounded,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(width: 18),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.notifications_rounded,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: const Text(
              "What’s up,Link!",
              style: TextStyle(
                color: Color(0xff183161),
                fontSize: 32,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, left: 32),
                    child: const Text(
                      "CATEGORIES",
                      style: TextStyle(
                        color: Color(0xb2183161),
                        fontSize: 12,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.96,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                    ),
                    height: 112,
                    child: ListView.separated(
                      clipBehavior: Clip.none,
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 0,
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.white,
                          child: Container(
                            width: 187,
                            height: 112,
                            padding: const EdgeInsets.only(
                                top: 26, left: 16, right: 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "40 tasks",
                                  style: TextStyle(
                                    color: Color(0xb2183161),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "Business",
                                  style: TextStyle(
                                    color: Color(0xb2183161),
                                    fontSize: 18,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 21),
                                Container(
                                  height: 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: const Color(0xffd9d9d9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 12);
                      },
                      itemCount: 3,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, left: 32),
                    child: const Text(
                      "TODAY’S TASKS",
                      style: TextStyle(
                        color: Color(0xb2183161),
                        fontSize: 12,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.96,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Card(
                      elevation: 0,
                      margin: EdgeInsets.only(
                        left: 32,
                        right: 32,
                        bottom: 8,
                        top: index == 0 ? 22 : 0,
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        height: 64,
                        child: Row(
                          children: const [
                            // Icon(Icons.check_circle_outline_rounded),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.radio_button_off_outlined,
                                size: 24,
                              ),
                            ),
                            Text(
                              "Daily meeting with team",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    childCount: 10,
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
