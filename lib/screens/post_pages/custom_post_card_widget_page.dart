import 'package:flutter/material.dart';
import 'package:sosyal_duvar_demo/models/post_models.dart';
import 'package:sosyal_duvar_demo/utils/constants.dart';

class CustomPostCardWidget extends StatelessWidget {
  const CustomPostCardWidget({Key? key, required this.listIndex})
      : super(key: key);
  final PostModel listIndex;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(smallPadding),
        margin: const EdgeInsets.only(bottom: smallPadding),
        height: size.height / 1.15,
        color: kPrimaryColor,
        child: Column(
          children: [
            PostTopSide(listIndex: listIndex),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width / 1.1,
                  child: Text(
                    listIndex.description.toString(),
                    maxLines: 2,
                    softWrap: true,
                    style: const TextStyle(overflow: TextOverflow.clip),
                  ),
                )
              ],
            ),
            const SizedBox(height: mediumPadding),
            MainImageWidget(listIndex: listIndex),
            const SizedBox(height: mediumPadding),
            SocialCommunicationWidget(listIndex: listIndex),
            const SizedBox(height: largePadding),
            CommentPartWidget(listIndex: listIndex),
            const SizedBox(height: smallPadding),
            const MoreCommentWidget(),
            const SizedBox(height: largePadding),
            CommentFormFiledWidget(listIndex: listIndex),
          ],
        ));
  }
}

class PostTopSide extends StatelessWidget {
  const PostTopSide({Key? key, required this.listIndex}) : super(key: key);
  final PostModel listIndex;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: listIndex.media != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                '${listIndex.media}',
              ),
            )
          : const Icon(Icons.person),
      title: Text(
        listIndex.authorName.toString(),
      ),
      subtitle: Text(listIndex.createdAt.toString()),
    );
  }
}

class MainImageWidget extends StatelessWidget {
  const MainImageWidget({Key? key, required this.listIndex}) : super(key: key);
  final PostModel listIndex;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: (size.height / 1.5) / 2.5,
      width: size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  listIndex.comments![0].authorProfileImage.toString()),
              fit: BoxFit.cover)),
    );
  }
}

class SocialCommunicationWidget extends StatelessWidget {
  const SocialCommunicationWidget({Key? key, required this.listIndex})
      : super(key: key);
  final PostModel listIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Icon(
                  Icons.favorite,
                  color: kSecondColor,
                ),
                Text(listIndex.likeCount.toString()),
              ],
            ),
            const Spacer(flex: 1),
            Column(
              children: [
                const Icon(
                  Icons.arrow_downward,
                  color: kSecondColor,
                ),
                Text(listIndex.disLikeCount.toString()),
              ],
            ),
            const Spacer(flex: 1),
            Column(
              children: [
                const Icon(
                  Icons.comment_bank_outlined,
                  color: kSecondColor,
                ),
                Text(listIndex.comments![0].id.toString()),
              ],
            ),
            const Spacer(
              flex: 10,
            ),
          ],
        ),
      ],
    );
  }
}

class CommentPartWidget extends StatelessWidget {
  const CommentPartWidget({Key? key, required this.listIndex})
      : super(key: key);
  final PostModel listIndex;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Image.network(
              listIndex.comments![0].authorProfileImage.toString()),
        ),
        trailing: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.delete,
            color: Colors.orange,
          ),
        ),
        title: Text(
          listIndex.comments![0].authorName.toString(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          children: [
            Text(
              listIndex.comments![0].description.toString(),
              maxLines: 2,
              style: const TextStyle(fontSize: 14),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: kSecondColor,
                    ),
                    Text(listIndex.likeCount.toString()),
                  ],
                ),
                const SizedBox(width: mediumPadding),
                Column(
                  children: [
                    const Icon(
                      Icons.arrow_downward,
                      color: kSecondColor,
                    ),
                    Text(listIndex.disLikeCount.toString()),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}

class CommentFormFiledWidget extends StatelessWidget {
  const CommentFormFiledWidget({Key? key, required this.listIndex})
      : super(key: key);
  final PostModel listIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kSecondColor, width: 2)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: SizedBox(
                height: 50,
                width: 60,
                child: Image.network(listIndex.media.toString())),
          ),
          const SizedBox(width: smallPadding),
          SizedBox(
            width: size.width - 100,
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Konu hakkında bir şeyler yaz..',
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MoreCommentWidget extends StatelessWidget {
  const MoreCommentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: const Text(
            'diğer yorumları gör...',
            style: TextStyle(fontSize: 14),
          ),
        )
      ],
    );
  }
}
