import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/app/modules/increment/presenter/store/increment_store.dart';
import 'package:flutter_firebase/app/modules/increment/presenter/widgets/rounded_button.dart';

class IncrementInitialPage extends StatefulWidget {
  const IncrementInitialPage({
    super.key,
    required this.store,
  });

  final IncrementStore store;

  @override
  State<IncrementInitialPage> createState() => _IncrementInitialPageState();
}

class _IncrementInitialPageState extends State<IncrementInitialPage> {
  IncrementStore get store => widget.store;
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aplicação para teste de integração do Firebase',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<IncrementStore, IncrementState>(
            bloc: store,
            builder: (context, state) {
              return Text(
                state.incrementNumber.toString(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 80,
                  fontWeight: FontWeight.w200,
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedButton(
                onTapFunction: () async {
                  await analytics.logEvent(
                    name: 'decress_button',
                    parameters: {
                      'count': '1',
                    },
                  );
                  store.decressNumber();
                },
                textButton: 'Decrementar',
              ),
              const SizedBox(width: 50),
              RoundedButton(
                onTapFunction: () => store.addNumber(),
                textButton: 'Incrementar',
              ),
            ],
          ),
          const SizedBox(height: 20),
          RoundedButton(
            onTapFunction: () => store.zeroTheNumbers(),
            textButton: 'Zerar',
          ),
        ],
      ),
    );
  }
}
