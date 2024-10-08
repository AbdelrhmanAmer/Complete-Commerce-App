import 'package:flutter/material.dart';

class PersonalTile extends StatelessWidget {
  const PersonalTile({
    super.key,
    required this.username,
    required this.email,
    required this.onPress,
    this.justView = false,
  });

  final String username;
  final String email;
  final Function() onPress;
  final bool justView;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: justView ? null : onPress,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
              'https://th.bing.com/th/id/R.90bb9597bff6b281ea8e079c339e97d8?rik=T1yOj6l%2bhakOrw&pid=ImgRaw&r=0',
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, $username',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  email,
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          )
        ],
      ),
      trailing: justView
          ? null
          : const Icon(
              Icons.arrow_forward_rounded,
              size: 17,
            ),
    );
  }
}
