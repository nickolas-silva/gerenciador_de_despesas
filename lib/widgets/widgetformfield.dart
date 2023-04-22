import 'package:validatorless/validatorless.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gd_app/view/colors.dart';


class WidgetTextFormField extends StatefulWidget {
  WidgetTextFormField(
      {Key? key,
      required this.label,
      this.hint = "",
      this.size = 16,
      this.trickess = 1,
      this.color = Colors.black87,
      this.backgroundColor = Colors.transparent,
      this.weight = FontWeight.w700,
      this.padding = EdgeInsets.zero,
      this.icon = Icons.school,
      this.iconColor = roxoClaro,
      this.keyboardType = TextInputType.text,
      this.onChange,
      this.obscure = false,
      this.validator,
      this.onTap,
      required this.textEditingController,
      this.onSaved,
      this.readOnly = false,
      this.isTextArea = false,
      this.minLines = 5,
      this.maxLines = 5})
      : super(key: key);

  final String label, hint;
  final double size, trickess;
  final Color color, backgroundColor;
  final FontWeight weight;
  final EdgeInsetsGeometry padding;
  final IconData icon;
  final Color iconColor;
  final TextInputType keyboardType;
  final Function(String)? onChange;
  final Function(String?)? onSaved;
  final Function()? onTap;
  final bool obscure;
  final String? Function(String?)? validator;
  final BorderRadius borderRadius = BorderRadius.circular(20);
  final TextEditingController textEditingController;
  final bool readOnly, isTextArea;
  final int minLines, maxLines;

  @override
  _WidgetTextFormFieldState createState() => _WidgetTextFormFieldState();
}

class _WidgetTextFormFieldState extends State<WidgetTextFormField> {
  //OutlineInputBorder o = OutlineInputBorder();
  bool openEye = true;
  @override
  void initState() {
    openEye = !widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        
        readOnly: widget.readOnly,
        controller: widget.textEditingController,
        obscureText: !this.openEye,
        validator: widget.validator,
        keyboardType:
            widget.isTextArea ? TextInputType.multiline : widget.keyboardType,
        minLines: widget.isTextArea ? 5 : 1,
        maxLines: widget.isTextArea ? 10 : 1,
        onChanged: widget.onChange,
        onSaved: widget.onSaved,
        onTap: widget.onTap,
        style: TextStyle(
          color: widget.color,
          fontFamily: 'JetBrains Mono',
          fontWeight: widget.weight,
          fontSize: widget.size,
        ),
        decoration: InputDecoration(
          fillColor: roxoMedio,
          filled: true,
          enabled: true,
          /* ICON */
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Icon(
              widget.icon,
              color: widget.iconColor,
              size: 20,
            ),
          ),
          suffixIcon: widget.obscure
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      this.openEye = !this.openEye;
                    });
                  },
                  icon: this.openEye
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off))
              : null,
          /* LABEL */
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: azul,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          /* HINT */
          hintText: widget.hint,
          hintStyle: const TextStyle(
              color: branco,
              fontFamily: 'Nunito',
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
