import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Goldhome extends StatefulWidget {
  const Goldhome({super.key});

  @override

  State<Goldhome> createState() => _GoldhomeState();
}

class _GoldhomeState extends State<Goldhome> {
  TextEditingController goldPriceController = TextEditingController();
  TextEditingController tolaQuantityController = TextEditingController();
  TextEditingController gramsQuantityController = TextEditingController();
  TextEditingController ratiQuantityController = TextEditingController();
  TextEditingController pointQuantityController = TextEditingController();

  double res = 0.0;
  double totalPrice = 0.0;
  double gramTotalprice = 0.0;
  double ratiPrice = 0.0;
  double pointstotalprice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          if (goldPriceController.text.isEmpty) goldPriceController.text = "0";
          if (tolaQuantityController.text.isEmpty) tolaQuantityController.text = "0";
          if (gramsQuantityController.text.isEmpty) gramsQuantityController.text = "0";
          if (ratiQuantityController.text.isEmpty) ratiQuantityController.text = "0";
          if (pointQuantityController.text.isEmpty) pointQuantityController.text = "0";

          double goldPrice = double.parse(goldPriceController.text);
          double tolaQuantity = double.parse(tolaQuantityController.text);
          double gramQuantity = double.parse(gramsQuantityController.text);
          double ratiQuantity = double.parse(ratiQuantityController.text);
          double pointQuantity = double.parse(pointQuantityController.text);

          double pricePerGram = goldPrice / 11.664;
          double pricePerRati = goldPrice / 96;
          double pricePerPoint = goldPrice / 960;

          gramTotalprice = pricePerGram * gramQuantity;
          totalPrice = goldPrice * tolaQuantity;
          ratiPrice = pricePerRati * ratiQuantity;
          pointstotalprice = pricePerPoint * pointQuantity;

          res = totalPrice + gramTotalprice + ratiPrice + pointstotalprice;

          setState(() {});
        },
        child: const Icon(
          Icons.calculate,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Gold App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildTextField(tolaQuantityController, 'Enter Tola Quantity'),
            const SizedBox(height: 10),
            _buildTextField(goldPriceController, 'Enter Tola Price'),
            const SizedBox(height: 10),
            _buildTextField(gramsQuantityController, 'Enter Grams Quantity'),
            const SizedBox(height: 10),
            _buildTextField(ratiQuantityController, 'Enter Rati Quantity'),
            const SizedBox(height: 10),
            _buildTextField(pointQuantityController, 'Enter Points Quantity'),
            const SizedBox(height: 20),
            _buildStyledText('Gram total price Rs. $gramTotalprice'),
            _buildStyledText('Total tola price Rs. $totalPrice'),
            _buildStyledText('Total Rati price Rs. $ratiPrice'),
            _buildStyledText('Total Points price Rs. $pointstotalprice'),
            const SizedBox(height: 10),
            Text(
              'Total Price Rs. $res',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purpleAccent,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  'Info',
                  'Fill in the fields properly!',
                  backgroundColor: Colors.pink.withOpacity(0.3),
                  icon: const Icon(Icons.info_outline, color: Colors.white),
                  duration: const Duration(seconds: 3),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'Snackbar Button',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildStyledText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.purpleAccent,
      ),
    );
  }
}
