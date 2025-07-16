import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class BaseInput extends StatefulWidget {
  final String? label;
  final String? value;
  final String? hint;
  final bool? obscureText;
  final Widget? prefixIcon;
  final void Function()? onClick;
  final bool? autofocus;
  final int maxLines;
  final TextInputType? keyboardType;
  const BaseInput({super.key, this.label, this.keyboardType, this.maxLines = 1, this.value, this.hint, this.obscureText, this.prefixIcon, this.onClick, this.autofocus});

  @override
  State<BaseInput> createState() => _BaseInputState();
}

class _BaseInputState extends State<BaseInput> {
  late TextEditingController _controller;

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    setState(() {
      _obscureText = widget.obscureText == true ? true : false;
    });

    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant BaseInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _controller.text = widget.value ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null ? Text(widget.label!, style: theme.textTheme.titleMedium,) : SizedBox(),
        SizedBox(height: 4,),
        TextField(
          maxLines: widget.maxLines,
          controller: _controller,
          obscureText: widget.obscureText == true ? _obscureText : false,
          cursorColor: Colors.blue,
          onTap: widget.onClick,
          autofocus: widget.autofocus ?? false,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.obscureText == true ? IconButton(
              icon: HugeIcon(icon: !_obscureText ? HugeIcons.strokeRoundedView : HugeIcons.strokeRoundedViewOffSlash, color: Colors.black,),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ) : null,
          ),
        ),
      ],
    );
  }
}
