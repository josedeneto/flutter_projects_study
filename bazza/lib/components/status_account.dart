import 'package:bazza/style.dart';
import 'package:flutter/material.dart';

class StatusAccount extends StatelessWidget {
  const StatusAccount({
    Key? key,
    required this.statusTitle,
    required this.statusSubtitle, 
  }) : super(key: key);
  final String statusTitle;
  final String statusSubtitle;
  


  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: 110,
        height: 70,
        decoration: BoxDecoration(
            color: colorTextField, borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    statusTitle.toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'Poppins'),
                  ),
                   const Icon(Icons.swap_vert_outlined, color: Colors.white,)
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                statusSubtitle,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: secondaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
