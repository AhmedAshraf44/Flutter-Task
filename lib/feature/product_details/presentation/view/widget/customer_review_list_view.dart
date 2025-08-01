import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/my_divider.dart';
import '../../../data/models/review_model.dart';
import 'custom_customer.dart';


class CustomerReviewListView extends StatelessWidget {
  const CustomerReviewListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   final reviews = ReviewModel.reviews;

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      itemBuilder: (context, index) =>
          CustomCustomer(review:reviews[index]),
      separatorBuilder: (context, index) => MyDivider(),
    );
  }
}
