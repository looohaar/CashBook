

import 'package:url_launcher/url_launcher.dart';

class EmailAndUrl{
  static Future emailLauncher(String url) async{
    if (await canLaunch(url)) {
      await launch(url);
      
    }
  }
  static openEmail({
    required String toEmail,
    required String subject,})async{
      final url = 'mailto: $toEmail?subject=${Uri.encodeFull(subject)}';
      await emailLauncher(url);
    }
 static Future openLink({required String url})=> emailLauncher(url);
  
}