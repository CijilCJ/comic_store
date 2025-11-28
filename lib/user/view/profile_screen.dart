
import 'dart:io';

import 'package:comic_world/controller/authentication_controller.dart';
import 'package:comic_world/controller/profile_image_provider.dart';
import 'package:comic_world/user/view/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  File? pickedImage;

  @override
  Widget build(BuildContext context) {
  final profile = context.watch<ProfileImageProvider>();
  final user = Supabase.instance.client.auth.currentUser;
  final username = user?.userMetadata?['username'] ?? "No Name";
  final email = user?.email ?? "No Email";
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()=>_signOut(), icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 20,
          children: [
            Stack(  
              children:[ 
                CircleAvatar(
                radius: 60,
                backgroundImage: profile.profileImage != null
                    ? FileImage(profile.profileImage!)
                    : const AssetImage("assets/user.png") as ImageProvider,
                    
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55.0,top: 75),
                child: IconButton(onPressed: ()async{Navigator.pop(context);
                    _pickImageSource(ImageSource.camera);
                    }, icon: Icon(Icons.camera_alt)),
              )
          ]),
            Title(color: Colors.black, child: Text("$username")),
                  Text("$email"),
            ListTile(
              onTap: (){},
              title: Text("notification"),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: (){},
              title: Text("system"),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: (){},
              title: Text("Contact Us"),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: (){},
              title: Text("privacy policy"),
              trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              onTap: (){},
              title: Text("Terms & Conditions"),
              trailing: Icon(Icons.arrow_right),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _signOut ()async{
    final auth = Provider.of<AuthenticationController>(context, listen: false);

    await auth.signoutFunction();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LogInScreen()),
        (route) => false, 
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("LogOut succesfuly")),
      );
    
  }

  Future<void> _pickImageSource(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        pickedImage = File(pickedFile.path);
      });
    }
  }
}




//          circleAvatar(
//                 radius: 50,
//                 child: IconButton(onPressed: (){
//                   if(pickedImage==null){
//                     Navigator.pop(context);
//                     _pickImageSource(ImageSource.gallery);
//                   }else{
//                     Navigator.pop(context);
//                     _pickImageSource(ImageSource.camera);
//                   }
//                 }, icon: Icon(Icons.person)),
//               ),