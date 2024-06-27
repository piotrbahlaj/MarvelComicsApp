import 'package:flutter/material.dart';

class ExpandableTile extends StatefulWidget {
  const ExpandableTile({
    Key? key,
    required this.title,
    required this.creators,
    required this.description,
  }) : super(key: key);

  final String title;
  final String creators;
  final String description;

  @override
  ExpandableTileState createState() => ExpandableTileState();
}

class ExpandableTileState extends State<ExpandableTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;
  bool _isAnimationComplete = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        setState(() {
          _isAnimationComplete = true;
        });
      } else {
        setState(() {
          _isAnimationComplete = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double minHeight = MediaQuery.of(context).size.height * 0.2;
    final double maxHeight = MediaQuery.of(context).size.height * 0.6;

    return GestureDetector(
      onTap: _toggleExpanded,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: _isExpanded ? maxHeight : minHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    widget.creators,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                if (_isAnimationComplete && _isExpanded)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.description,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: _isExpanded ? Colors.white : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: 80,
                  height: 7,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
