import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_ui/widgets/colours.dart';
import 'package:whatsapp_ui/common/widgets/text_widget.dart';

class MessgaeCard extends StatelessWidget {
  final String message;
  final String date;
  const MessgaeCard({
    super.key,
    required this.date,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          color: messageColor,
          margin: const EdgeInsets.symmetric(
            horizontal: 7,
            vertical:15,
          ),
          elevation: 1,
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 30,
                  bottom: 20,
                  top: 5,
                ),
                child: CustomText(
                  message,
                  fontSize: 16,
                ),
              ),
              Positioned(
                  bottom: 2,
                  right: 10,
                  child: Row(
                    children: [
                      CustomText(
                        date,
                        fontSize: 13,
                        color: Colors.white60,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(Icons.done_all),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
