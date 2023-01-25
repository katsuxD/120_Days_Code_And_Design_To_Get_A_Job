import 'package:flutter/material.dart';
import 'package:khanhdang_cv_flutter_ui/Widgets/Cursor/constants.dart';
import 'package:provider/provider.dart';

class AnimatedCursorState {
  final BoxDecoration? decoration;
  final Offset offset1;
  final Offset offset2;
  final Size size1;
  final Size size2;
  AnimatedCursorState({
    this.decoration,
    this.offset1 = Offset.zero,
    this.offset2 = Offset.zero,
    this.size1 = circleSize1,
    this.size2 = circleSize2,
  });

  static const Size circleSize1 = Size(30, 30);
  static const Size circleSize2 = Size(5, 5);
}

class AnimatedCursorProvider extends ChangeNotifier {
  AnimatedCursorProvider();

  AnimatedCursorState state = AnimatedCursorState();

  void changeCursor({required GlobalKey key, BoxDecoration? decoration}) {
    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox == null) return;

    state = AnimatedCursorState(
      size1: Size(60, 60),
      offset1: state.offset1,
      decoration: CursorConstants.boxDecorationHovered,
    );
    notifyListeners();
  }

  void restCursor() {
    state = AnimatedCursorState();
    notifyListeners();
  }

  void updateCursorPosition(Offset position) {
    state = AnimatedCursorState(offset1: position, offset2: position);
    notifyListeners();
  }
}

class AnimatedCursorWrapper extends StatelessWidget {
  final Widget child;
  const AnimatedCursorWrapper({Key? key, required this.child})
      : super(key: key);
  void onCursorUpdate(PointerEvent event, BuildContext context) {
    context.read<AnimatedCursorProvider>().updateCursorPosition(event.position);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => AnimatedCursorProvider()),
      child: Consumer<AnimatedCursorProvider>(
        child: child,
        builder: (context, value, child) {
          final state = value.state;
          return Stack(
            children: [
              if (child != null) child,
              Positioned.fill(
                child: MouseRegion(
                  opaque: false,
                  onHover: (event) => onCursorUpdate(event, context),
                ),
              ),
              Visibility(
                visible: state.offset1 != Offset.zero,
                child: AnimatedPositioned(
                  left: state.offset1.dx - state.size1.width / 2,
                  top: state.offset1.dy - state.size1.height / 2,
                  width: state.size1.width,
                  height: state.size1.height,
                  duration: Duration(milliseconds: 100),
                  child: IgnorePointer(
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOutExpo,
                        width: state.size1.width,
                        height: state.size1.height,
                        decoration: state.decoration ??
                            CursorConstants.boxDecorationOne),
                  ),
                ),
              ),
              Visibility(
                visible: state.offset2 != Offset.zero,
                child: AnimatedPositioned(
                  left: state.offset2.dx - state.size2.width / 2,
                  top: state.offset2.dy - state.size2.height / 2,
                  width: state.size2.width,
                  height: state.size2.height,
                  duration: const Duration(milliseconds: 50),
                  child: IgnorePointer(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutExpo,
                      width: state.size2.width,
                      height: state.size2.height,
                      decoration: CursorConstants.boxDecorationTwo,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class AnimatedCircleCursorMouseRegion extends StatefulWidget {
  final Widget? child;
  final BoxDecoration? decoration;
  const AnimatedCircleCursorMouseRegion({
    Key? key,
    this.child,
    this.decoration,
  }) : super(key: key);

  @override
  State<AnimatedCircleCursorMouseRegion> createState() =>
      _AnimatedCircleCursorMouseRegionState();
}

class _AnimatedCircleCursorMouseRegionState
    extends State<AnimatedCircleCursorMouseRegion> {
  final GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final cursor = context.read<AnimatedCursorProvider>();
    return MouseRegion(
      key: _key,
      cursor: SystemMouseCursors.click,
      opaque: false,
      onHover: (event) => cursor.changeCursor(
        key: _key,
        decoration: CursorConstants.boxDecorationHovered,
      ),
      onExit: (event) {},
      child: widget.child,
    );
  }
}
