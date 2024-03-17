import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/ui/auth/auth_cubit.dart';
import 'package:one_cask/ui/global_components/global_button.dart';
import 'package:one_cask/ui/global_components/global_form_field.dart';
import 'package:one_cask/utils/colors.dart';
import 'package:one_cask/utils/dimensions.dart';
import 'package:one_cask/utils/enumerations.dart';
import 'package:one_cask/utils/global_extensions.dart';
import 'package:one_cask/utils/helpers.dart';
import 'package:one_cask/utils/text_styles.dart';

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
            backgroundColor: kPrimaryColor,
            body: Stack(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      globalGap(12),
                      const BackButton(color: kWhite),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: spacingPadding4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            globalGap(5),
                            Text('Sign in',
                                style: boldText(
                                    fontSize: 30,
                                    color: kWhite,
                                    fontType: ebGaramond)),
                            globalGap(10),
                            GlobalFormField(
                              textController: emailController,
                              titleText: 'Email',
                              hintText: 'Enter email address  ',
                              keyBoardType: TextInputType.emailAddress,
                              onChanged: (email) => context
                                  .read<AuthCubit>()
                                  .savePersonalInfo(email: email),
                            ),
                            globalGap(8),
                            GlobalFormField(
                              textController: passwordController,
                              titleText: 'Password',
                              hintText: 'Enter password',
                              keyBoardType: TextInputType.visiblePassword,
                              onChanged: (password) => context
                                  .read<AuthCubit>()
                                  .savePersonalInfo(password: password),
                            ),
                            globalGap(20),
                            GlobalButton(
                                btnText: 'Login',
                                onTap: () {
                                  if (_formKey.validate) {
                                    context.read<AuthCubit>().login();
                                  }
                                }),
                            globalGap(6),
                            Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: 'Can’t sign in?          ',
                                    style: regularText(
                                        color: kWhite, fontSize: 16),
                                    children: [
                                      TextSpan(
                                          text: 'Recover password',
                                          style: regularText(
                                              color: kSecondaryColor,
                                              fontSize: 16,
                                              fontType: ebGaramond)),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
