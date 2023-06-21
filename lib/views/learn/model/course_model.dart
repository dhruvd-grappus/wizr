class CourseModel {
  CourseModel({
    required this.id,
    required this.courseLevel,
    required this.courseProviderImage,
    required this.courseTitle,
    required this.startsAt,
    required this.totalCosts,
    required this.ratings,
  });

  final String id;
  final String courseLevel;
  final String courseProviderImage;
  final String courseTitle;
  final String startsAt;
  final int totalCosts;
  final double ratings;

  static List<CourseModel> allCourseList = [
    CourseModel(
      id: '0',
      courseLevel: 'Intermediate',
      courseProviderImage: 'assets/images/test_course_brand.png',
      courseTitle:
          'Masters Program in ETABS & Safe Software for RCC Composite...',
      startsAt: '₹3500/m',
      totalCosts: 35700,
      ratings: 4,
    ),
    CourseModel(
      id: '1',
      courseLevel: 'Intermediate',
      courseProviderImage: 'assets/images/test_course_brand.png',
      courseTitle:
          'Masters Program in ETABS & Safe Software for RCC Composite...',
      startsAt: '₹3500/m',
      totalCosts: 35700,
      ratings: 4,
    ),
    CourseModel(
      id: '2',
      courseLevel: 'Intermediate',
      courseProviderImage: 'assets/images/test_course_brand.png',
      courseTitle:
          'Masters Program in ETABS & Safe Software for RCC Composite...',
      startsAt: '₹3500/m',
      totalCosts: 35700,
      ratings: 4,
    ),
    CourseModel(
      id: '3',
      courseLevel: 'Intermediate',
      courseProviderImage: 'assets/images/test_course_brand.png',
      courseTitle:
          'Masters Program in ETABS & Safe Software for RCC Composite...',
      startsAt: '₹3500/m',
      totalCosts: 35700,
      ratings: 4,
    ),
    CourseModel(
      id: '4',
      courseLevel: 'Intermediate',
      courseProviderImage: 'assets/images/test_course_brand.png',
      courseTitle:
          'Masters Program in ETABS & Safe Software for RCC Composite...',
      startsAt: '₹3500/m',
      totalCosts: 35700,
      ratings: 4,
    ),
    CourseModel(
      id: '5',
      courseLevel: 'Intermediate',
      courseProviderImage: 'assets/images/test_course_brand.png',
      courseTitle:
          'Masters Program in ETABS & Safe Software for RCC Composite...',
      startsAt: '₹3500/m',
      totalCosts: 35700,
      ratings: 4,
    ),
    CourseModel(
      id: '6',
      courseLevel: 'Intermediate',
      courseProviderImage: 'assets/images/test_course_brand.png',
      courseTitle:
          'Masters Program in ETABS & Safe Software for RCC Composite...',
      startsAt: '₹3500/m',
      totalCosts: 35700,
      ratings: 4,
    ),
    CourseModel(
      id: '7',
      courseLevel: 'Intermediate',
      courseProviderImage: 'assets/images/test_course_brand.png',
      courseTitle:
          'Masters Program in ETABS & Safe Software for RCC Composite...',
      startsAt: '₹3500/m',
      totalCosts: 35700,
      ratings: 4,
    ),
    CourseModel(
      id: '8',
      courseLevel: 'Intermediate',
      courseProviderImage: 'assets/images/test_course_brand.png',
      courseTitle:
          'Masters Program in ETABS & Safe Software for RCC Composite...',
      startsAt: '₹3500/m',
      totalCosts: 35700,
      ratings: 4,
    ),
  ];
}
