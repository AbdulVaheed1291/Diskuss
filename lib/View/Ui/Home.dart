import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../component_widgets/custom_appbar.dart';
import '../component_widgets/custom_bottombar.dart';
import '../component_widgets/custom_categories.dart';
import '../component_widgets/custom_editcard.dart';
import '../component_widgets/custom_gradientcontainer.dart';
import '../component_widgets/custom_newcardsection.dart';
import '../component_widgets/custom_remindercard.dart';
import '../component_widgets/custom_reminderheader.dart';
import '../component_widgets/custom_sharedigitalcard.dart';
import '../component_widgets/custom_floatingdialbutton.dart';
import '../component_widgets/custom_profilecard.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomEditcard(),
        const SizedBox(width: 16),
        CustomSharedigitalcard()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomBottomNavigationBar(selectedIndex: _selectedIndex,onItemTapped: _onItemTapped,),
          FloatingDialButton()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                GradientHeader(),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.00,
                  left: 16,
                  right: 16,
                  child: const ProfileCard(),
                ),
              ],
            ),
            const SizedBox(height: 15),
            _buildActionButtons(),
            NewCardSection(),
            CategoriesSection(),
            RemindersHeader(),
            ReminderCard(),
            ReminderCard()
          ],
        ),
      ),
    );
  }
}
