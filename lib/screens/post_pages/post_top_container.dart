import 'package:flutter/material.dart';
import 'package:sosyal_duvar_demo/utils/constants.dart';

class PostPageTopContainer extends StatelessWidget {
  const PostPageTopContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 2.5,
      child: Column(
        children: [
          ProfileContainerWidget(size: size),
          const SizedBox(height: smallPadding),
          CustomTextFiledWidget(size: size)
        ],
      ),
    );
  }
}

class CustomTextFiledWidget extends StatelessWidget {
  const CustomTextFiledWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: kPrimaryColor,
      child: Column(
        children: [
          SizedBox(
            height: (size.height / 4) / 1.2,
            child: const TextField(
              expands: true,
              maxLines: null,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText:
                      'Paylaşmak istediğiniz konu hakkında bir şeyler yaz'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(smallPadding),
                margin: const EdgeInsets.only(bottom: smallPadding),
                width: size.width / 2.2,
                height: ((size.height / 4) / 1.2) / 4.0,
                child: const Text(
                  'Fotoğraf / Video Ekle',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2,
                    )),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: SizedBox(
                  width: size.width / 3.5,
                  child: ElevatedButton(
                    child: const Text('Paylaş',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileContainerWidget extends StatelessWidget {
  const ProfileContainerWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (size.height / 4) / 2.5,
      color: kPrimaryColor,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCyrbpoFgqkoe2iOgr5KCf8jrt5nqLz2rZkZEgj-c7Is-j39FLqo4mYZcdODvfT4XimlE&usqp=CAU'),
        ),
        title: const Text(
          'Faruk Topal',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        subtitle: Row(
          children: [
            Row(
              children: const [
                Icon(Icons.folder, color: kSecondColor),
                Text('Gönderi 25'),
              ],
            ),
            const SizedBox(width: mediumPadding),
            Row(
              children: const [
                Icon(Icons.message, color: kSecondColor),
                Text('Yorum 10'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
