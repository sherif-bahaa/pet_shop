import 'package:flutter/material.dart';
import 'package:pet_shop/widgets/helper.dart';



class Book {
  final String title;
  final String author;
  final String image;
  final String description;

  Book({
    required this.title,
    required this.author,
    required this.image,
    required this.description,
  });
}


class CustomTextFieldSection extends StatefulWidget {
  final String label;
  final String placeholderText;
  final IconData icon;
  final String? Function(String?) validateFunction;
  final String type;

  const CustomTextFieldSection({
    super.key,
    required this.label,
    required this.placeholderText,
    required this.icon,
    required this.validateFunction,
    required this.type,
  });

  @override
  State<CustomTextFieldSection> createState() => _CustomTextFieldSectionState();
}

class _CustomTextFieldSectionState extends State<CustomTextFieldSection> {
  bool show = false;

  @override
  void initState() {
    super.initState();
    show = false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: Helper.getResponsiveHeight(context, height: 24)),
        Text(widget.label, style: theme.textTheme.bodyMedium),
        SizedBox(height: Helper.getResponsiveHeight(context, height: 16)),
        TextFormField(
          obscureText: widget.type == "Password" && show == false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.onTertiary,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            suffixIcon: widget.type == "Password"
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    icon: Icon(
                      show ? Icons.remove_red_eye : Icons.hls_off_outlined,
                      size: Helper.getResponsiveHeight(context, height: 24),
                    ),
                  )
                : null,
            prefixIcon: Icon(
              widget.icon,
              size: Helper.getResponsiveHeight(context, height: 24),
            ),
            hintText: widget.placeholderText,
            hintStyle: TextStyle(color: Color(0xffA8A8B3),fontSize: 16,fontFamily: 'Karla'),
            iconColor: theme.colorScheme.primary,
          ),
          validator: widget.validateFunction,
        ),
      ],
    );
  }
}
