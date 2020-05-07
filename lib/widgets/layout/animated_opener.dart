import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AnimatedOpener extends StatelessWidget {
  const AnimatedOpener({
    Key key,
    @required this.closed,
    @required this.opened,
  }) : super(key: key);

  final WidgetBuilder closed;
  final WidgetBuilder opened;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Theme.of(context).scaffoldBackgroundColor,
      tappable: false,
      openElevation: 0,
      closedElevation: 0,
      closedShape: ContinuousRectangleBorder(),
      closedBuilder: (
        BuildContext context,
        VoidCallback openContainer,
      ) {
        return Material(
          child: InkWell(
//            splashColor: Theme.of(context).accentColor.withOpacity(.2),
            onTap: () {
              openContainer();
            },
            child: closed(context),
          ),
        );
      },
      openBuilder: (
        BuildContext context,
        VoidCallback closeContainer,
      ) {
        return opened(context);
      },
    );
  }
}
