import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../ViewModel/CubitandStates/test_cubit.dart';
import 'custom_circleavathar.dart';
import 'text_component.dart';

class ReminderCard extends StatelessWidget {
  const ReminderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (context) => TestCubit(context),
        child: BlocBuilder<TestCubit, TestState>(
          builder: (context, state) {
            if (state is TestLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TestLoaded) {
              final name = state.data["yourName"].toString();
              final date = "21 Dec 2024";
              final time = "12:16 pm";

              return Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatarComponent(
                            avatarColor: Colors.blue,
                            radius: 25,
                            icon: Icons.people,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextComponent(
                                text: name,
                                fontWeight: FontWeight.bold,
                              ),
                              TextComponent(
                                text: date,
                                color: Colors.black38,
                              ),
                            ],
                          ),
                        ],
                      ),
                      TextComponent(
                        text: time,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
