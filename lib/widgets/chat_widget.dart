import 'package:chatgbt_4/constants/constants.dart';
import 'package:chatgbt_4/services/assets_maneger.dart';
import 'package:chatgbt_4/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.chatIndex, required this.chatMsg, required bool shouldAnimate, required String msg});

  final int chatIndex;
  final String chatMsg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? cardColor : scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetsManeger.person
                      : AssetsManeger.openIlogo,
                  height: 30,
                  width: 45,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextWidget(
                    label: chatMsg,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
