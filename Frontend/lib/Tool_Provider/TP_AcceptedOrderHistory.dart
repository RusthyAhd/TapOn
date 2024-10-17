import 'package:flutter/material.dart';
import 'package:tap_on/Tool_Provider/TP_AcceptOrder.dart';
import 'package:tap_on/Tool_Provider/TP_Dashboard.dart';

class TP_AcceptedHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TP_Dashboard()),
            );
          },
        ),
        title: Text('Accepted Bookings'),
        backgroundColor: Colors.amber,
      ),
      body: BookingList(),
    );
  }
}

class BookingList extends StatelessWidget {
  final List<Map<String, dynamic>> bookings = [
    {
      "id": "#4",
      "status": "Pending",
      "CustomerName": "Rishaf Hardware",
      "Tools": "Hammer",
      "price": 19.75,
      "color": Colors.orange[50]
    },
    {
      "id": "#3",
      "status": "Pending",
      "CustomerName": "Rusthy Store",
      "Tools": "Painting Box",
      "price": 19.75,
      "color": Colors.blue[50]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return BookingCard(
          id: bookings[index]['id'],
          status: bookings[index]['status'],
          CustomerName: bookings[index]['CustomerName'],
          Tools: bookings[index]['Tools'],
          price: bookings[index]['price'],
          backgroundColor: bookings[index]['color'],
        );
      },
    );
  }
}

class BookingCard extends StatelessWidget {
  final String id;
  final String status;
  final String CustomerName;
  final String Tools;
  final double price;
  final Color? backgroundColor;

  BookingCard({
    required this.id,
    required this.status,
    required this.CustomerName,
    required this.Tools,
    required this.price,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Define the action when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TP_AcceptedOrder()),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: Colors.red[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    CustomerName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    Tools,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                id,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.purple[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
