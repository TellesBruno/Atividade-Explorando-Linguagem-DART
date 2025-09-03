
import 'dart:io';
import 'Task.dart';

void printTaskList(List<Task> tasks) {

	if (tasks.isEmpty) {
		print('Nenhuma tarefa cadastrada.');
		return;
	}

	print('\nTarefas cadastradas:');
  tasks.forEach((element) => print('${element}'));
}

void main() {
  List<Task> tasks = [];
  print('--- Gerenciador de Tarefas ---');
  while (true) {

    stdout.write('Digite a descrição da tarefa (ou "sair" para finalizar): ');

    String? descriptionInput = stdin.readLineSync();

    if (descriptionInput == null || descriptionInput.trim().toLowerCase() == 'sair') {
      break;
    }

    if (descriptionInput.trim().isEmpty) {
      print('Descrição não pode ser vazia.');
      continue;
    }

    bool isCompleted = false;
    while (true) {
      stdout.write('A tarefa já está concluída? (s/n): ');

      String? completedInput = stdin.readLineSync();

      if (completedInput == null) {
        print('Por favor, responda com s ou n.');
        continue;
      }

      String resp = completedInput.trim().toLowerCase();

      if (resp == 's') {
        isCompleted = true;
        break;
      } else if (resp == 'n') {
        isCompleted = false;
        break;
      } else {
        print('Por favor, responda com s ou n.');
      }
    }

    var task = Task(descriptionInput.trim());

    if (isCompleted) task.setConclusion();

    tasks.add(task);
    
    print('Tarefa adicionada!');
  }

  printTaskList(tasks);
}