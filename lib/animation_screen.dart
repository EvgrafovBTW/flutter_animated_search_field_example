import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({
    super.key,
  });

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

const duration = Durations.short4;

class _AnimationScreenState extends State<AnimationScreen> {
  final TextEditingController controller = TextEditingController();
  final FocusNode node = FocusNode();
  @override
  void initState() {
    super.initState();
    node.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    node
      ..removeListener(_onFocusChanged)
      ..dispose();
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                focusNode: node,
                controller: controller,
                onTapOutside: (event) {
                  node.unfocus();
                },
              ),
            ),
            AnimatedContainer(
              duration: duration,
              width: node.hasFocus ? 90 : 0,
              child: AnimatedOpacity(
                duration: duration,
                opacity: node.hasFocus ? 1 : 0,
                child: AnimatedSlide(
                  duration: duration,
                  offset: Offset(node.hasFocus ? 0 : 1, 0),
                  curve: Curves.fastOutSlowIn,
                  child: _CancelButton(() {
                    controller.clear();
                    node.unfocus();
                  }),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton(this.onPressed);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        'Cancel',
        softWrap: false,
        style: TextStyle(
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}
