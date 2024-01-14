import 'dart:math' as math;
import 'package:flutter/material.dart';

class ExpandableFAB extends StatefulWidget {
  const ExpandableFAB({
    super.key,
    required this.children,
    required this.distance,
  });

  final List<MenuButton> children;
  final double distance;

  @override
  State<ExpandableFAB> createState() => _expandableFABState();
}

class _expandableFABState extends State<ExpandableFAB>
with SingleTickerProviderStateMixin {
  bool isOpen = false;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: isOpen ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  void _toggle() {
    setState(() {
      isOpen = !isOpen;
      if (isOpen) {
      _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  _close() {
    setState(() {
      isOpen = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          ...widget.children.map((button) =>
          QuickActionButton(
            button,
            distance: widget.distance,
            isopen: isOpen,
            index: widget.children.indexOf(button),
            close: _close),
          ),
          _buildOnOpenTap(),
          _buildOnCloseTap(),
          //..._expandMenuButtons(),
        ],
    )
    );
  }

  Widget _buildOnCloseTap() {
    return IgnorePointer(
      ignoring: !isOpen,
      child: AnimatedOpacity(
        opacity: isOpen ? 1 : 0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.fastOutSlowIn,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0, 14.0, 5.0),
          child: Material(
            shape: const CircleBorder(),
            child: IconButton(
              alignment: Alignment.bottomRight,
              color: Colors.white,
              icon: const Icon(Icons.close),
              onPressed: _toggle,
          ),
                ),
        ),
    )
    );
  }

  Widget _buildOnOpenTap() {
    final theme = Theme.of(context);
    return AnimatedOpacity(
      opacity: isOpen ? 0 : 1,
      duration: const Duration(milliseconds: 150),
      child: GestureDetector(
        //onDoubleTap: () => ,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 5.0),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: _toggle,
            child: Container(
              width: 60,
              height: 60,
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 33, 121, 243),
                     Color.fromARGB(255, 82, 151, 255),
                  ],
                  ),
                ),
              child: Icon(Icons.add, size: 25.0, color: theme.iconTheme.color),
            ),
          ),
        ),
      ),
    );
  }

  // List<Widget> _expandMenuButtons() {
  //    final buttons = <Widget>[];
  //    final count = widget.children.length;
  //    final step = widget.distance / (count);
  //    for (var i = 0, distance = step + 10;
  //           i < count;
  //           distance += step, i++) {
  //       buttons.add(AnimatedButton(
  //         progress: _controller,
  //         distance: distance,
  //         child: widget.children[i],
  //       ));
  //   }
  //    return buttons;
  // }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.onPressed,
    required this.icon,
    });

  final VoidCallback onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      elevation: 4,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: const Color.fromARGB(255, 130, 130, 130),
      child: IconButton(
        iconSize: 23.0,
        padding: EdgeInsets.zero,
        color: theme.iconTheme.color,
        onPressed: () {
          onPressed;
        },
        icon: icon,
      )
    );
  }
}


class QuickActionButton extends StatefulWidget {
  final MenuButton action;
  final bool isopen;
  final Function() close;
  final int index;
  final double distance;

  const QuickActionButton(
    this.action, {
    super.key,
    required this.distance,
    required this.isopen,
    required this.index,
    required this.close,
  });

  @override
  State<QuickActionButton> createState() => _QuickActionButtonState();
}

class _QuickActionButtonState extends State<QuickActionButton> {
  final offset = 10.0;

  Duration duration = const Duration(milliseconds: 250);

  var _isPressed = false;

  double get distance => widget.distance * (widget.index + 1) + offset;

  _pressDown() {
    setState(() {
      _isPressed = true;
      widget.close();
      widget.action.onPressed();
    });
  }

  _pressUp() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: widget.isopen ? distance : 0,
      curve: Curves.easeInOut,
      duration: duration,
      child: Padding(
        padding: const EdgeInsets.all(16.0).
        copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
        child: AnimatedOpacity(
          opacity: widget.isopen ? 1 : 0,
          duration: duration,
          child: AnimatedScale(
            scale: _isPressed ? 0.95 : 1,
            duration: duration,
            child: GestureDetector(
              onTapDown: (_) => _pressDown(),
              child: widget.action,
            ),
          ),
        ),
      ),
    );
  }
}

// class AnimatedButton extends StatelessWidget {
//   const AnimatedButton({
//     super.key,
//     required this.progress,
//     required this.distance,
//     required this.child,
//   });

//   final AnimationController progress;
//   final double distance;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: progress,
//       builder: (context, child) {
//         final offset = Offset.fromDirection(
//           90 * (math.pi / 180),
//           distance * progress.value
//         );
//         return Positioned(
//           bottom: 4.0 + offset.dy,
//           right: 4.0 + offset.dx,
//           child: child!,
//         );
//       },
//       child: FadeTransition(
//         opacity: progress,
//         child: child,
//         ),
//       );
//   }
// }
