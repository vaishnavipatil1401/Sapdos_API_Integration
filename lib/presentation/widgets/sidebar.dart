import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 12, 46, 74), 
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40), 
          Center(
            child: Text(
              'Sidebar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20), 
          _buildSidebarItem(Icons.dashboard, 'Categories', context),
          _buildSidebarItem(Icons.calendar_today, 'Appointment', context),
          _buildSidebarItem(Icons.chat, 'Chat', context),
          _buildSidebarItem(Icons.settings, 'Settings', context),
          _buildSidebarItem(Icons.logout, 'Logout', context),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {
        Navigator.pop(context); 
      },
    );
  }
}
