import 'package:flutter/material.dart';

class InkWellCard extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final BorderRadius _baseBorderRadius = BorderRadius.circular(30);
  InkWellCard({@required this.onTap, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: _baseBorderRadius),
      child: InkWell(
        borderRadius: _baseBorderRadius,
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: _baseBorderRadius,
                color: Colors.transparent,
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
