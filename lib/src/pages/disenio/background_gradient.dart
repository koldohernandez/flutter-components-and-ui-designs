import 'package:flutter/material.dart';


class BackgroundGradient extends StatelessWidget 
{
  const BackgroundGradient({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards on gradient background'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.6],
            colors: [Color(0xFF8F9CAC).withOpacity(0.5), Color(0xFF8F9CAC)] // blanco hueso 0xfff1ede0
          )
        ),
        child: PageView.builder( 
          itemCount: 20,
          controller: PageController(
            viewportFraction: 0.7 
          ),
          itemBuilder: (_, _index) => CardItem(index: _index,)
        ), 
      ),
    );
  }
}



class CardItem extends StatelessWidget 
{
  final int index;
  

  const CardItem({Key key, this.index}) : super(key: key);

  
  @override
  Widget build(BuildContext context) 
  {
    
    return LayoutBuilder(
      builder: (context, constraints) {
        
        final itemHeight = constraints.maxHeight * 0.5;
        final itemWidth = constraints.maxWidth * 0.9;

        return Center(
          child: Container (
            height: itemHeight,
            width: itemWidth,
            child: Card(
              color: Colors.primaries[index % Colors.primaries.length],
              elevation: 2.0, // Sombra
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  (index + 1).toString(), 
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.white)   
                ),
              ),
            )
          )
        );


      },
    );
    
  }

}