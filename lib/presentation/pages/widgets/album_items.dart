import 'package:flutter/material.dart';
import 'package:top_albums/domain/entities/top_albums_entity.dart';

class AlbumItems extends StatelessWidget {
  final AlbumEntity albumEntity;

  const AlbumItems({Key? key, required this.albumEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 1,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(flex: 5, child: Image.network(albumEntity.imgUrl ?? "", fit: BoxFit.fill,)),
            Flexible(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(albumEntity.title ?? ""),
            )),
          ],
        ),
      ),
    );
  }
}
