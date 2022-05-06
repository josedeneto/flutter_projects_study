import 'package:bazza/style.dart';
import 'package:flutter/material.dart';


class ActualyPlan extends StatelessWidget {
  const ActualyPlan({ Key? key, required this.planTitle, required this.typeOfPlan }) : super(key: key);
  final String planTitle;
  final String typeOfPlan;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: 110,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white60),
            color:Colors.transparent, borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    planTitle.toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'Poppins'),
                  ),
                  const Icon(Icons.loop_rounded, color: Colors.white,)
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                typeOfPlan,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color:secondaryColor ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
















