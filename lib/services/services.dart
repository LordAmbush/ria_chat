import 'package:flutter/material.dart';

import '../components/dropdown.dart';
import '../constants.dart';

class Services{

  static Future<void> modalSheet(BuildContext context) async{

    await showModalBottomSheet(backgroundColor: gptBackgroundColor, context: context, builder: (context){
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Text("Chosen Model:", style: kGptTextStyle,),),
            Flexible(
                flex: 2,
                child: DropDown()),
          ],
        ),
      );
    });
  }

}