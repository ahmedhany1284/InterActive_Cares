import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interactive_care/core/utils/app_router.dart';
import 'package:interactive_care/core/widgets/custom_toast.dart';
import 'package:interactive_care/core/widgets/default_button.dart';
import 'package:interactive_care/core/widgets/default_form_field.dart';


import 'package:interactive_care/features/login/presentation/view_model/cubit/cubit.dart';
import 'package:interactive_care/features/login/presentation/view_model/cubit/states.dart';


import '../../../../core/widgets/dafault_text _button.dart';
class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            String msg =
                state.error.substring(state.error.indexOf("]") + 1).trim();
            print(state.error);
            showToast(
              massage: msg,
              state: ToastStates.ERROR,
            );
          }
          if(state is LoginSuccessState){
            showToast(
              massage: 'Logged in Successfully',
              state: ToastStates.SUCCESS,
            );
            context.go(AppRouter.kDashboard);
          }
        },

        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email Adress';
                            }
                            return null;
                          },
                          label: 'Email Adress',
                          icon: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          isPassword: LoginCubit.get(context).isPassword,
                          controller: passwordController,
                          suffix: LoginCubit.get(context).suffix,
                          onSubmit: (value) {
                            if (formkey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          suffixPressed: () {
                            LoginCubit.get(context).change_pass_visibility();
                          },
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Password is too short';
                            }
                            return null;
                          },
                          label: 'password',
                          icon: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                            condition: state is LoginLoadingState,
                            builder: (context) =>
                                Center(child: CircularProgressIndicator()),
                            fallback: (context) {
                              return defaultButton(
                                function: () async {
                                  if (formkey.currentState!.validate()) {
                                    LoginCubit.get(context).checkIfUserSignedIn(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: 'Login',
                              );
                            }),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                            ),
                            defaultTextButton(
                              function: () {
                                context.push(AppRouter.kRegister);
                              },
                              text: 'Register',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
