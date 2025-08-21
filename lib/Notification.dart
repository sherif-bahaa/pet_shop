import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String title;
  final int count;

  const TabItem({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new,
                          size: 18, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Notification",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
            const SizedBox(height: 27),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Container(
                height: 37,
                width: 230,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey.shade100,
                ),
                child: const TabBar(
                  indicator: BoxDecoration(
                    color: Color(0xff7140FD),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Color(0xffa2a2a2),
                  tabs: [
                    TabItem(title: 'Activity', count: 0),
                    TabItem(title: 'Seller Mode', count: 0),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text("Activity")),
                  Center(child: Text("Seller Mode")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}