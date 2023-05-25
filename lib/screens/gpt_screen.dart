import 'package:flash_chat/constants.dart';
import 'package:flash_chat/services/gpt_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flash_chat/services/services.dart';
import 'package:flash_chat/components/gpt_chat.dart';
import 'package:provider/provider.dart';

import '../components/chat_model.dart';
import '../services/gpt_service.dart';
import '../services/models_provider.dart';

class GptScreen extends StatefulWidget {
  static String id = "gpt_screen";

  @override
  State<GptScreen> createState() => _GptScreenState();
}

class _GptScreenState extends State<GptScreen> {
  bool _isTyping = false;
  ScrollController scrollController;
  TextEditingController textEditingController;
  FocusNode focusNode;

  @override
  void initState() {
    scrollController = ScrollController();
    focusNode = FocusNode();
    textEditingController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    scrollController.dispose();
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    final gptProvider = Provider.of<GptProvider>(context);
    return Scaffold(
      backgroundColor: gptBackgroundColor,
      appBar: AppBar(
        backgroundColor: gptCardColor,
        elevation: 2.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/openai_logo.jpg'),
        ),
        title: Text("Chat GPT"),
        actions: [
          IconButton(
            onPressed: () async{ await Services.modalSheet(context);},
            icon: Icon(Icons.more_vert_rounded, color: Colors.white,),),
          IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white,))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              //usamos el provider para obtener los mensajes para que se guarden al salir de la screen
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: gptProvider.getChatList.length,
                  itemBuilder: (context,index){
                    return GptChat(
                        msg: gptProvider.getChatList[index].message,
                        chatIndex: gptProvider.getChatList[index].chatIndex,
                        shouldAnimate: gptProvider.getChatList.length - 1 == index)
                    ;
              }),
            ),
          _isTyping ? Container(child: LinearProgressIndicator(backgroundColor: gptCardColor, color: gptBackgroundColor)) : SizedBox(width: 0, height: 0),
          Material(
            color: gptCardColor,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(children: [
                Expanded(child:
                  TextField(
                    focusNode: focusNode,
                    style:  TextStyle(color: Colors.white),
                    controller: textEditingController,
                    onSubmitted: (value) async{
                      await sendMessage(modelsProvider, gptProvider);
                    },
                    decoration: InputDecoration.collapsed(
                        hintText: "How can I help you?",
                        hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: ()async{
                      await sendMessage(modelsProvider, gptProvider);
                    },
                    icon: Icon(Icons.send, color: Colors.white,),),
                ],),
            ),
          ),
          ],
        ),
      ),
    );
  }

  void scrollList(){
    scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.easeOut);
  }

  Future<void> sendMessage(ModelsProvider modelsProvider, GptProvider gptProvider) async{
    //prevenir mensajes vacios
    if(textEditingController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Please type a message",
            style: kGptTextStyle
        ),
        backgroundColor: Colors.red,
      )
      );
      return;
    }
    //prevenir spam de mensajes
    if(_isTyping){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Wait for the previous response please",
            style: kGptTextStyle
        ),
        backgroundColor: Colors.red,
      )
      );
      return;
    }
    setState(() {
      _isTyping = true;
      //usamos providers para mantener la conversacion con la AI si salimos y volvemos de la pantalla
      //chatList.add(ChatModel(message: textEditingController.text, chatIndex: 0));
      gptProvider.addUserMsg(textEditingController.text);
    });

    try{
      await gptProvider.gptMessageAndAnswer(textEditingController.text, modelsProvider.currentModel);
      //chatList.addAll(await GptService.sendMessage(textEditingController.text, modelsProvider.currentModel));
      setState(() {
        textEditingController.clear();
        focusNode.unfocus();
      });
    }catch(error){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            error.toString(),
            style: kGptTextStyle
          ),
        backgroundColor: Colors.red,
        )
      );
    }finally{
      setState(() {
        scrollList();
        _isTyping = false;
      });
    }
  }
}