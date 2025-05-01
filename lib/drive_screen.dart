import 'package:flutter/material.dart';

class DriveScreen extends StatefulWidget {
  const DriveScreen({super.key});

  @override
  State<DriveScreen> createState() => _DriveScreenState();
}

class _DriveScreenState extends State<DriveScreen> {
  final List<ListItem> list1 = [
    ListItem(title: 'Услуги', imagePath: 'assets/images/image1.png'),
    ListItem(
      title: 'Двигатель и запчасти',
      imagePath: 'assets/images/image2.png',
    ),
    ListItem(title: 'Трансмиссия', imagePath: 'assets/images/image3.png'),
    ListItem(
      title: 'Детали, ходовой части',
      imagePath: 'assets/images/image4.png',
    ),
    ListItem(
      title: 'Система охлаждения',
      imagePath: 'assets/images/image5.png',
    ),
    ListItem(title: 'Рулевая часть', imagePath: 'assets/images/image6.png'),
  ];

  final List<ListItem> list2 = [
    ListItem(title: 'Электроника', imagePath: 'assets/images/image8.png'),
    ListItem(title: 'Оптика', imagePath: 'assets/images/image9.png'),
    ListItem(
      title: 'Кузовные элементы',
      imagePath: 'assets/images/image10.png',
    ),
    ListItem(title: 'Салон и интерьер', imagePath: 'assets/images/image11.png'),
    ListItem(
      title: 'Масла и автохимия',
      imagePath: 'assets/images/image12.png',
    ),
    ListItem(title: 'Шины и диски', imagePath: 'assets/images/image13.png'),
  ];

  int? selectedIndex;

  void onItemTap(int index, ListItem item) {
    setState(() {
      selectedIndex = index;
    });

    // Бул жерден башка бетке өтө аласың
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailScreen(title: item.title)),
    );
  }

  void onViewAllTap() {
    setState(() {
      selectedIndex = 9999;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AllCategoriesScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final maxLength = list1.length > list2.length ? list1.length : list2.length;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: List.generate(maxLength, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            if (index < list1.length)
                              GestureDetector(
                                onTap: () => onItemTap(index, list1[index]),
                                child: CustomButtonWidget(
                                  image: list1[index].imagePath!,
                                  text: list1[index].title,
                                  isSelected: selectedIndex == index,
                                ),
                              ),
                            const SizedBox(height: 20),
                            if (index < list2.length)
                              GestureDetector(
                                onTap:
                                    () => onItemTap(index + 1000, list2[index]),
                                child: CustomButtonWidget(
                                  image: list2[index].imagePath!,
                                  text: list2[index].title,
                                  isSelected: selectedIndex == index + 1000,
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: onViewAllTap,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.center,
                      height: 175,
                      width: 150,
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == 9999 ? Colors.white : Colors.grey,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Посмотреть все',
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  selectedIndex == 9999
                                      ? Colors.black
                                      : Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'категории',
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      selectedIndex == 9999
                                          ? Colors.black
                                          : Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.arrow_right_alt_rounded,
                                color:
                                    selectedIndex == 9999
                                        ? Colors.black
                                        : Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 170,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            'https://30.img.avito.st/image/1/1.YoYY8baxBBOs4sndq6xSkjOSzm2uUMhr.dJCmMGDWcT-WLpBZt6ROL8nVV0L-pChGW7n3bKaG0lA',
                            width: 140,
                            height: 140,
                          ),
                        ),
                        const Text(
                          'Механик',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.image,
    this.isSelected = false,
  });

  final String text;
  final String image;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 150,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(image, height: 80, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}

class ListItem {
  final String title;
  final String? imagePath;

  ListItem({required this.title, this.imagePath});
}

class DetailScreen extends StatelessWidget {
  final String title;

  const DetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Контент: $title')),
    );
  }
}

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Бардык категориялар')),
      body: const Center(child: Text('Бул жерде бардык категориялар болот')),
    );
  }
}
