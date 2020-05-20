import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/sidebar_animation_flutter/lib/src/util/mobnumber.dart';
import 'package:sidebaranimationflutter/sidebar/sidebar_layout.dart';

class AuthService {
  // Handles Auth
  handleAuth(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot){
        if(snapshot.hasData){
          return SideBarLayout();
        }
        else{
          return LoginScreen();
        }
      },
    );
  }

  //Sign out
   signOut() {
    FirebaseAuth.instance.signOut();
   }

  //SignIn()
   signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
   }

   signInWithOTP(smsCode, verId){
    AuthCredential authCreds = PhoneAuthProvider.getCredential(verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
   }
}
