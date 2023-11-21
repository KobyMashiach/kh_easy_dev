import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';
import 'package:kh_easy_dev/widgets/navigate_page.dart';

class KheasydevDevelopersScreen extends StatelessWidget {
  const KheasydevDevelopersScreen(
      {super.key, required this.logoPath, this.listOfPages});
  final List<Map<String, dynamic>>? listOfPages;
  final String logoPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kheasydevAppBar(title: "Developer Zone", logoPath: logoPath),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: listOfPages == null ? 0 : listOfPages!.length,
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemBuilder: (context, index) {
            return Card(
              child: GestureDetector(
                onTap: () => listOfPages![index]['function'](),
                child: ListTile(
                    // leading: SvgPicture.asset(
                    //   iconToHere,
                    //   height: 25,
                    //   width: 25,
                    // ),
                    leading: const Icon(Icons.developer_mode),
                    title: Text(listOfPages![index]['title'].toString())),
              ),
            );
          },
        ),
      ),
    );
  }
}
