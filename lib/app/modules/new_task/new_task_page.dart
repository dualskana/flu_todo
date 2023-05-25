import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'new_task_controller.dart';

class NewTaskPage extends GetView<NewTaskController> {
  const NewTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          buildCloseButton(),
          buildNewTaskButton(),
          buildActions(),
          buildSubActions(),
          Positioned(
            left: 46,
            right: 46,
            top: Get.height / 2 - 54 - 52,
            child: const TextField(
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              cursorColor: Color(0xff0575ff),
              decoration: InputDecoration(
                hintText: 'Enter new task',
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black26,
                    width: 2,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff0575ff),
                    width: 2,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Positioned buildActions() {
    return Positioned(
      bottom: Get.height / 2 - 27,
      left: 46,
      child: Row(
        children: [
          Obx(
            () {
              var currentColor = controller.isTodaySelected.value
                  ? const Color(0xff0575ff)
                  : Colors.black26;
              return GestureDetector(
                onTap: () {
                  controller.isTodaySelected.toggle();
                },
                child: Container(
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(54),
                    border: Border.all(
                      color: currentColor,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 16),
                      Icon(
                        Icons.calendar_today_rounded,
                        color: currentColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Today",
                        style: TextStyle(
                          color: currentColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 10),
          Obx(() {
            var currentColor = controller.isCompletedSelected.value
                ? const Color(0xff0575ff)
                : Colors.black26;
            return GestureDetector(
              onTap: () {
                controller.isCompletedSelected.toggle();
              },
              child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(54),
                  border: Border.all(
                    color: currentColor,
                    width: 2,
                  ),
                ),
                child: Icon(
                  controller.isCompletedSelected.value
                      ? Icons.radio_button_on_rounded
                      : Icons.radio_button_off_rounded,
                  color: currentColor,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Positioned buildSubActions() {
    return Positioned(
      bottom: 254,
      left: 0,
      right: 0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.create_new_folder_outlined,
            color: Colors.black26,
          ),
          SizedBox(width: 48),
          Icon(
            Icons.flag_outlined,
            color: Colors.black26,
          ),
          SizedBox(width: 48),
          Icon(
            Icons.dark_mode_outlined,
            color: Colors.black26,
          ),
        ],
      ),
    );
  }

  Positioned buildCloseButton() {
    return Positioned(
      top: 58,
      right: 38,
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(54),
            border: Border.all(
              color: Colors.black26,
              width: 2,
            ),
          ),
          child: const Icon(
            Icons.close_rounded,
            color: Colors.black26,
          ),
        ),
      ),
    );
  }

  Positioned buildNewTaskButton() {
    return Positioned(
      right: 38,
      bottom: (Get.mediaQuery.padding.bottom > 0)
          ? Get.mediaQuery.padding.bottom
          : 45,
      child: Container(
        width: 184,
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(31),
          boxShadow: [
            BoxShadow(
              color: Color(0x3f0575ff),
              blurRadius: 8,
              offset: Offset(0, 8),
            ),
          ],
          color: Color(0xff0575ff),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 36,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "New task",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 16),
            Icon(
              Icons.keyboard_arrow_up_rounded,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
