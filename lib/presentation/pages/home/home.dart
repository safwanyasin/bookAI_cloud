import 'package:auto_route/auto_route.dart';
import 'package:book_ai/constants.dart';
import 'package:book_ai/presentation/classes/book.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CarouselController _carouselController;

  final List<Book> books = [
    // Book(
    //   imageUrl:
    //       'http://books.google.com/books/content?id=B7QkEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
    //   name: 'Book 1',
    //   author: 'Author 1',
    //   onPressed: () {
    //     print('Book 1 pressed!');
    //   },
    // ),
    // Book(
    //   imageUrl:
    //       'http://books.google.com/books/content?id=8MXK_KrHOZYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
    //   name: 'Book 2',
    //   author: 'Author 2',
    //   onPressed: () {
    //     print('Book 2 pressed!');
    //   },
    // ),
  ];

  String currentBackgroundImageUrl = '';

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
    if (books.isNotEmpty) {
      currentBackgroundImageUrl = books.first.imageUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('Menu icon pressed!');
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(currentBackgroundImageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Heading',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Subheading',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              BookCarousel(
                books: books,
                carouselController: _carouselController,
                onIndexChanged: (index, reason) {
                  if (books.isNotEmpty && index < books.length) {
                    setState(() {
                      currentBackgroundImageUrl = books[index].imageUrl;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookCarousel extends StatelessWidget {
  final List<Book> books;
  final CarouselController carouselController;
  final Function(int, CarouselPageChangedReason)? onIndexChanged;

  BookCarousel({
    required this.books,
    required this.carouselController,
    this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        height: 200.0,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        initialPage: 0,
        onPageChanged: onIndexChanged,
      ),
      items: books.map((book) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: book.onPressed,
              child: Container(
                  // ... (same as before)
                  ),
            );
          },
        );
      }).toList(),
    );
  }
}
