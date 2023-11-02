class Category {
  final String name;
  final String imageUrl;
  final List<SubCategory> ?subCategories;

  Category({
    required this.name,
    required this.imageUrl,
      this.subCategories,
  });


}

class SubCategory {
  final String name;
  final int price;
  final String imageUrl;

  SubCategory({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}
