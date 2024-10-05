import 'package:flutter/material.dart';



class CancelledOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rejected"),
        
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reason section
            Container(
              color: Colors.red[50],
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    'Reason: ',
                    style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'I am sick',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Booking ID and service details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Booking ID",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "162267901'",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
                ),
              ],
            ),
            SizedBox(height: 10),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.network('https://via.placeholder.com/50', fit: BoxFit.cover),
              title: Text("Santize full home"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date: September 25, 2024"),
                  Text("Time: 8:02 PM"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text("Booking Description", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Hmm"),
            SizedBox(height: 20),
            // Customer section
            Text("About Customer", style: TextStyle(fontWeight: FontWeight.bold)),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/50'),
              ),
            title: Text("Rishaf"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("123 Main St, Springfield"),
                  Text("Near Central Park"),
                ],
              ),
          
            ),

          
             
            
            // Price details
            Text("Price Detail", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPriceDetailRow("Price", "\$28.00 * 1 = \$28.00"),
                  _buildPriceDetailRow("Discount (7% off)", "-\$1.96", isDiscount: true),
                  _buildPriceDetailRow("Sub Total", "\$26.04"),
                  Divider(),
                  _buildPriceDetailRow("Total Amount", "\$26.04", isTotal: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceDetailRow(String title, String value, {bool isDiscount = false, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isDiscount ? Colors.green : isTotal ? Colors.purple : Colors.black,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: isDiscount ? Colors.green : isTotal ? Colors.purple : Colors.black,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
