import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_ui/screens/mobile_chat_screen.dart';
import 'package:whatsapp_ui/widgets/info.dart';
import 'package:whatsapp_ui/common/widgets/text_widget.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: info.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MobileChatScreen(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                        title: CustomText(
                          info[index]['name'].toString(),
                          fontSize: 18,
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 6.h),
                          child: CustomText(
                            maxLines: 1,
                            info[index]['message'].toString(),
                            fontSize: 15,
                          ),
                        ),
                        leading: CircleAvatar(
                          radius: 25.r,
                          backgroundImage: NetworkImage(
                            info[index]['profilePicUrl'].toString(),
                          ),
                        ),
                        trailing: CustomText(
                          info[index]['time'].toString(),
                          fontSize: 15,
                        )),
                    const Divider(
                      indent: 1,
                      endIndent: 1,
                      height: 1,
                      thickness: 1,
                         
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
