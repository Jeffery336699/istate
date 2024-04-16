import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetStatePage extends StatefulWidget {
  const NetStatePage({super.key});

  @override
  State<NetStatePage> createState() => _NetStatePageState();
}

class _NetStatePageState extends State<NetStatePage> {
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  ConnectivityResult _netState = ConnectivityResult.none;

  @override
  void initState() {
    super.initState();
    _subscription = Connectivity().onConnectivityChanged.listen(_onNetChanged);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('网络状态监听')),
      body: Center(
        child: NetStatePanel(state: _netState),
      ),
    );
  }

  void _onNetChanged(List<ConnectivityResult> event) {
    ConnectivityResult newState = event.first;
    if (newState != _netState) {
      setState(() {
        _netState = newState;
      });
    }
  }
}

class NetStatePanel extends StatelessWidget {
  final ConnectivityResult? state;

  const NetStatePanel({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (state == ConnectivityResult.mobile)
          const Icon(Icons.network_cell, color: Colors.green, size: 60),
        if (state == ConnectivityResult.wifi)
          const Icon(Icons.wifi, color: Colors.blue, size: 60),
        if (state == ConnectivityResult.none)
          const Icon(Icons.network_locked_outlined, color: Colors.grey, size: 60),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('$state'),
        ),
      ],
    );
  }
}
