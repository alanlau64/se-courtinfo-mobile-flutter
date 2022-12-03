import 'package:flutter/material.dart';

class DocumentsListView extends StatelessWidget {
  const DocumentsListView({
    Key? key,
    required this.documentsList,
  }) : super(key: key);

  final List<String> documentsList;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double widthPadding = queryData.size.width * 0.05;
    double heightPadding = queryData.size.height * 0.02;

    return documentsList.length != 0
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: documentsList.length,
            itemBuilder: (context, index) {
              return LimitedBox(
                maxHeight: 100 + heightPadding,
                child: Container(
                  padding: EdgeInsets.only(
                    top: heightPadding / 2,
                    bottom: heightPadding / 2,
                    left: widthPadding,
                    right: widthPadding,
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('lib/assets/File.png')
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: widthPadding,
                          top: 4.0,
                          bottom: 4.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              documentsList[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "6/22/2022  16:10",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.article,
                                  color: Colors.grey,
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Uh oh, you don't have any document!",
                style: TextStyle(
                  color:
                      Color.fromARGB(255, 18, 55, 121), //TODO: change to theme
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Start scanning files to get started",
                style: TextStyle(
                  color: Colors.grey, //TODO: change to theme
                  fontSize: 14,
                ),
              )
            ],
          );
  }
}
