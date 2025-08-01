class ReviewModel {
  final String image;
  final String name;
  final String date;
  final String review;
  final int rating;

  const ReviewModel({
    required this.image,
    required this.name,
    required this.date,
    required this.review,
    required this.rating,
  });

  static List<ReviewModel> reviews = [
    ReviewModel(
      image: 'assets/images/person1.jpg', // Assuming you have user images in assets
      name: 'Ahmed Al-Farsi',
      date: '2023-10-26',
      review: 'This burger is absolutely delicious! The meat is juicy and the sauce is perfect.',
      rating:5,
    ),
    ReviewModel(
      image: 'assets/images/person2.jpg',
      name: 'Fatima Zahra',
      date: '2023-10-25',
      review: 'I loved the Quattro Cheese Grilled! So cheesy and satisfying. Highly recommend.',
      rating: 1,
    ),
    ReviewModel(
      image: 'assets/images/person3.jpg',
      name: 'Khalid Abdullah',
      date: '2023-10-24',
      review: 'The Steakhouse XI is a must-try. Great flavor and very filling. Will order again.',
      rating: 2,
    ),
  ];}
