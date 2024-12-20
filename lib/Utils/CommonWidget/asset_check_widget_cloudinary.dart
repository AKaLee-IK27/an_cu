import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<bool> doesImageExist(String publicId) async {
  const cloudName = 'db7lwrzjz';
  final imageUrl = 'https://res.cloudinary.com/$cloudName/image/upload/$publicId';
  try {
    final response = await http.head(Uri.parse(imageUrl));
    return response.statusCode == 200;
  } catch (e) {
    return false;
  }
}

class AssetCheckWidget extends StatelessWidget{
  final String publicId;

  const AssetCheckWidget({super.key, required this.publicId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: doesImageExist(publicId), 
      builder: (context, snapshot) {
        if (snapshot.data == false) {
          return const Image(
              image: AssetImage('assets/images/default_avatar.png'),
              fit: BoxFit.cover,
            );
        } else if (snapshot.hasData) {
          return CldImageWidget(
            publicId: publicId,
            fit: BoxFit.cover,
          );
        } else {
          return const Image(
            image: AssetImage('assets/images/default_avatar.png'),
            fit: BoxFit.cover,
          );
        }
      }
    );
  }
}