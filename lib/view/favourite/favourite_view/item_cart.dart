import 'package:cached_network_image/cached_network_image.dart';
import 'package:eccommerce4/controller/favorite/myfavourites_controller.dart';
import 'package:eccommerce4/core/shared/styles.dart';
import 'package:eccommerce4/data/model/myfavourites_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/backlinks.dart';

class ItemCard extends GetView<MyFavouritesCOntrollerImp> {
  const ItemCard({super.key, required this.myfavouritesModel});
  final MyfavouritesModel myfavouritesModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              SizedBox(
                child: Hero(
                  tag: "${myfavouritesModel.itemsId!}",
                  child: CachedNetworkImage(
                    imageUrl:
                        "$itemsImageNameLink/${myfavouritesModel.itemsImage}",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(myfavouritesModel.itemsName!,
                  style: Styles.textStyle20.copyWith(color: Colors.black)),
              Text(
                myfavouritesModel.itemsDes!,
                style: Styles.textStyle14,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const Spacer(),
              Row(
                children: [
                  Text("\$ ${myfavouritesModel.itemsPrice}",
                      style: Styles.textStyle20.copyWith(color: Colors.red)),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        controller
                            .deleteMyfavourite(myfavouritesModel.favouritesId);
                      },
                      icon: const Icon(
                        Icons.delete_rounded,
                        color: Colors.red,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
