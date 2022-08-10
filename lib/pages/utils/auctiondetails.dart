import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuctionDetails{
  var Category;
  var Type;
  var Model;
  var Manufacturing;
  var Specifications;
  var ConditionProduct;
  var MinimumPrice;
  var BiddingDuration;
  var Address;
  var Paytm;
  var PhonePe;
  var NetBanking;
  var UrgentSale;
  var Featured;
  var Ad;
  var TermandCondition;
  AuctionDetails({
    this.Category,
    this.Type,
    this.Model,
    this.Manufacturing,
    this.Specifications,
    this.ConditionProduct,
    this.MinimumPrice,
    this.BiddingDuration,
    this.Address,
    this.Paytm,
    this.PhonePe,
    this.NetBanking,
    this.UrgentSale,
    this.Featured,
    this.Ad,
    this.TermandCondition,
  });
  CollectionReference db=FirebaseFirestore.instance.collection('Details');

  Future<void> addProduct(AuctionDetails auctionDetails) async{
    Map<String, dynamic> data ={
        "Category":auctionDetails.Category,
        "Type":auctionDetails.Type,
        "Model":auctionDetails.Model,
        "Manufacturing":auctionDetails.Manufacturing,
        "Specifications":auctionDetails.Specifications,
        "ConditionProduct":auctionDetails.ConditionProduct,
        "MinimumPrice":auctionDetails.MinimumPrice,
        "BiddingDuration":auctionDetails.BiddingDuration,
        "Address":auctionDetails.Address,
        "Paytm":auctionDetails.Paytm,
        "NetBanking":auctionDetails.NetBanking,
        "UrgentSale":auctionDetails.UrgentSale,
        "Featured":auctionDetails.Featured,
        "Ad":auctionDetails.Ad,
        "TermandCondition":auctionDetails.TermandCondition,
    };
    await db.add(data);
  }
  Future<void> updateProduct(String id, AuctionDetails updateProduct) async{
    Map<String, dynamic> data ={
        "Category":updateProduct.Category,
        "Type":updateProduct.Type,
        "Model":updateProduct.Model,
        "Manufacturing":updateProduct.Manufacturing,
        "Specifications":updateProduct.Specifications,
        "ConditionProduct":updateProduct.ConditionProduct,
        "MinimumPrice":updateProduct.MinimumPrice,
        "BiddingDuration":updateProduct.BiddingDuration,
        "Address":updateProduct.Address,
        "Paytm":updateProduct.Paytm,
        "NetBanking":updateProduct.NetBanking,
        "UrgentSale":updateProduct.UrgentSale,
        "Featured":updateProduct.Featured,
        "Ad":updateProduct.Ad,
        "TermandCondition":updateProduct.TermandCondition,
    };
    await db.doc(id).update(data);
  }
  Future<void> delete(String id) async{
    await db.doc(id).delete();
  }
}