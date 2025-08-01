import 'package:flutter/material.dart';
import '../../../../../core/style/app_style.dart';
import '../../../data/models/review_model.dart';
import 'custom_rating.dart';

class CustomCustomer extends StatelessWidget {
  const CustomCustomer({
    super.key,
    required this.review,
  });
  final ReviewModel review;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                review.image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.name,
                    style: AppStyles.textStyle16Bold,
                  ),
                  Text(
                    review.date,
                    style: AppStyles.textStyle16Regular.copyWith(
                      color: Colors.black.withValues(alpha: .5),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomRating(size: 12 , rating: review.rating,),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          review.review,
          style: AppStyles.textStyle14Regular,
        ),
      ],
    );
  }
}
