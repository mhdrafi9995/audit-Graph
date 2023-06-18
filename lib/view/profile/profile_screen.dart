import 'package:flutter/material.dart';
import 'package:infotask/util/profile_data.dart';
import 'package:infotask/util/responces.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var toogle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: R.sh(10, context)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  SizedBox(
                    height: R.sh(110, context),
                    width: R.sw(110, context),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/profile.png",
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300)),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.camera_alt_rounded)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: R.sw(20, context)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "jown wick",
                      style: TextStyle(
                          fontSize: R.sw(22, context),
                          fontWeight: FontWeight.w500),
                    ),
                    const Text("jownwick@gmail.com"),
                    SizedBox(
                      height: R.sh(10, context),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Edite Profile"),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: R.sh(14, context),
              ),
              Divider(
                color: Colors.grey[200],
              ),
              Container(
                height: R.sh(460, context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: ListView.separated(
                    itemCount: profileData.length,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(profileData[index].icons1),
                        title: Text(profileData[index].name),
                        trailing: Icon(profileData[index].icons2),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 6,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
