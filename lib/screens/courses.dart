

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/course_lesson_videos.dart';
import 'course_single_video.dart';

class CourseListScreen extends StatelessWidget {
  final List<String> categories = [
    "All Topics",
    "Technology",
    "Arts",
    "Engineering",
    "Marketing",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
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
                      image: AssetImage('images/CourseIntro10.jpg'))),
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
                      },
                      child: Text(category),
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
                            color: Colors.blue,
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
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10.0),
                    color: Colors.white,
                    child: SizedBox(
                      width: 170,
                      height: 170,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CourseCard(
                              courseTitle: 'Course $index',
                              authorName: 'Author Name',
                              imageAssetPath: 'images/CourseIntro$index.jpg',
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

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
                            color: Colors.blue,
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
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10.0),
                    color: Colors.white,
                    child: SizedBox(
                      width: 170,
                      height: 170,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CourseCard(
                              courseTitle: 'Course $index',
                              authorName: 'Author Name',
                              imageAssetPath: 'images/CourseIntro$index.jpg',
                            ),
                          ],
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

  CourseCard({
    required this.courseTitle,
    required this.authorName,
    required this.imageAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 16),
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
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            courseTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            authorName,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(
                    courseTitle: courseTitle,
                  ),
                ),
              );
            },
            child: Text('View Course'),
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
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Preview'),
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
                  Text('Learn how to build a secure ecommerce application'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
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

                  SizedBox(height: 30.0),
                  // Lessons Section

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(16.0),
                    ),
                    padding: EdgeInsets.all(20.0),
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
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
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0),
                              // -------------------------------------Lesson Details
                              // ------------------------------------------
                              // -----------------------------------------
                              Container(
                                height: 250, // Adjust the height as needed
                                child: CourseLessonScreen(), //CoursePage(),
                              ),

                      ],
                    ),
                  ),

                  SizedBox(height: 30),

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

                  SizedBox(height: 30),

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

                  SizedBox(height: 30),

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
                          'This course is the followup to Building Modern Web Applications in here. In this course, we go further than we did the first time around. We will build a sample E-Commerce application that consists of multiple, separate applications: ... ',
                          style: TextStyle(fontSize: 15.0, height: 1.5),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Show more ...',
                          style: TextStyle(color: Colors.purple),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  //---------------------------------- Instructor
                  // -------------------------------------
                  // ------------------------------------------
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Instructor Title
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Instructor',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // Instructor Info
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
                                  'I have twenty years of experience in professional software development, and twenty years of experience as a University professor. As an entrepreneur, I have worked with a broad range of clients, including Thomson...',
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
                              Text(
                                'Show more',
                                style: TextStyle(color: Colors.purple),
                              )
                            ],
                          ),
                        ),

                        // View Profile Button
                        Center(
                          child: SizedBox(
                            width: 200.0, // Set the desired width
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.purple,
                              ),
                              child: Text('View Profile'),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        // Student Feedback Title

                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Rating',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              _buildRatingBar('5 Stars', 5), // 95% rating
                              _buildRatingBar('4 Stars', 4), // 80% rating
                              _buildRatingBar('3 Stars', 3), // 60% rating
                              _buildRatingBar('2 Stars', 2), // 40% rating
                              _buildRatingBar('1 Star', 1), // 20% rating
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
