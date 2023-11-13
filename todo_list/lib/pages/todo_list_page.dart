import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma Tarefa',
                        hintText: 'Ex. Ler um livro',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff00d7f3),
                      padding: EdgeInsets.all(14),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('Você possui X tarefas pendentes'),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Limpar Tudo'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff00d7f3),
                        padding: EdgeInsets.all(14),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
