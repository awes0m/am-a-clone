import 'package:ama_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatelessWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            'Deal Of the day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 8),
        Image.network(
            'https://images.unsplash.com/photo-1665686310429-ee43624978fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
            height: 235,
            fit: BoxFit.fitHeight),
        const SizedBox(height: 8),
        Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(
              left: 15,
              right: 40,
            ),
            child: const Text('\$ 100',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, right: 40, top: 5),
          child: const Text(
            'BillGates',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image.network(
                  'https://images.unsplash.com/photo-1665686310429-ee43624978fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                  height: 100,
                  width: 100,
                  fit: BoxFit.fitWidth),
              Image.network(
                  'https://images.unsplash.com/photo-1665686310429-ee43624978fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                  height: 100,
                  width: 100,
                  fit: BoxFit.fitWidth),
              Image.network(
                  'https://images.unsplash.com/photo-1665686310429-ee43624978fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                  height: 100,
                  width: 100,
                  fit: BoxFit.fitWidth),
              Image.network(
                  'https://images.unsplash.com/photo-1665686310429-ee43624978fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                  height: 100,
                  width: 100,
                  fit: BoxFit.fitWidth),
            ],
          ),
        ),
        Container(
            padding:
                const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
            alignment: Alignment.topLeft,
            child: Text(
              'See All Deals',
              style: TextStyle(color: GlobalVariables.secondaryColor),
            ))
      ],
    );
  }
}
