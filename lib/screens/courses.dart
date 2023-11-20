import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/course_lesson_videos.dart';
import 'course_cat_detail.dart';
import 'course_single_video.dart';

class CourseListScreen extends StatefulWidget {
  @override
  _CourseListScreenState createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  String selectedCategory = "All Topics";
  final List<String> categories = [
    "All Topics",
    "Technology",
    "Arts",
    "Engineering",
    "Marketing",
    "Business",
    "Guitar",
    "AI",
    "Design",
    "Music"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            //SizedBox(height: 8),
            Container(
              height: 250.0,
              width: 600.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('images/advertising.png'))),
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle category selection
                        setState(() {
                          selectedCategory = category;
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CourseCatDetail(selectedCategory: category),
                          ),
                        );
                      },
                      child: Text(
                        category,
                        style: TextStyle(
                          color: selectedCategory == category
                              ? Colors.white
                              : Colors
                                  .white, // Set text color based on selection
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: selectedCategory == category
                            ? Color(0xFF4d4dbf)
                            : Color(0xFF6b86f7),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Recommendation',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle "See All" button tap
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'See All',
                          style: TextStyle(
                            color: Color(0xFF4d4dbf),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: 180,
                        height: 180,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CourseCard(
                                courseTitle: index == 0
                                    ? 'Python Basics'
                                    : index == 1
                                        ? 'Teaching Strategies'
                                        : index == 2
                                            ? 'Java Fundamentals'
                                            : index == 3
                                                ? 'JavaScript Mastery'
                                                : index == 4
                                                    ? 'Vue.js Essentials'
                                                    : index == 5
                                                        ? 'HTML 5 Fundamentals'
                                                        : index == 6
                                                            ? 'CSS Styling'
                                                            : index == 7
                                                                ? 'PHP Web Development'
                                                                : index == 8
                                                                    ? 'Ruby Programming'
                                                                    : index == 9
                                                                        ? 'React for Beginners'
                                                                        : 'Default Title',
                                authorName: 'Author Name',
                                imageAssetPath: 'images/CourseIntro$index.jpg',
                                description: index == 0
                                    ? 'Versatile and readable programming language'
                                    : index == 1
                                        ? 'Educational professional guiding student learning'
                                        : index == 2
                                            ? 'Object-oriented, platform-independent programming'
                                            : index == 3
                                                ? 'Dynamic scripting for web development'
                                                : index == 4
                                                    ? 'Progressive JavaScript framework for UIs'
                                                    : index == 5
                                                        ? 'Latest standard for web content and structure'
                                                        : index == 6
                                                            ? 'Stylesheet language for web page design'
                                                            : index == 7
                                                                ? 'Server-side scripting for dynamic web pages'
                                                                : index == 8
                                                                    ? 'Dynamic, object-oriented programming language'
                                                                    : index == 9
                                                                        ? 'JavaScript library for building UI components'
                                                                        : 'Default Description', // Default description if index is out of range
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Latest',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle "See All" button tap
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'See All',
                          style: TextStyle(
                            color: Color(0xFF4d4dbf),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: 180,
                        height: 180,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CourseCard(
                                courseTitle: index == 0
                                    ? 'Python Basics'
                                    : index == 1
                                        ? 'Teaching Strategies'
                                        : index == 2
                                            ? 'Java Fundamentals'
                                            : index == 3
                                                ? 'JavaScript Mastery'
                                                : index == 4
                                                    ? 'Vue.js Essentials'
                                                    : index == 5
                                                        ? 'HTML 5 Fundamentals'
                                                        : index == 6
                                                            ? 'CSS Styling'
                                                            : index == 7
                                                                ? 'PHP Web Development'
                                                                : index == 8
                                                                    ? 'Ruby Programming'
                                                                    : index == 9
                                                                        ? 'React for Beginners'
                                                                        : 'Default Title',
                                authorName: 'Author Name',
                                imageAssetPath: 'images/CourseIntro$index.jpg',
                                description: index == 0
                                    ? 'Versatile and readable programming language'
                                    : index == 1
                                        ? 'Educational professional guiding student learning'
                                        : index == 2
                                            ? 'Object-oriented, platform-independent programming'
                                            : index == 3
                                                ? 'Dynamic scripting for web development'
                                                : index == 4
                                                    ? 'Progressive JavaScript framework for UIs'
                                                    : index == 5
                                                        ? 'Latest standard for web content and structure'
                                                        : index == 6
                                                            ? 'Stylesheet language for web page design'
                                                            : index == 7
                                                                ? 'Server-side scripting for dynamic web pages'
                                                                : index == 8
                                                                    ? 'Dynamic, object-oriented programming language'
                                                                    : index == 9
                                                                        ? 'JavaScript library for building UI components'
                                                                        : 'Default Description', // Default description if index is out of range
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

//----------------------------- Card
//------------------------------
class CourseCard extends StatelessWidget {
  final String courseTitle;
  final String authorName;
  final String imageAssetPath;
  final String description;
  final double titleFontSize;
  final TextStyle titleStyle;
  final TextStyle authorStyle;

  CourseCard({
    required this.courseTitle,
    required this.authorName,
    required this.imageAssetPath,
    required this.description,
    this.titleFontSize = 16.0,
    this.titleStyle =
        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    this.authorStyle = const TextStyle(fontSize: 14),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      //margin: EdgeInsets.only(right: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(
                    courseTitle: courseTitle,
                    title: '',
                  ),
                ),
              );
            },
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imageAssetPath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            courseTitle,
            style: TextStyle(
              color: Color(0xFF4d4dbf),
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          Text(
            authorName,
            style: TextStyle(
              color: Color(0xFF6b86f7),
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          ),
          //SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: Container(
              width: 50,
              height: 25,
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseDetailScreen(
                          courseTitle: courseTitle,
                          title: '',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(
                        0xFF4d4dbf),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: BorderSide(
                      color: Color(0xFF4d4dbf),
                    ),
                    padding: EdgeInsets.all(0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ).copyWith(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        // Return the end color of the gradient when the button is pressed
                        return Color(0xFF4d4dbf);
                      }
                      // Return the start color of the gradient for other states
                      return Color(0xFF4d4dbf);
                    }),
                  ),
                  child: Container(
                    width: 60, // Adjust the width as needed
                    height: 30, // Adjust the height as needed
                    alignment: Alignment.center,
                    child: Text(
                      'View',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ----------------------view detials
//---------------------------------------
class CourseDetailScreen extends StatelessWidget {
  final String courseTitle;

  CourseDetailScreen({
    required this.courseTitle,
    required String title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4d4dbf),
        title: Text(
          'Course Preview',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Preview
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                child: SingleScreen(), //VideoPlayerScreen(),
                color: Colors.grey, // Placeholder for video preview
              ),
            ),
            // Title and Info
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Building Web Applications - Intermediate Level',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Learn how to build a secure ecommerce application'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFF3BA27)),
                      Icon(Icons.star, color: Color(0xFFF3BA27)),
                      Icon(Icons.star, color: Color(0xFFF3BA27)),
                      Icon(Icons.star, color: Color(0xFFF3BA27)),
                      Icon(Icons.star_border),
                    ],
                  ),
                  Row(
                    children: [
                      Text('344 ratings, 100 students'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Created by TS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.purple),
                  ),
                  Row(
                    children: [
                      Icon(Icons.warning, color: Colors.black, size: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('Last updated 3/2023'),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12, // Grey background color
                      borderRadius:
                          BorderRadius.circular(10.0), // Set the border radius
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What You\'ll Learn',
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        // List of sentences with "right" icons
                        _buildLearnListItem('How to build a back end API'),
                        _buildLearnListItem('How to build a front end website'),
                        _buildLearnListItem('How to build microservices'),
                      ],
                    ),
                  ),

                  SizedBox(height: 15.0),
                  // Lessons Section

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                    height: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Curriculum',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                '10 Lessons | 100m total length',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        // -------------------------------------Lesson Details
                        // ------------------------------------------
                        // -----------------------------------------
                        Container(
                          height: 380,
                          color: Colors.white,
                          child: CourseLessonScreen(), //CoursePage(),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),

//---------------------------------- This course includes
                  // -------------------------------------

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12, // Grey background color
                      borderRadius:
                          BorderRadius.circular(16.0), // Set the border radius
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'This course includes',
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Icon(Icons.video_library_rounded,
                                color: Colors.black, size: 17),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('100 minutes on-demand video'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.quiz_outlined,
                                color: Colors.black, size: 17),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('1 Quiz'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.file_open,
                                color: Colors.black, size: 17),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('25 Support files'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.mobile_friendly,
                                color: Colors.black, size: 17),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('Access on mobile and desktop'),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.price_change,
                                color: Colors.black, size: 17),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('Certificate of completion'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),

                  //---------------------------------- Requirements
                  // -------------------------------------
                  // ------------------------------------------

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Grey background color
                      borderRadius:
                          BorderRadius.circular(16.0), // Set the border radius
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Requirements',
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Icon(Icons.arrow_right,
                                color: Colors.black, size: 17),
                            Expanded(
                              // Wrap the text in an Expanded widget
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'A basic understanding of the programming language',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.arrow_right,
                                color: Colors.black, size: 17),
                            Expanded(
                              // Wrap the text in an Expanded widget
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'A basic understanding of HTML, CSS and JavaScript',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.arrow_right,
                                color: Colors.black, size: 17),
                            Expanded(
                              // Wrap the text in an Expanded widget
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child:
                                    Text('A basic understanding of SQL Syntax'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),

                  //---------------------------------- Description
                  // -------------------------------------
                  // ------------------------------------------
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black12, // Grey background color
                      borderRadius:
                          BorderRadius.circular(16.0), // Set the border radius
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'This course is the followup to Building Modern Web Applications in here. In this course, we go further than we did the first time around. We will build a sample E-Commerce application that consists of multiple, separate applications. ',
                          style: TextStyle(fontSize: 15.0, height: 1.5),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Grey background color
                      borderRadius:
                          BorderRadius.circular(16.0), // Set the border radius
                    ),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Instructor',
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple),
                              ),
                              Text('Ph.D.'),
                              SizedBox(height: 8.0),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage:
                                        AssetImage('images/CourseIntro1.jpg'),
                                  ),
                                  SizedBox(width: 16.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Instructor Rating: 4.7'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Reviews: 863'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Students: 2,345'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Courses: 12'),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              Container(
                                width: 330, // Adjust the width as needed
                                child: Text(
                                  'I have twenty years of experience in professional software development, and twenty years of experience as a University professor. As an entrepreneur, I have worked with a broad range of clients, including Thomson.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    height:
                                        1.5, // This sets the line height (line spacing)
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //---------------------------------- Instructor
                  // -------------------------------------
                  // ------------------------------------------
                  // Container(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       // Instructor Title
                  //       Padding(
                  //         padding: EdgeInsets.all(16.0),
                  //         child: Text(
                  //           'Instructor',
                  //           style: TextStyle(
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //
                  //       // Instructor Info
                  //       Padding(
                  //         padding: EdgeInsets.all(16.0),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               'John Doe',
                  //               style: TextStyle(
                  //                   fontSize: 18,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Colors.purple),
                  //             ),
                  //             Text('Ph.D.'),
                  //             SizedBox(height: 8.0),
                  //             Row(
                  //               children: [
                  //                 CircleAvatar(
                  //                   radius: 50.0,
                  //                   backgroundImage:
                  //                       AssetImage('images/CourseIntro1.jpg'),
                  //                 ),
                  //                 SizedBox(width: 16.0),
                  //                 Column(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.start,
                  //                   children: [
                  //                     Text('Instructor Rating: 4.7'),
                  //                     SizedBox(
                  //                       height: 5,
                  //                     ),
                  //                     Text('Reviews: 863'),
                  //                     SizedBox(
                  //                       height: 5,
                  //                     ),
                  //                     Text('Students: 2,345'),
                  //                     SizedBox(
                  //                       height: 5,
                  //                     ),
                  //                     Text('Courses: 12'),
                  //                   ],
                  //                 ),
                  //               ],
                  //             ),
                  //             SizedBox(height: 16.0),
                  //             Container(
                  //               width: 330, // Adjust the width as needed
                  //               child: Text(
                  //                 'I have twenty years of experience in professional software development, and twenty years of experience as a University professor. As an entrepreneur, I have worked with a broad range of clients, including Thomson.',
                  //                 textAlign: TextAlign.justify,
                  //                 style: TextStyle(
                  //                   height:
                  //                       1.5, // This sets the line height (line spacing)
                  //                 ),
                  //               ),
                  //             ),
                  //             SizedBox(
                  //               height: 5,
                  //             ),
                  //
                  //           ],
                  //         ),
                  //       ),
                  //
                  //
                  //
                  //
                  //       SizedBox(
                  //         height: 30,
                  //       ),
                  //       // Student Feedback Title
                  //
                  //       Padding(
                  //         padding: EdgeInsets.all(16.0),
                  //         child: Text(
                  //           'Rating',
                  //           style: TextStyle(
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       ),
                  //
                  //       Padding(
                  //         padding: EdgeInsets.all(16.0),
                  //         child: Column(
                  //           children: [
                  //             _buildRatingBar('5 Stars', 5), // 95% rating
                  //             _buildRatingBar('4 Stars', 4), // 80% rating
                  //             _buildRatingBar('3 Stars', 3), // 60% rating
                  //             _buildRatingBar('2 Stars', 2), // 40% rating
                  //             _buildRatingBar('1 Star', 1), // 20% rating
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearnListItem(String text) {
    return Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
          size: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(text),
        ),
      ],
    );
  }

  Widget _buildRatingBar(String label, double rating) {
    final int filledStars = rating.floor();
    final bool hasHalfStar = (rating - filledStars) >= 0.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8.0),
        Row(
          children: [
            // Filled stars
            for (int i = 0; i < filledStars; i++)
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),

            // Half star if necessary
            if (hasHalfStar)
              Icon(
                Icons.star_half,
                color: Colors.yellow,
                size: 20,
              ),

            // Empty stars to complete 5 stars
            for (int i = 0; i < (5 - filledStars - (hasHalfStar ? 1 : 0)); i++)
              Icon(
                Icons.star_border,
                color: Colors.black,
                size: 20,
              ),

            SizedBox(width: 16.0),
            Text('$rating / 5.0'), // Display rating out of 5
          ],
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
