import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:td/application/user_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("User Page"),
            backgroundColor: Colors.lightBlue[600],
          ),
          backgroundColor: Colors.lightBlue[50], // Orqa fonda light blue rang
          body: Center(
            child: () {
              if (state is UserLoadingState) {
                return const CircularProgressIndicator.adaptive();
              } else if (state is UserErrorState) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: TextStyle(
                      color: Colors.red[600],
                      fontSize: 16,
                    ),
                  ),
                );
              } else if (state is UserComplete) {
                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      shadowColor: Colors.lightBlue[100],
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightBlue[100],
                          child: Text(
                            state.users[index].name[0].toUpperCase(),
                            style: TextStyle(color: Colors.lightBlue[800]),
                          ),
                        ),
                        title: Text(
                          state.users[index].name.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue[900],
                          ),
                        ),
                        subtitle: Text(
                          state.users[index].email.toString(),
                          style: TextStyle(
                            color: Colors.lightBlue[700],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
            }(),
          ),
        );
      },
    );
  }
}
