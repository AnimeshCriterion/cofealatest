class ComboProductDataModel {
  int? id;
  String? addedBy;
  int? userId;
  String? name;
  String? frgnName;
  String? slug;
  String? productType;
  int? combo;
  String? categoryIds;
  int? brandId;
  String? unit;
  int? minQty;
  int? refundable;
  String? digitalProductType;
  String? digitalFileReady;
  String? images;
  String? thumbnail;
  String? featured;
  String? flashDeal;
  String? videoProvider;
  String? videoUrl;
  String? colors;
  int? variantProduct;
  String? attributes;
  String? choiceOptions;
  String? variation;
  int? published;
  int? unitPrice;
  int? purchasePrice;
  int? tax;
  String? taxType;
  int? discount;
  String? discountType;
  int? currentStock;
  String? usedQuantity;
  int? minimumOrderQty;
  String? details;
  int? freeShipping;
  String? attachment;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? featuredStatus;
  String? metaTitle;
  String? metaDescription;
  String? metaImage;
  int? requestStatus;
  String? deniedNote;
  int? shippingCost;
  int? multiplyQty;
  String? tempShippingCost;
  String? isShippingCostUpdated;
  String? code;
  String? codeBars;
  String? onHand;
  String? uCategory;
  String? uSubgroup;
  String? uAndi;
  String? uSp1;
  String? uSp2;
  String? uSp3;
  String? uSp4;
  String? uSp5;
  String? uSp6;
  String? uAc1;
  String? uAc2;
  String? uAc3;
  String? uAc4;
  String? uAc5;
  String? uAc6;
  String? uAc7;
  String? uF1;
  String? uF2;
  String? uF3;
  String? uF4;
  String? uF5;
  String? uF6;
  String? uF7;
  String? uF8;
  String? uF9;
  String? uF10;
  String? uF11;
  String? uNsp1;
  String? uNpo;
  String? uCfspc;
  String? uEsp;
  String? uOrg;
  String? uBn;
  String? uRs;
  String? uPrs;
  String? uAlt;
  String? uCfp;
  String? uCpn;
  String? uStoragetype;
  String? uColors;
  int? reviewsCount;
  // List<Null>? translations;
  // List<Null>? reviews;

  ComboProductDataModel(
      {this.id,
        this.addedBy,
        this.userId,
        this.name,
        this.frgnName,
        this.slug,
        this.productType,
        this.combo,
        this.categoryIds,
        this.brandId,
        this.unit,
        this.minQty,
        this.refundable,
        this.digitalProductType,
        this.digitalFileReady,
        this.images,
        this.thumbnail,
        this.featured,
        this.flashDeal,
        this.videoProvider,
        this.videoUrl,
        this.colors,
        this.variantProduct,
        this.attributes,
        this.choiceOptions,
        this.variation,
        this.published,
        this.unitPrice,
        this.purchasePrice,
        this.tax,
        this.taxType,
        this.discount,
        this.discountType,
        this.currentStock,
        this.usedQuantity,
        this.minimumOrderQty,
        this.details,
        this.freeShipping,
        this.attachment,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.featuredStatus,
        this.metaTitle,
        this.metaDescription,
        this.metaImage,
        this.requestStatus,
        this.deniedNote,
        this.shippingCost,
        this.multiplyQty,
        this.tempShippingCost,
        this.isShippingCostUpdated,
        this.code,
        this.codeBars,
        this.onHand,
        this.uCategory,
        this.uSubgroup,
        this.uAndi,
        this.uSp1,
        this.uSp2,
        this.uSp3,
        this.uSp4,
        this.uSp5,
        this.uSp6,
        this.uAc1,
        this.uAc2,
        this.uAc3,
        this.uAc4,
        this.uAc5,
        this.uAc6,
        this.uAc7,
        this.uF1,
        this.uF2,
        this.uF3,
        this.uF4,
        this.uF5,
        this.uF6,
        this.uF7,
        this.uF8,
        this.uF9,
        this.uF10,
        this.uF11,
        this.uNsp1,
        this.uNpo,
        this.uCfspc,
        this.uEsp,
        this.uOrg,
        this.uBn,
        this.uRs,
        this.uPrs,
        this.uAlt,
        this.uCfp,
        this.uCpn,
        this.uStoragetype,
        this.uColors,
        this.reviewsCount,
        // this.translations,
        // this.reviews
      });

  ComboProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedBy = json['added_by'];
    userId = json['user_id'];
    name = json['name'];
    frgnName = json['frgn_name'];
    slug = json['slug'];
    productType = json['product_type'];
    combo = json['combo'];
    categoryIds = json['category_ids'];
    brandId = json['brand_id'];
    unit = json['unit'];
    minQty = json['min_qty'];
    refundable = json['refundable'];
    digitalProductType = json['digital_product_type'];
    digitalFileReady = json['digital_file_ready'];
    images = json['images'];
    thumbnail = json['thumbnail'];
    featured = json['featured'];
    flashDeal = json['flash_deal'];
    videoProvider = json['video_provider'];
    videoUrl = json['video_url'];
    colors = json['colors'];
    variantProduct = json['variant_product'];
    attributes = json['attributes'];
    choiceOptions = json['choice_options'];
    variation = json['variation'];
    published = json['published'];
    unitPrice = json['unit_price'];
    purchasePrice = json['purchase_price'];
    tax = json['tax'];
    taxType = json['tax_type'];
    discount = json['discount'];
    discountType = json['discount_type'];
    currentStock = json['current_stock'];
    usedQuantity = json['used_quantity'];
    minimumOrderQty = json['minimum_order_qty'];
    details = json['details'];
    freeShipping = json['free_shipping'];
    attachment = json['attachment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    featuredStatus = json['featured_status'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaImage = json['meta_image'];
    requestStatus = json['request_status'];
    deniedNote = json['denied_note'];
    shippingCost = json['shipping_cost'];
    multiplyQty = json['multiply_qty'];
    tempShippingCost = json['temp_shipping_cost'];
    isShippingCostUpdated = json['is_shipping_cost_updated'];
    code = json['code'];
    codeBars = json['code_bars'];
    onHand = json['on_hand'];
    uCategory = json['u_category'];
    uSubgroup = json['u_subgroup'];
    uAndi = json['u_andi'];
    uSp1 = json['u_sp1'];
    uSp2 = json['u_sp2'];
    uSp3 = json['u_sp3'];
    uSp4 = json['u_sp4'];
    uSp5 = json['u_sp5'];
    uSp6 = json['u_sp6'];
    uAc1 = json['u_ac1'];
    uAc2 = json['u_ac2'];
    uAc3 = json['u_ac3'];
    uAc4 = json['u_ac4'];
    uAc5 = json['u_ac5'];
    uAc6 = json['u_ac6'];
    uAc7 = json['u_ac7'];
    uF1 = json['u_f1'];
    uF2 = json['u_f2'];
    uF3 = json['u_f3'];
    uF4 = json['u_f4'];
    uF5 = json['u_f5'];
    uF6 = json['u_f6'];
    uF7 = json['u_f7'];
    uF8 = json['u_f8'];
    uF9 = json['u_f9'];
    uF10 = json['u_f10'];
    uF11 = json['u_f11'];
    uNsp1 = json['u_nsp1'];
    uNpo = json['u_npo'];
    uCfspc = json['u_cfspc'];
    uEsp = json['u_esp'];
    uOrg = json['u_org'];
    uBn = json['u_bn'];
    uRs = json['u_rs'];
    uPrs = json['u_prs'];
    uAlt = json['u_alt'];
    uCfp = json['u_cfp'];
    uCpn = json['u_cpn'];
    uStoragetype = json['u_storagetype'];
    uColors = json['u_colors'];
    reviewsCount = json['reviews_count'];
    // if (json['translations'] != null) {
    //   translations = <Null>[];
    //   json['translations'].forEach((v) {
    //     translations!.add(Null.fromJson(v));
    //   });
    // }
    // if (json['reviews'] != null) {
    //   reviews = <Null>[];
    //   json['reviews'].forEach((v) {
    //     reviews!.add(Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['added_by'] = addedBy;
    data['user_id'] = userId;
    data['name'] = name;
    data['frgn_name'] = frgnName;
    data['slug'] = slug;
    data['product_type'] = productType;
    data['combo'] = combo;
    data['category_ids'] = categoryIds;
    data['brand_id'] = brandId;
    data['unit'] = unit;
    data['min_qty'] = minQty;
    data['refundable'] = refundable;
    data['digital_product_type'] = digitalProductType;
    data['digital_file_ready'] = digitalFileReady;
    data['images'] = images;
    data['thumbnail'] = thumbnail;
    data['featured'] = featured;
    data['flash_deal'] = flashDeal;
    data['video_provider'] = videoProvider;
    data['video_url'] = videoUrl;
    data['colors'] = colors;
    data['variant_product'] = variantProduct;
    data['attributes'] = attributes;
    data['choice_options'] = choiceOptions;
    data['variation'] = variation;
    data['published'] = published;
    data['unit_price'] = unitPrice;
    data['purchase_price'] = purchasePrice;
    data['tax'] = tax;
    data['tax_type'] = taxType;
    data['discount'] = discount;
    data['discount_type'] = discountType;
    data['current_stock'] = currentStock;
    data['used_quantity'] = usedQuantity;
    data['minimum_order_qty'] = minimumOrderQty;
    data['details'] = details;
    data['free_shipping'] = freeShipping;
    data['attachment'] = attachment;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    data['featured_status'] = featuredStatus;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['meta_image'] = metaImage;
    data['request_status'] = requestStatus;
    data['denied_note'] = deniedNote;
    data['shipping_cost'] = shippingCost;
    data['multiply_qty'] = multiplyQty;
    data['temp_shipping_cost'] = tempShippingCost;
    data['is_shipping_cost_updated'] = isShippingCostUpdated;
    data['code'] = code;
    data['code_bars'] = codeBars;
    data['on_hand'] = onHand;
    data['u_category'] = uCategory;
    data['u_subgroup'] = uSubgroup;
    data['u_andi'] = uAndi;
    data['u_sp1'] = uSp1;
    data['u_sp2'] = uSp2;
    data['u_sp3'] = uSp3;
    data['u_sp4'] = uSp4;
    data['u_sp5'] = uSp5;
    data['u_sp6'] = uSp6;
    data['u_ac1'] = uAc1;
    data['u_ac2'] = uAc2;
    data['u_ac3'] = uAc3;
    data['u_ac4'] = uAc4;
    data['u_ac5'] = uAc5;
    data['u_ac6'] = uAc6;
    data['u_ac7'] = uAc7;
    data['u_f1'] = uF1;
    data['u_f2'] = uF2;
    data['u_f3'] = uF3;
    data['u_f4'] = uF4;
    data['u_f5'] = uF5;
    data['u_f6'] = uF6;
    data['u_f7'] = uF7;
    data['u_f8'] = uF8;
    data['u_f9'] = uF9;
    data['u_f10'] = uF10;
    data['u_f11'] = uF11;
    data['u_nsp1'] = uNsp1;
    data['u_npo'] = uNpo;
    data['u_cfspc'] = uCfspc;
    data['u_esp'] = uEsp;
    data['u_org'] = uOrg;
    data['u_bn'] = uBn;
    data['u_rs'] = uRs;
    data['u_prs'] = uPrs;
    data['u_alt'] = uAlt;
    data['u_cfp'] = uCfp;
    data['u_cpn'] = uCpn;
    data['u_storagetype'] = uStoragetype;
    data['u_colors'] = uColors;
    data['reviews_count'] = reviewsCount;
    // if (translations != null) {
    //   data['translations'] = translations!.map((v) => v?.toJson()).toList();
    // }
    // if (reviews != null) {
    //   data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}