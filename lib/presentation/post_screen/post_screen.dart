import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String condition = 'Used'; // Default selected condition
  String selectedCategory = 'Option 1'; // Example for dropdown
  String selectedOrigin = 'Option 1'; // Example for dropdown
  final TextEditingController priceController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Detail Information Section
            _buildSectionTitle('Detail Information'),
            GestureDetector(
              onTap: () {
                // Navigate to posting rules
              },
              child: Text(
                'See more about Posting Rules',
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ),
            SizedBox(height: 20),

            // Photo/Video Upload Section
            _buildMediaUploadSection(),

            SizedBox(height: 20),

            // Condition Selector
            Text('Condition *', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildConditionSelector(),

            SizedBox(height: 20),

            // Dropdown and Price Field
            _buildDropdownField('Part category', (value) {
              setState(() {
                selectedCategory = value!;
              });
            }),
            SizedBox(height: 16),
            _buildDropdownField('Place of origin', (value) {
              setState(() {
                selectedOrigin = value!;
              });
            }),
            SizedBox(height: 16),
            _buildTextField('Price *', TextInputType.number, controller: priceController),

            SizedBox(height: 20),

            // Title and Description Fields
            _buildSectionTitle('TITLE AND DETAILED DESCRIPTION'),
            SizedBox(height: 10),
            _buildTextField('Title post *', TextInputType.text, controller: titleController),
            SizedBox(height: 16),
            _buildTextField('Detail description *', TextInputType.multiline,
                maxLines: 5, controller: descriptionController),

            SizedBox(height: 20),

            // Post Button
            ElevatedButton(
              onPressed: () {
                // Handle Post action
                _handlePost();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Background color
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text('Post', style: TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }

  // Helper methods

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildMediaUploadSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 100,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt, size: 40),
                Text('Post 0 to 8 Photos'),
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 100,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.video_library, size: 40),
                Text('Post Video'),
                Text('You Have Posted 0/0 Videos This Month',
                    style: TextStyle(fontSize: 10)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConditionSelector() {
    return Row(
      children: [
        ChoiceChip(
          label: Text('Used'),
          selected: condition == 'Used',
          onSelected: (value) {
            setState(() {
              condition = 'Used';
            });
          },
        ),
        SizedBox(width: 10),
        ChoiceChip(
          label: Text('New'),
          selected: condition == 'New',
          onSelected: (value) {
            setState(() {
              condition = 'New';
            });
          },
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              items: [
                DropdownMenuItem(
                  child: Text("Option 1"),
                  value: "Option 1",
                ),
                DropdownMenuItem(
                  child: Text("Option 2"),
                  value: "Option 2",
                ),
              ],
              onChanged: onChanged,
              hint: Text("Select an option"),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextInputType keyboardType, {int maxLines = 1, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          ),
        ),
      ],
    );
  }

  void _handlePost() {
    // Implement the logic for handling the post submission here
    String title = titleController.text;
    String description = descriptionController.text;
    String price = priceController.text;

    // Perform validation checks
    if (title.isEmpty || description.isEmpty || price.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    // If everything is filled out, proceed to submit the post
    // Call your post submission API or controller here

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Post submitted successfully!')),
    );
  }
}
