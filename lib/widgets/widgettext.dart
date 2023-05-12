import 'package:flutter/material.dart';

class WidgetText extends StatefulWidget{
  WidgetText(
    {Key? key,
      required this.text,
      this.size = 12,
      this.color = Colors.black,
      this.weight = FontWeight.normal,
      this.padding = EdgeInsets.zero,
      this.align = TextAlign.left,
      this.maxLines = 15,
      this.height = 1,
      this.onTap})
      : super(key: key);
  
  String text;
  double size;
  Color color;
  FontWeight weight;
  EdgeInsetsGeometry padding;
  TextAlign align;
  int? maxLines;
  double? height;
  Function () ? onTap;
  void setText(String text){
    this.text = text;
  }

  @override
  State<WidgetText> createState() => _WidgetTextState();
}

class _WidgetTextState extends State<WidgetText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          child: Text(
            widget.text,
            maxLines: widget.maxLines,
            overflow: TextOverflow.fade,
            textAlign: widget.align,
            style: TextStyle(
                fontSize: widget.size,
                color: widget.color,
                fontWeight: widget.weight,
                fontFamily: 'Poppins',
                height: widget.height,
                wordSpacing: 0,
                letterSpacing: 0),
          ),
        ),
      ),
    );
  }
}