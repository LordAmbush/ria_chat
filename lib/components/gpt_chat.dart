import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class GptChat extends StatelessWidget {
  const GptChat({@required this.msg, @required this.chatIndex, this.shouldAnimate = false});

  final String msg;
  final int chatIndex;
  final bool shouldAnimate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? gptBackgroundColor : gptCardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0 ? "images/logo.png" : "images/chat_logo.png",
                  height: 30,
                  width: 30,
                ),
                SizedBox(width: 8),
                Flexible(
                  child: chatIndex == 0 ?
                      //sender message
                  Text(msg, style: kGptTextStyle) :
                      //chatGpt message
                  shouldAnimate ?
                  DefaultTextStyle(
                    style: kGptTextStyle,
                      //animacion para el texto para que emule el comportamiento de chatGpt web
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        repeatForever: false,
                        displayFullTextOnTap: true,
                        totalRepeatCount: 1,
                        animatedTexts: [TyperAnimatedText(msg)],)
                    ,
                  ):Text(
                    msg.trim(),
                    style: kGptTextStyle,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
