import 'package:chat_gpt_app/constants/constants.dart';
import 'package:chat_gpt_app/services/assets_manager.dart';
import 'package:chat_gpt_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ChatWidget extends StatelessWidget {
  final String message;
  final int chatIndex;
  const ChatWidget({super.key, required this.message, required this.chatIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetsManager.userImage
                      : AssetsManager.botImage,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 8),
                Expanded(
                    child: (chatIndex == 0)
                        ? TextWidget(label: message)
                        : DefaultTextStyle(
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                            child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              repeatForever: false,
                              displayFullTextOnTap: true,
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TyperAnimatedText(message.trim())
                              ],
                            ),
                          )),
                chatIndex == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.thumb_down_alt_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      )
              ],
            ),
          ),
        )
      ],
    );
  }
}
