import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_1/utils/colors/app_colors.dart';

class GlobalTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Widget? prefixIcon;
  final String caption;
  final ValueChanged? onChanged;
  final FocusNode? focusNode;
  final bool readOnly;
  final TextInputFormatter? maskFormatter;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final EdgeInsets? contentPadding;
  final int? maxLines;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final Color? fillColor;
  final Color? borderColor;

  const GlobalTextField({
    super.key,
    required this.hintText,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon,
    this.maxLength,
    this.maxLines = 1,
    this.caption = "",
    this.suffixIcon,
    this.readOnly = false,
    this.controller,
    this.onChanged,
    this.focusNode,
    this.maskFormatter,
    this.obscureText,
    this.contentPadding,
    this.fillColor = AppColors.c_50,
    this.borderColor = Colors.transparent,
  });

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  late TextEditingController _internalController;
  final internalFocusNode = FocusNode();
  Color color = const Color(0xFFFAFAFA);

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController();
    widget.focusNode?.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: widget.onChanged,
      // obscuringCharacter: '●',
      readOnly: widget.readOnly,
      controller: _internalController,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      textCapitalization: widget.textCapitalization,
      focusNode: widget.focusNode ?? internalFocusNode,
      inputFormatters: widget.maskFormatter != null ? [widget.maskFormatter!] : [],
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        counterText: '',
        labelStyle: const TextStyle(
          fontFamily: "Urbanist",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.c_900,
          height: 20 / 14,
        ),
        hintStyle: const TextStyle(
          fontFamily: "Urbanist",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.c_500,
          height: 20 / 14,
        ),
        contentPadding: widget.contentPadding,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor!),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor!),
          borderRadius: BorderRadius.circular(16),
        ),
        fillColor: (widget.focusNode?.hasFocus ?? internalFocusNode.hasFocus)
                ? AppColors.blueTransparent
                : widget.fillColor,
        filled: true,
      ),
      // style: TextStyle(color: AppColors.dark3, fontSize: 16.sp),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
    );
  }
}
