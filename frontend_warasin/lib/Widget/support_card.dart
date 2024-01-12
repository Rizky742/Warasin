import 'package:flutter/material.dart';
import 'package:warasin/models/support_card_model.dart';
import 'package:warasin/theme.dart';

class SupportCard extends StatelessWidget {
  final SupportCardModel supportCardModel;
  final VoidCallback onPressed;
  SupportCard({
    required this.supportCardModel,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Opacity(
        opacity: supportCardModel.isActive ? 1.0 : 0.5,
        child: Container(
          margin: EdgeInsets.only(
            right: 25,
          ),
          decoration: BoxDecoration(
            color: successColor,
            borderRadius: BorderRadius.circular(21),
          ),
          width: 300,
          height: 503,
          child: Column(
            children: [
              Image.asset(
                supportCardModel.imagePath,
                fit: BoxFit.cover,
                height: 339,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      supportCardModel.title,
                      style: secondaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      supportCardModel.description,
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
