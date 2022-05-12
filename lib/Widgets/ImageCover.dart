import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthy_ceylon/Const/const.dart';

class CoverImage extends StatelessWidget {
  String? title;
  String? image;
  double? heightScale;
  bool? backButton;

  CoverImage({
    required this.title,
    required this.image,
    this.heightScale = 1,
    this.backButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width/heightScale!,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image!),
          fit: BoxFit.cover,
        ),
      ),
      child: backButton!
          ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed:()=> Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: kMainColor,
                  ),
              ),
              Expanded(child: CoverImageText(text: title!)),
              const SizedBox(height: 50),
            ],
          )
          : CoverImageText(text: title!),
    );
  }
}

class CoverImageText extends StatelessWidget {
  final String text;
  CoverImageText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 55,
        ),
      ),
    );
  }
}
