import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_services.dart';

void main(){


  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView()
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {

          }, icon: const Icon(CupertinoIcons.cart,color: Colors.black,))
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('New Trend',style: TextStyle(color: Colors.black),),
      ),
      body: FutureBuilder<List<ProductModel>>(
          future: GetAllProductsServices().getAllProducts(),
          builder: (context, snapshot) {
            try{
              List<ProductModel> products = snapshot.data!;
             return Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 70),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 60,
                      mainAxisSpacing: 60,
                      childAspectRatio: 0.9
                  ),
                  itemBuilder: (context, index) {
                    return  CustomCard(productModel: snapshot.data![index],);
                  },
                  itemCount: products.length,
                ),
              );
            }catch(e){
              return Text(e.toString());
            }
          }

      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
  Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return UpdateProductPage();
      }, ));
      },
      child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration:  BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 40,
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0,
                        offset: const Offset(10, 10)
                    )
                  ]
              ),
              child:  Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productModel.title!.substring(0,6),style: TextStyle(color: Colors.grey,fontSize: 18),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${productModel.description}',style: TextStyle(color: Colors.black,fontSize: 18),),
                          Icon(Icons.favorite,color: Colors.red,)


                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -50,
              right: 55,
              child: Image.network(productModel.image!,height: 100,width: 100,),
            )
          ]
      ),
    );
  }
}

class UpdateProductPage extends StatelessWidget {
  const UpdateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ,
    );
  }
}



