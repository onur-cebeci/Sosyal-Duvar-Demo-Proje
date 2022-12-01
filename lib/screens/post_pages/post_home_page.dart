import 'package:flutter/material.dart';
import 'package:sosyal_duvar_demo/datas/post_api.dart';
import 'package:sosyal_duvar_demo/models/post_models.dart';
import 'package:sosyal_duvar_demo/screens/post_pages/custom_post_card_widget_page.dart';
import 'package:sosyal_duvar_demo/screens/post_pages/post_top_container.dart';
import 'package:sosyal_duvar_demo/utils/constants.dart';

class PostHomePage extends StatefulWidget {
  const PostHomePage({Key? key}) : super(key: key);
  @override
  State<PostHomePage> createState() => _PostHomePageState();
}

class _PostHomePageState extends State<PostHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: kSecondColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text('Sosyal Duvar'),
        ),
        body: SizedBox(
          height: size.height,
          child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: smallPadding),
                child: Column(
                  children: [
                    const SizedBox(height: smallPadding),
                    const PostPageTopContainer(),
                    SizedBox(
                      child: FutureBuilder(
                        future: PostApi().readPostJsonData(),
                        builder: (context, data) {
                          if (data.hasData) {
                            var postList = data.data as List<PostModel>;

                            return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 29,
                                itemBuilder: (context, index) {
                                  var listIndex = postList[index];

                                  return CustomPostCardWidget(
                                      listIndex: listIndex);
                                });
                          } else if (data.hasError) {
                            return Center(
                              child: Text(data.error.toString() +
                                  '  Somethink Going Wrong '),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
