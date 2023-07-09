import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_btn_view_app/Presentation/Screens/confirm_page.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
            child: SwipeableButtonView(
          buttonText: 'Slide to Pay',
          buttontextstyle: const TextStyle(fontSize: 25, color: Colors.white),
          buttonWidget:
              const Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
          activeColor: const Color(0xFF009C41),
          onWaitingProcess: () {
            // - - -
            // Amount of time the circular progress
            // indicator spins before navigating to next page
            //- - -
            Future.delayed(const Duration(seconds: 2),
                () => setState(() => isFinished = true));
          },
          isFinished: isFinished,
          onFinish: () async {
            // - - - Navigate to confirmation page - - -
            await Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: const ConfirmationPage()));
            // - - - Reset isFinished variable  - - -
            setState(() => isFinished = false);
          },
        )),
      ),
    );
  }
}
