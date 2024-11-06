import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return const Text(
          'No data receveied. Please button "Load"',
          style: TextStyle(fontSize: 20),
        );
      }
      if (state is UserLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is UserLoadedState) {
        return ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (context, index) => Container(
            color: index % 2 == 0 ? Colors.white : Colors.blue[50],
            child: ListTile(
              leading: Text(
                'ID: ${state.loadedUser[index].id}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Column(
                children: [
                  Text(
                    'My name is ${state.loadedUser[index].name}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text(
                        'Email: ${state.loadedUser[index].email}',
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Phone: ${state.loadedUser[index].phone}',
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
      if (state is UserErrorState) {
        return const Text(
          'Error fetching users',
          style: TextStyle(fontSize: 20),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
