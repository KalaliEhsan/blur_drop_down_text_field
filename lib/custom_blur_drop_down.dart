import 'dart:ui';

import 'package:flutter/material.dart';

class CustomBlurDropDown extends StatefulWidget {
  const CustomBlurDropDown({super.key});

  @override
  State<StatefulWidget> createState() => CustomBlurDropDownState();
}

class CustomBlurDropDownState extends State<CustomBlurDropDown> {
  final controller = TextEditingController();
  final layerLink = LayerLink();
  final focusNode = FocusNode();
  OverlayEntry? entry;
  Map<String, String> itemSelected = <String, String>{};

  final list = [
    {
      "name": "David",
      "job": "Flutter Team",
      "imgUrl":
          "https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?w=2000",
    },
    {
      "name": "James",
      "job": "Web Team",
      "imgUrl":
          "https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp",
    },
    {
      "name": "Mike",
      "job": "Design Team",
      "imgUrl":
          "https://img.freepik.com/free-photo/half-profile-image-handsome-young-caucasian-man-with-good-skin-brown-eyes-black-stylish-hair-stubble-posing-isolated-against-blank-wall-looking-front-him-smiling_343059-4560.jpg?w=2000",
    },
  ];

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   showOverlay();
    // });

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showOverlay();
      } else {
        hideOverlay();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    entry?.dispose();

    super.dispose();
  }

  void showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    // final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    entry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2.0,
                sigmaY: 2.0,
              ),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: GestureDetector(onTapDown: (details) {
                  hideOverlay();
                  focusNode.unfocus();
                }),
              ),
            ),
          ),
          Positioned(
            // left: offset.dx,
            // top: offset.dy + size.height,
            width: size.width,
            child: CompositedTransformFollower(
              link: layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height + 8),
              // When set this parameter, so don't need to set left and top params for Positioned widget
              child: buildOverlay(),
            ),
          )
        ],
      ),
    );

    overlay?.insert(entry!);
  }

  Widget buildOverlay() {
    return Material(
      borderRadius: BorderRadius.circular(12),
      shadowColor: Colors.black,
      elevation: 8,
      child: Column(
        children: List.generate(
          list.length,
          (index) => ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(list[index]['imgUrl']!),
            ),
            title: Text(
              list[index]['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              list[index]['job']!,
              style: const TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 10,
              ),
            ),
            onTap: () {
              controller.text = list[index]['name'] ?? '';
              setState(() {
                itemSelected = list[index];
              });
              hideOverlay();
              focusNode.unfocus();
            },
          ),
        ),
      ),
    );
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        readOnly: true,
        showCursor: false,
        decoration: InputDecoration(
          label: const Text('name'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
