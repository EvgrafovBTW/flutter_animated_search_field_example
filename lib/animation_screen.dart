import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({
    super.key,
  });

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

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
            Flexible(
              child: TextFormField(
                focusNode: node,
                controller: controller,
                onTapOutside: (event) {
                  node.unfocus();
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: const _CancelButton(),
            ),
          ],
        ),
      ],
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text('Отменить'),
    );
  }
}
