import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/ui/auth/auth_cubit.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    context.read<AuthCubit>().resetState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                    ],
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Padding(
                //     padding: EdgeInsets.only(bottom: 10.heightAdjusted),
                //     child: GestureDetector(
                //       // onTap: () =>
                //       //     globalNavigateTo(route: Routes.termsAndConditions),
                //       child: Container(
                //           margin: const EdgeInsets.only(top: 16),
                //           child: RichText(
                //             textAlign: TextAlign.center,
                //             text: TextSpan(
                //                 text: 'By continuing you agree to the ',
                //                 style: regularText(
                //                     color: kTextColor, fontSize: 12),
                //                 children: [
                //                   TextSpan(
                //                       text: 'Privacy Terms & Conditions',
                //                       style: regularText(
                //                           color: kBlueColor, fontSize: 12)
                //                           .copyWith(
                //                           decoration:
                //                           TextDecoration.underline)),
                //                   TextSpan(
                //                       text: ' without reservation.',
                //                       style: regularText(
                //                           color: kTextColor, fontSize: 12))
                //                 ]),
                //           )),
                //     ),
                //   ),
                // ),
                // globalGap(10)
              ],
            ),
          );
        },
      ),
    );
  }
}
