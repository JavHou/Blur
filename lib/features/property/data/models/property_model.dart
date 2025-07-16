class PropertyModel {
  final String id;
  final String title;
  final String description;
  final bool isForSale;
  final bool isForRent;
  final double? salePrice;
  final double? rentPrice;
  final String address;
  final double latitude;
  final double longitude;
  final int bedrooms;
  final int bathrooms;
  final double area; // in square meters
  final List<String> features; // e.g., pool, garden, garage, etc.
  final List<String> images; // image URLs
  final String coverImage; // cover image URL
  final DateTime listedDate;

  PropertyModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isForSale,
    required this.isForRent,
    this.salePrice,
    this.rentPrice,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.features,
    required this.images,
    required this.coverImage,
    required this.listedDate,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        isForSale: json["isForSale"],
        isForRent: json["isForRent"],
        salePrice: json["salePrice"] != null ? (json["salePrice"] as num).toDouble() : null,
        rentPrice: json["rentPrice"] != null ? (json["rentPrice"] as num).toDouble() : null,
        address: json["address"],
        latitude: (json["latitude"] as num).toDouble(),
        longitude: (json["longitude"] as num).toDouble(),
        bedrooms: json["bedrooms"],
        bathrooms: json["bathrooms"],
        area: (json["area"] as num).toDouble(),
        features: List<String>.from(json["features"] ?? []),
        images: List<String>.from(json["images"] ?? []),
        coverImage: json["coverImage"],
        listedDate: DateTime.parse(json["listedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "isForSale": isForSale,
        "isForRent": isForRent,
        "salePrice": salePrice,
        "rentPrice": rentPrice,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "bedrooms": bedrooms,
        "bathrooms": bathrooms,
        "area": area,
        "features": features,
        "images": images,
        "coverImage": coverImage,
        "listedDate": listedDate.toIso8601String(),
      };
}

List<PropertyModel> properties = [
  PropertyModel(
    id: "5",
    title: "Model Apartment in New York",
    description: "A beautiful villa with a pool and garden in the suburbs of New York City with a beautiful view of the city skyline and the Statue of Liberty in the distance. Ideal for families and those who love to entertain guests. Fully furnished and move-in ready. Close to all amenities and public transportation.",
    isForSale: false,
    isForRent: true,
    salePrice: 50000,
    rentPrice: 4000,
    address: "123 Main St, New York, NY",
    latitude: 37.793536921821996,
    longitude: -122.43306347486465,
    bedrooms: 2,
    bathrooms: 1,
    area: 142,
    features: ["pool", "garden", "garage"],
    images: [
      "https://images.unsplash.com/photo-1529408632839-a54952c491e5?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDN8fGFwYXJ0bWVudHxlbnwwfHwwfHx8MA%3D%3D",
      "https://images.unsplash.com/photo-1613575831056-0acd5da8f085?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDR8fGFwYXJ0bWVudHxlbnwwfHwwfHx8MA%3D%3D",
      "https://images.unsplash.com/photo-1536376072261-38c75010e6c9?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTV8fGFwYXJ0bWVudHxlbnwwfHwwfHx8MA%3D%3D",
    ],
    coverImage: "https://images.unsplash.com/photo-1529408686214-b48b8532f72c?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzh8fGFwYXJ0bWVudHxlbnwwfHwwfHx8MA%3D%3D",
    listedDate: DateTime.now(),
  ),
  PropertyModel(
    id: "1",
    title: "Luxury Villa",
    description: "A beautiful villa with a pool and garden in the suburbs of New York City with a beautiful view of the city skyline and the Statue of Liberty in the distance. Ideal for families and those who love to entertain guests. Fully furnished and move-in ready. Close to all amenities and public transportation.",
    isForSale: true,
    isForRent: false,
    salePrice: 500000,
    rentPrice: 2300,
    address: "123 Main St, New York, NY",
    latitude: 37.787364545182854,
    longitude: -122.43014523148457,
    bedrooms: 4,
    bathrooms: 3,
    area: 300,
    features: ["pool", "garden", "garage"],
    images: [
      "https://images.unsplash.com/photo-1605146769289-440113cc3d00?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D",
      "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fHw%3D",
      "https://images.unsplash.com/photo-1628624747186-a941c476b7ef?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEwfHx8ZW58MHx8fHx8",
    ],
    coverImage: "https://plus.unsplash.com/premium_photo-1682377521697-bc598b52b08a?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8dmlsbGF8ZW58MHx8MHx8fDA%3D",
    listedDate: DateTime.now(),
  ),
  PropertyModel(
    id: "2",
    title: "Modern Apartment",
    description: "A modern apartment in the city center of Los Angeles with a beautiful view of the Hollywood sign and the Griffith Observatory. Close to all amenities and public transportation. Fully furnished and move-in ready. Ideal for young professionals and couples.",
    isForSale: true,
    isForRent: true,
    salePrice: 300000,
    rentPrice: 750,
    address: "456 Elm St, Los Angeles, CA",
    latitude: 37.78806569706252,
    longitude: -122.44040191838464,
    bedrooms: 2,
    bathrooms: 2,
    area: 150,
    features: ["pool", "gym", "parking"],
    images: [
      "https://images.unsplash.com/photo-1566688342604-dbe3e7357104?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE4fHx8ZW58MHx8fHx8",
      "https://images.unsplash.com/photo-1563676881004-195cc77531bc?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDQxfHx8ZW58MHx8fHx8",
      "https://plus.unsplash.com/premium_photo-1711412119864-62e9013b0914?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDc0fHx8ZW58MHx8fHx8",
    ],
    coverImage: "https://images.unsplash.com/photo-1566787020216-3e4f973ec5ec?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fHw%3D",
    listedDate: DateTime.now(),
  ),
  
  PropertyModel(
    id: "3",
    title: "Modern Apartment",
    description: "A modern apartment in the city center of Los Angeles with a beautiful view of the Hollywood sign and the Griffith Observatory. Close to all amenities and public transportation. Fully furnished and move-in ready. Ideal for young professionals and couples.",
    isForSale: true,
    isForRent: true,
    salePrice: 300000,
    rentPrice: 1800,
    address: "456 Elm St, Los Angeles, CA",
    latitude: 37.79719958315512,
    longitude: -122.44229041269116,
    bedrooms: 2,
    bathrooms: 2,
    area: 150,
    features: ["pool", "gym", "parking"],
    images: [
      "https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXBhcnRtZW50fGVufDB8fDB8fHww",
      "https://images.unsplash.com/photo-1502672023488-70e25813eb80?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YXBhcnRtZW50fGVufDB8fDB8fHww",
      "https://plus.unsplash.com/premium_photo-1711412119864-62e9013b0914?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDc0fHx8ZW58MHx8fHx8",
    ],
    coverImage: "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YXBhcnRtZW50fGVufDB8fDB8fHww",
    listedDate: DateTime.now(),
  ),
  PropertyModel(
    id: "4",
    title: "New Build Apartment",
    description: "A modern apartment in the city center of Los Angeles with a beautiful view of the Hollywood sign and the Griffith Observatory. Close to all amenities and public transportation. Fully furnished and move-in ready. Ideal for young professionals and couples.",
    isForSale: false,
    isForRent: true,
    salePrice: 300000,
    rentPrice: 2000,
    address: "456 Elm St, Los Angeles, CA",
    latitude: 37.778687900311965,
    longitude: -122.44709297406608,
    bedrooms: 2,
    bathrooms: 2,
    area: 150,
    features: ["pool", "gym", "parking"],
    images: [
      "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGFwYXJ0bWVudHxlbnwwfHwwfHx8MA%3D%3D",
      "https://images.unsplash.com/photo-1484154218962-a197022b5858?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGFwYXJ0bWVudHxlbnwwfHwwfHx8MA%3D%3D",
      "https://images.unsplash.com/photo-1628592102751-ba83b0314276?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGFwYXJ0bWVudHxlbnwwfHwwfHx8MA%3D%3D",
    ],
    coverImage: "https://images.unsplash.com/photo-1617201929478-8eedff7508f9?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OTZ8fGFwYXJ0bWVudHxlbnwwfHwwfHx8MA%3D%3D",
    listedDate: DateTime.now(),
  ),
];
