import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle cart action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Date filter dropdown
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Date',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Date', 'Today', 'Yesterday']
                        .map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      // Handle date change
                    },
                  ),
                ),
                SizedBox(width: 8.0),
                // Search field for Order ID
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Order ID',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                // Reset Button
                ElevatedButton(
                  onPressed: () {
                    // Handle reset
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                orderItem(
                  status: 'COMPLETED',
                  subStatus: '2ND ORDER',
                  orderId: '162267901',
                  date: '12 Sept 2024, 9:31 am',
                  itemCount: 4,
                  total: 'LKR 1,208.00',
                  statusColor: Colors.green,
                ),
                orderItem(
                  status: 'COMPLETED',
                  subStatus: 'NEW CUSTOMER',
                  orderId: '162250430',
                  date: '11 Sept 2024, 12:15 pm',
                  itemCount: 1,
                  total: 'LKR 298.00',
                  statusColor: Colors.green,
                ),
                orderItem(
                  status: 'CANCELLED',
                  subStatus: 'NEW CUSTOMER | PASSENGER',
                  reason: 'Order takes a long time to process',
                  orderId: '162246651',
                  date: '11 Sept 2024, 8:36 am',
                  itemCount: 2,
                  total: 'LKR 429.00',
                  statusColor: Colors.red,
                ),
                orderItem(
                  status: 'CANCELLED',
                  subStatus: 'NEW CUSTOMER | PASSENGER',
                  reason: 'Changed my mind',
                  orderId: '162246639',
                  date: '11 Sept 2024, 8:35 am',
                  itemCount: 2,
                  total: 'LKR 429.00',
                  statusColor: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget orderItem({
    required String status,
    String? subStatus,
    String? reason,
    required String orderId,
    required String date,
    required int itemCount,
    required String total,
    required Color statusColor,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 8),
                if (subStatus != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(subStatus),
                  ),
              ],
            ),
            SizedBox(height: 8),
            Text('Order ID: $orderId'),
            Text(date),
            if (reason != null) ...[
              SizedBox(height: 4),
              Text(
                reason,
                style: TextStyle(color: Colors.red),
              ),
            ],
            SizedBox(height: 8),
            Text('$itemCount Items'),
            Text(total, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
