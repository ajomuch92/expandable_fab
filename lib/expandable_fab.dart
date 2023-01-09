library expandable_fab;

import 'package:flutter/material.dart';

class ExpandableFab extends StatefulWidget {
  /// Widget to wrap it. It's recommended to use a Scafold here.
  final Widget child;

  /// Widget to show into the expanded modal.
  final Widget innerChild;

  /// Icon to use into the initial floating button.
  final Icon icon;

  /// Color for the close icon. By default, it's white.
  final Color closeIconColor;

  /// Color to use as background for floating action button.
  final Color? buttonBackgroundColor;

  /// Color to use as background of the expanded modal.
  final Color backgroundColor;

  /// Duration for the animation.
  final Duration duration;

  const ExpandableFab(
      {Key? key,
      required this.child,
      required this.innerChild,
      required this.icon,
      this.closeIconColor = Colors.white,
      this.buttonBackgroundColor,
      this.backgroundColor = const Color.fromRGBO(0, 0, 0, 0.5),
      this.duration = const Duration(milliseconds: 250)})
      : super(key: key);

  @override
  ExpandableFabState createState() => ExpandableFabState();
}

class ExpandableFabState extends State<ExpandableFab> {
  /// Boolean value to indicate when modal it's expanded
  bool expanded = false;

  /// Boolean value to indicate when to show the inner child. It's true until finish the animation
  bool visible = false;

  /// Value to set the initial button width and height
  double size = 56.0;

  @override
  Widget build(BuildContext context) {
    /// Variable to get the window's size
    Size windowSize = MediaQuery.of(context).size;

    return Material(
      child: SafeArea(
        child: SizedBox(
          width: windowSize.width,
          height: windowSize.height,
          child: Stack(
            children: [
              widget.child,
              AnimatedPositioned(
                duration: widget.duration,
                bottom: expanded ? 0 : 16,
                right: expanded ? 0 : 16,
                child: InkWell(
                  onTap: expanded
                      ? null
                      : () {
                          setState(() {
                            visible = false;
                            expanded = true;
                          });
                        },
                  child: AnimatedContainer(
                    onEnd: () {
                      setState(() {
                        visible = true;
                      });
                    },
                    duration: widget.duration,
                    width: expanded ? windowSize.width : size,
                    height: expanded ? windowSize.height : size,
                    padding: expanded
                        ? const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 30.0)
                        : EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: expanded
                          ? widget.backgroundColor
                          : (widget.buttonBackgroundColor ??
                              Theme.of(context).primaryColor),
                      borderRadius:
                          BorderRadius.circular(expanded ? 0 : (size / 2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(0.0, 1.0),
                          blurRadius: expanded ? 0 : 6.0,
                        ),
                      ],
                    ),
                    child: expanded
                        ? Visibility(
                            visible: visible,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            expanded = false;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: widget.closeIconColor,
                                        ))
                                  ],
                                ),
                                widget.innerChild,
                              ],
                            ),
                          )
                        : Center(
                            child: widget.icon,
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void close() {
    setState(() {
      visible = false;
      expanded = false;
    });
  }
}
