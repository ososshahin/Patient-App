

import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:photo_manager/photo_manager.dart';

class GalleryService {
  /// Requests permissions and fetches the last two images from the gallery
  Future<List<AssetEntity>> fetchLastTwoImages() async {
    // Request gallery access permissions
    final PermissionState permission = await PhotoManager.requestPermissionExtend();
    if (permission.isAuth) {
      // Fetch all albums
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        filterOption: FilterOptionGroup(
          orders: [
            const OrderOption(

              type: OrderOptionType.createDate, // Order by creation date
              asc: false, // Descending (newest first)
            ),
          ],
        ),
      );

      // Fetch recent images from the first album (e.g., "Recents")
      if (albums.isNotEmpty) {
        return await albums[0].getAssetListRange(start: 0, end: 2); // Last two images
      }
    } else {
      throw Exception('Permission denied.');
    }

    return [];
  }

  /// Converts an AssetEntity to a thumbnail widget
  Future<Image?> getThumbnail(AssetEntity entity, {int width = 50, int height = 50}) async {
    final data = await entity.thumbnailDataWithSize(ThumbnailSize(width, height));
    if (data != null) {
      return Image.memory(data, fit: BoxFit.cover);
    }
    return null;
  }
}
