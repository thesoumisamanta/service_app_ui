import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF124A9A), Color(0xFF3865E0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset('assets/icons/home.svg'),
                ),
                0,
              ),
              _navItem(
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset('assets/icons/note.svg'),
                ),
                1,
              ),
              _navItem(
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset('assets/icons/create.svg'),
                ),
                2,
              ),
              _navItem(
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset('assets/icons/search_2.svg'),
                ),
                3,
              ),
              _navItem(
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset('assets/icons/user.svg'),
                ),
                4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(Widget icon, int index) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          if (index == 2) {
            Navigator.pushNamed(context, '/create-job');
          }
        },
        child: SizedBox(width: 40, height: 40, child: icon),
      ),
    );
  }
}
