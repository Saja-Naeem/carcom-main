import 'package:flutter/material.dart';

class CarDetails extends StatefulWidget{
  // ignore: prefer_typing_uninitialized_variables
  final data;

  const CarDetails({
    super.key, this.data,
  });

 @override
 State<CarDetails> createState() => _CarDetails();

}
class _CarDetails extends State<CarDetails>{



@override
Widget build(BuildContext context){
return Scaffold( 

appBar:AppBar(
  elevation: 0.0,
  
  title: const Text('Car Details',textAlign: TextAlign.center, ),
  centerTitle: true,
  actions: const [
  IconButton( icon: Icon(Icons.favorite,size:30), 
  onPressed:null,
  ),
  ],),

  body:Padding(
    padding: const EdgeInsets.only(left: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Image.asset(widget.data['image']),
      // ignore: avoid_unnecessary_containers
      Container(
        
      child: Text
      (widget.data['title'],
      style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)
      )),
      Container(
        margin:const EdgeInsets.only(top:10),
        child: Text(
        widget.data['subtitle'],
        style:TextStyle(color:Colors.grey[700])
        )),
        const SizedBox(height: 20,),
        const Text("Specifications",
        style:TextStyle(
          color:Colors.black,
          fontWeight: FontWeight.bold,
           fontSize: 25
          ) ),
        const SizedBox(height: 20,),
  
    Container(
  height: 88,
  padding: const EdgeInsets.only(top: 10),
  margin: const EdgeInsets.only(bottom: 16),
  child: ListView(
   physics: const NeverScrollableScrollPhysics(),
   scrollDirection: Axis.horizontal,
   children: [
    
  specCar(
      title: "Color",
      data: widget.data['color']
     ),
  specCar(
      title: "Gearbox",
      data: widget.data['gearbox']
     ),
  specCar(
      title: "Fuel",
      data: widget.data['fuel']
     ),
  
  
   ],
  
   ),
     
  
    ),
  
  Container(
  height: 88,
  padding: const EdgeInsets.only(top: 10),
  margin: const EdgeInsets.only(bottom: 16),
  child: ListView(
   physics: const NeverScrollableScrollPhysics(),
   scrollDirection: Axis.horizontal,
   children: [
  
  
  specCar(
      title: "Brand",
      data: widget.data['brand']
     ),
  specCar(
      title: "Seat",
      data: widget.data['Seat']
     ),
  specCar(
      title: "Speed",
      data: widget.data['Speed']
     ),
   ],
  
   ),
     
  
    ),
  
    ],),
  ),
  bottomNavigationBar: builderFooter(),


);



}

Widget specCar ({required String title,required String data}){
  return Container(
    width: 120,
    decoration: BoxDecoration(
      color: Colors.blue[200],
      borderRadius: BorderRadius.circular(15),
    ),
 padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
 margin: const EdgeInsets.only(right: 16),

child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.center,
children: [
    Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),),
    const SizedBox(height: 2,),
    Text(
      data,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    )


      ],
),
  );
}
Widget builderFooter(){
  return Container(
    height: 70,
    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
    color: Colors.blue[200],
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
                  const Text(
                    "Price",
                    
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                    
                  ),
                 
                   Row(
            children: [
              Text(widget.data['price'],
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              
            ],
          ),

                ],
              
          ),
          InkWell(
            onTap: (){},
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(12) 
                ),
               child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(" Select ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                  ),
                ),
               ),
            ),
          )
        
      ],
    ),
    

  );
}


}
