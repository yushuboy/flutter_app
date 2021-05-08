import 'package:flutter/material.dart';
import 'package:selpic/widget/button/custom_listView_spacing.dart';

///
/// @Author： yuShu
/// @Time： 2021/4/26 10:11
/// @description：自定义CustomRadioButton
///
class CustomRadioButton<T> extends StatefulWidget {
  const CustomRadioButton({
    required this.buttonLables,
    required this.buttonValues,
    this.buttonTextStyle = const ButtonTextStyle(),
    required this.radioButtonValue,
    required this.unSelectedColor,
    this.itemPadding = const EdgeInsets.all(0),
    this.itemMargin = const EdgeInsets.all(0),
    required this.selectedColor,
    this.height = 35,
    this.width,
    this.enableButtonWrap = false,
    this.horizontal = false,
    required this.defaultSelected,
    this.selectedShape,
    this.unSelectedShape,
    this.enableRowAverage = false,
    this.wrapAlignment = WrapAlignment.start,
  }) : assert(buttonLables.length == buttonValues.length,
            'Button values list and button lables list should have same number of eliments ');

  // assert(buttonLables.toSet().length == buttonLables.length,
  //     "Multiple buttons label wth same value cannot exist"),

  ///Orientation of the Button Group
  final bool horizontal;

  ///Values of button
  final List<T> buttonValues;

  ///Default value is 35
  final double height;

  ///button padding
  final EdgeInsetsGeometry itemPadding;

  ///Spacing between buttons
  final EdgeInsetsGeometry itemMargin;

  ///Default selected value
  final T defaultSelected;

  ///Use this if you want to keep width of all the buttons same
  final double? width;

  final List<String> buttonLables;

  ///Styling class for label
  final ButtonTextStyle buttonTextStyle;

  final void Function(T) radioButtonValue;

  ///Unselected Color of the button
  final Color unSelectedColor;

  ///Selected Color of button
  final Color selectedColor;

  /// A custom Shape can be applied
  final ShapeBorder? selectedShape;

  /// A custom Shape can be applied
  final ShapeBorder? unSelectedShape;

  ///alignment for button when [enableButtonWrap] is true
  final WrapAlignment wrapAlignment;

  /// This will enable button wrap (will work only if orientation is vertical)
  final bool enableButtonWrap;

  ///Average score on a row
  final bool enableRowAverage;

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String? _currentSelectedLabel;

  ShapeBorder? selectBorder(int index) =>
      (_currentSelectedLabel == widget.buttonLables[index] ? widget.selectedShape : widget.unSelectedShape);

  @override
  void initState() {
    super.initState();
    if (widget.defaultSelected != null) {
      if (widget.buttonValues.contains(widget.defaultSelected)) {
        final index = widget.buttonValues.indexOf(widget.defaultSelected);
        _currentSelectedLabel = widget.buttonLables[index];
      } else {
        throw Exception('Default Value not found in button value list');
      }
    }
  }

  List<Widget> _buildButtonsColumn() {
    return widget.buttonValues.map((dynamic e) {
      final index = widget.buttonValues.indexOf(e);
      return Container(
        margin: widget.itemMargin,
        height: widget.height,
        width: widget.width,
        child: MaterialButton(
          minWidth: 0,
          elevation: 0,
          padding: widget.itemPadding,
          color: _currentSelectedLabel == widget.buttonLables[index] ? widget.selectedColor : widget.unSelectedColor,
          shape: selectBorder(index),
          onPressed: () {
            widget.radioButtonValue(e);
            setState(() {
              _currentSelectedLabel = widget.buttonLables[index];
            });
          },
          child: Center(
            child: Text(
              widget.buttonLables[index],
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: widget.buttonTextStyle.textStyle.copyWith(
                color: _currentSelectedLabel == widget.buttonLables[index]
                    ? widget.buttonTextStyle.selectedColor
                    : widget.buttonTextStyle.unSelectedColor,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildButtonsRow() {
    return widget.buttonValues.map<Widget>((dynamic e) {
      final index = widget.buttonValues.indexOf(e);
      return Container(
        margin: widget.itemMargin,
        height: widget.height,
        width: widget.width,
        constraints: const BoxConstraints(maxWidth: 200),
        child: MaterialButton(
          minWidth: 0,
          elevation: 0,
          color: _currentSelectedLabel == widget.buttonLables[index] ? widget.selectedColor : widget.unSelectedColor,
          padding: widget.itemPadding,
          shape: selectBorder(index),
          onPressed: () {
            widget.radioButtonValue(e);
            setState(() {
              _currentSelectedLabel = widget.buttonLables[index];
            });
          },
          child: Text(
            widget.buttonLables[index],
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: widget.buttonTextStyle.textStyle.copyWith(
              color: _currentSelectedLabel == widget.buttonLables[index]
                  ? widget.buttonTextStyle.selectedColor
                  : widget.buttonTextStyle.unSelectedColor,
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return _buildRadioButtons();
  }

  Widget _buildRadioButtons() {
    if (widget.enableRowAverage) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildButtonsRowSpaceEvenly(_buildButtonsRow()),
        ),
      );
    }
    if (widget.enableButtonWrap) {
      return Container(
        child: Wrap(
          spacing: widget.itemMargin.horizontal,
          direction: Axis.horizontal,
          alignment: widget.wrapAlignment,
          children: _buildButtonsRow(),
        ),
      );
    }
    if (widget.horizontal) {
      return Container(
        height: widget.height,
        child: Center(
          child: CustomListViewSpacing(
            spacing: widget.itemMargin.horizontal,
            scrollDirection: Axis.horizontal,
            children: _buildButtonsRow(),
          ),
        ),
      );
    }
    if (!widget.horizontal && !widget.enableButtonWrap) {
      return Container(
        height: (widget.height + widget.itemMargin.vertical * 2) * (widget.buttonLables.length),
        child: Center(
          child: CustomListViewSpacing(
            spacing: widget.itemMargin.vertical,
            scrollDirection: Axis.vertical,
            children: _buildButtonsColumn(),
          ),
        ),
      );
    } else {
      return Container(
        child: Center(
          child: Wrap(
            spacing: widget.itemMargin.horizontal,
            direction: Axis.horizontal,
            alignment: widget.wrapAlignment,
            children: _buildButtonsRow(),
          ),
        ),
      );
    }
  }

  //Average score on a line
  List<Widget> _buildButtonsRowSpaceEvenly(List<Widget> list) {
    return list.map((e) {
      return Expanded(flex: 1, child: e);
    }).toList();
  }
}
