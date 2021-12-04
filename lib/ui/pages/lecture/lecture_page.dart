import 'package:flutter/material.dart';

class LecturePage extends StatelessWidget {
  const LecturePage({
    Key? key,
    required this.lectureTitle,
    required this.fullText,
  }) : super(key: key);

  final String lectureTitle;
  final String fullText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 36, horizontal: 80),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lectureTitle,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Color(0xFF121010),
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              SizedBox(height: 40),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF7F8FA),
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.all(40),
                child: Text(
                  fullText,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        height: 1.4,
                        color: Color(0xFF121010),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
