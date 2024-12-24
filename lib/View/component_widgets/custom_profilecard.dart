import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diskuss/View/component_widgets/text_component.dart';
import 'package:diskuss/ViewModel/CubitandStates/test_cubit.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleCard() {
    setState(() {
      if (_isFlipped) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      _isFlipped = !_isFlipped;
    });
  }

  Widget _buildFrontCard(TestState state, BoxConstraints constraints) {
    if (state is TestLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is TestLoaded) {
      final name = state.data["yourName"].toString();
      final businessName = state.data["businessName"].toString();
      final mobile = state.data["mobile"].toString();
      final email = state.data["email"].toString();
      final image = state.data['image'];
      final designation = state.data['designation'].toString();

      // Using original size specifications
      final isSmallScreen = constraints.maxWidth < 600;
      final cardWidth = constraints.maxWidth * 0.29;  // Original width ratio
      final avatarRadius = 45.0;  // Original avatar size
      final fontSize = 13.0;  // Original font size
      final iconSize = 20.0;  // Original icon size

      return SizedBox(
        width: cardWidth,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.center,
                colors: [Colors.black, Color(0xffFF1976D2)],
                stops: const [0.85, 0.85],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textforcard(
                            text: businessName,
                            color: Colors.white,
                            fontSize: fontSize,
                          ),
                          const SizedBox(height: 8),
                          CircleAvatar(
                            radius: avatarRadius,
                            backgroundImage: NetworkImage(image),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textforcard(
                            text: name,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: fontSize,
                          ),
                          Textforcard(
                            text: designation,
                            color: Colors.white,
                            fontSize: fontSize,
                          ),
                          const SizedBox(height: 25),
                          const Divider(color: Colors.white, thickness: 1),
                          Textforcard(
                            text: "Contact",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize,
                          ),
                          Row(
                            children: [
                              Icon(Icons.phone, color: Colors.white, size: iconSize),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Textforcard(
                                  text: mobile,
                                  color: Colors.white,
                                  fontSize: fontSize,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.email, color: Colors.white, size: iconSize),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Textforcard(
                                  text: email,
                                  color: Colors.white,
                                  fontSize: fontSize,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildSocialIcon("assets/icons8-whatsapp-32.png", iconSize),
                                _buildSocialIcon("assets/icons8-facebook-30.png", iconSize),
                                _buildSocialIcon("assets/icons8-instagram-50.png", iconSize),
                                _buildSocialIcon("assets/icons8-linkedin-50.png", iconSize),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else if (state is TestError) {
      return Center(
        child: Text(
          'Error: ${state.message}',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildSocialIcon(String asset, double size) {
    return Image.asset(
      asset,
      height: size,
      width: size,
      color: Colors.white,
    );
  }

  Widget _buildBackCard(TestState state, BoxConstraints constraints) {
    if (state is TestLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is TestLoaded) {
      final name = state.data["yourName"].toString();
      final businessName = state.data["businessName"].toString();
      final image = state.data['image'];
      final designation = state.data['designation'];
      final services = state.data['services'] as List;

      // Using original size specifications
      final isSmallScreen = constraints.maxWidth < 600;
      final cardWidth = constraints.maxWidth * 0.29;  // Original width ratio
      final avatarRadius = 45.0;  // Original avatar size
      final fontSize = 13.0;  // Original font size

      return SizedBox(
        width: cardWidth,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.center,
                colors: [Colors.black, Colors.blue.shade700],
                stops: const [0.85, 0.85],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textforcard(
                            text: businessName,
                            color: Colors.white,
                            fontSize: fontSize,
                          ),
                          const SizedBox(height: 8),
                          CircleAvatar(
                            radius: avatarRadius,
                            backgroundImage: NetworkImage(image),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Textforcard(
                                  text: name,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: fontSize,
                                ),
                              ),
                              const Icon(
                                Icons.more_vert_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                          Textforcard(
                            text: designation.toString(),
                            color: Colors.white,
                            fontSize: fontSize,
                          ),
                          const SizedBox(height: 20),
                          const TextComponent(
                            text: "Top Products/Services",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 1,
                            height: 20,
                          ),
                          ...services.take(5).map((service) => Textforcard(
                            text: "- $service",
                            fontSize: fontSize - 1,
                            color: Colors.white,
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else if (state is TestError) {
      return Center(
        child: Text(
          'Error: ${state.message}',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }
    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestCubit(context),
      child: BlocConsumer<TestCubit, TestState>(
        listener: (context, state) {
          if (state is TestError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return GestureDetector(
                onTap: _toggleCard,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(pi * _controller.value),
                      child: _controller.value < 0.5
                          ? _buildFrontCard(state, constraints)
                          : Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateY(pi),
                        child: _buildBackCard(state, constraints),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}