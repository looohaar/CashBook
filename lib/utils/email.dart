

import 'package:url_launcher/url_launcher.dart';


void emailLauncher() async{
  final String url=
  'mailto:looohaar@gmail.com?subject=${Uri.encodeFull('Feedback of CashBook')}&body=${Uri.encodeFull('')}';
  await launch(url);
}
void aboutmeLauncher()async{
 const url=
  'www.linkedin.com/in/rahul-rajeev-500b1b200';
  if(await canLaunch(url)){
    await launch(url);
  }else{
   throw 'Could not launch $url';
  }
  
}