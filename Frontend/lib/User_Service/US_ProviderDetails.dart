import 'package:flutter/material.dart';
import 'package:tap_on/User_Service/US_PreBooking.dart';




class US_ProviderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data for the service provider
    String providerName = 'Rishaf';
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Service Details', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service provider info
            Row(
              children: [

                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/rishaf.jpg'),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mohammed Rishaf',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Plumbing Specialist',
                        style:
                            TextStyle(fontSize: 16, color: Colors.grey[600])),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 5),
                        Text('4.9', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Certification Details
            Divider(thickness: 1),
            Text('Certification Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Center(
              child: Text(
                  'Certified Plumbing Technician from ABC Institute. License No: 123456789',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700])),

            ),
            const SizedBox(height: 15),

            

            // Address
            Divider(thickness: 1),
            Text('District',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('Kandy',
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            SizedBox(height: 15),

            Divider(thickness: 1),
            Text('Distance',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('5.3 Km',
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            SizedBox(height: 15),

            // Experience
            Divider(thickness: 1),
            Text('Experience',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
                'Over 10 years of experience in handling all types of plumbing issues, including leak repairs, pipe installations, and bathroom renovations.',
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            SizedBox(height: 15),

            // Amount per hour
            Divider(thickness: 1),
            Text('Consultant Fee',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('\Rs.150.00',
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            SizedBox(height: 10),
            Text('Amount per Day',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('\Rs.350 per day',
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            SizedBox(height: 20),

            // Reviews

            Divider(thickness: 1),
            Text('Reviews',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Column(
              children: [
                ReviewCard(),
                SizedBox(height: 10),
                ReviewCard(),
              ],
            ),

            SizedBox(height: 20),



            // Action buttons
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('Book Service'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.yellow,

                      padding:
                          EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                            builder: (context) => US_PreBooking()),

                      );
                    },
                    child: Text('Pre Booking'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.yellow,

                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(fontSize: 16),
                    ),

                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: ListTile(

        leading: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/guy_hawkins.jpg'),
        ),
        title: Text('Guy Hawkins',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        subtitle: Text('Great service! Very professional and on time.',
            style: TextStyle(fontSize: 14)),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: Colors.amber, size: 16),
            SizedBox(width: 4),
            Text('4.9', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
