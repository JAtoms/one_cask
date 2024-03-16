import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midlr/dependency/navigation/global_router_exports.dart';
import 'package:midlr/ui/auth/auth_cubit.dart';
import 'package:midlr/ui/global_components/global_button.dart';
import 'package:midlr/ui/global_components/phone_login.dart';
import 'package:midlr/utils/colors.dart';
import 'package:midlr/utils/extensions/global_extensions.dart';
import 'package:midlr/utils/global_padding.dart';
import 'package:midlr/utils/helpers.dart';
import 'package:midlr/utils/size_config.dart';
import 'package:midlr/utils/text_styles.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final phoneController = TextEditingController();
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
            body: GlobalPadding(
              child: Stack(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        globalGap(10),
                        Text('Sign in', style: extraBoldText(fontSize: 30)),
                        globalGap(2),
                        Text('Enter your mobile number to continue',
                            style: regularText()),
                        globalGap(15),
                        PhoneLogin(
                            phoneController: phoneController,
                            countryCode: state.countryCode,
                            phoneNumberCallback: (value) => context
                                .read<AuthCubit>()
                                .userBioData(
                                    phoneNumber: value.phoneNumber)),
                        globalGap(30),
                        GlobalButton(
                            btnText: 'Continue',
                            onTap: () {
                              if (_formKey.validate) {
                                context.read<AuthCubit>().authenticate();
                              }
                            })
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.heightAdjusted),
                      child: GestureDetector(
                        // onTap: () =>
                        //     globalNavigateTo(route: Routes.termsAndConditions),
                        child: Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: 'By continuing you agree to the ',
                                  style: regularText(
                                      color: kTextColor, fontSize: 12),
                                  children: [
                                    TextSpan(
                                        text: 'Privacy Terms & Conditions',
                                        style: regularText(
                                                color: kBlueColor, fontSize: 12)
                                            .copyWith(
                                                decoration:
                                                    TextDecoration.underline)),
                                    TextSpan(
                                        text: ' without reservation.',
                                        style: regularText(
                                            color: kTextColor, fontSize: 12))
                                  ]),
                            )),
                      ),
                    ),
                  ),
                  // globalGap(10)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
