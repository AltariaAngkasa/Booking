import 'package:flutter/material.dart';

enum SeatType { vip, sofa, table6, table4 }

class Seat {
  final String label;
  final SeatType type;

  Seat(this.label, this.type);
}

class ChooseSeatPage extends StatefulWidget {
  const ChooseSeatPage({super.key});

  @override
  State<ChooseSeatPage> createState() => _ChooseSeatPageState();
}

class _ChooseSeatPageState extends State<ChooseSeatPage> {
  final List<Seat> seats = [
    Seat("SOFA 1", SeatType.sofa),
    Seat("SOFA 2", SeatType.sofa),
    Seat("SOFA 3", SeatType.sofa),
    Seat("SOFA 4", SeatType.sofa),
    Seat("SOFA 5", SeatType.sofa),
    Seat("VIP 1", SeatType.vip),
    Seat("VIP 2", SeatType.vip),
    Seat("TB6", SeatType.table6),
    Seat("TB5", SeatType.table4),
    Seat("TB16", SeatType.table6),
    //tambah lagi kalau perlu
  ];

  Seat? selectedSeat;
  String? selectedEta;
  String? selectedPax;

  int get downPayment {
    if (selectedSeat == null) return 0;
    switch (selectedSeat!.type) {
      case SeatType.vip:
        return 500000;
      case SeatType.sofa:
        return 200000;
      case SeatType.table6:
        return 1500000;
      case SeatType.table4:
        return 1000000;
    }
  }

  Color getSeatColor(SeatType type) {
    switch (type) {
      case SeatType.vip:
        return Colors.amber;
      case SeatType.sofa:
        return Colors.purple.shade400;
      case SeatType.table6:
        return Colors.grey.shade700;
      case SeatType.table4:
        return Colors.green.shade400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Choose a Seat"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          //Seats Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: seats.map((seat) {
                  final isSelected = seat == selectedSeat;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSeat = seat;
                      });
                    },
                    child: Container(
                      width: 80,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white
                            : getSeatColor(seat.type),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        seat.label,
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          //Bottom Sheet
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF1E1E1E),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selected: ${selectedSeat?.label ?? '-'}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  "Down Payment: Rp. ${downPayment.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 12,),

                //Dropdown ETA
                DropdownButtonFormField<String>(
                  dropdownColor: Colors.grey[900],
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    hintText: "Estimated Time of Arrival",
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(),
                  ),
                  iconEnabledColor: Colors.white,
                  value: selectedEta,
                  items: ["20:00", "20:30", "21:00"]
                        .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e, style: const TextStyle(color: Colors.white),),
                        )).toList(),
                        onChanged: (val) => setState(() => selectedEta = val),
                ),
                const SizedBox(height: 12,),

                //DropDown PAX
                DropdownButtonFormField<String>(
                  dropdownColor: Colors.grey[900],
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    hintText: "Choose PAX",
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(),
                  ),
                  iconEnabledColor: Colors.white,
                  value: selectedPax,
                  items: ["2", "4", "6", "8"]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e, style: const TextStyle(color: Colors.white)),
                          ))
                      .toList(),
                  onChanged: (val) => setState(() => selectedPax = val),
                ),
                const SizedBox(height: 20),

                //Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.purple),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text("Cancel", style: TextStyle(color: Colors.purple),),
                        ),
                    ),
                    const SizedBox(width: 12,),
                    //Lanjut ke Payment
                    Expanded(
                      child: ElevatedButton(
                        onPressed: selectedSeat != null && selectedEta != null && selectedPax != null
                        ? (){
                          //Arahin ke PaymentPage
                          print("Continue to Payment");
                        }
                        :null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text("Continue to Payment"),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
