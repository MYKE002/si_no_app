import 'package:flutter/material.dart';
import 'package:si_no_app/config/helpers/get_answer.dart';
import 'package:si_no_app/dominio/message.dart';

// Clase para que el provider notifique cuando recibamos cambios
class ChatProvider extends ChangeNotifier {
  // Instancia a la clase
  final GetAnswer getAnswer = GetAnswer();
  
  // Definir el nuevo scroll controller
  final ScrollController chatScrollController = ScrollController();

  // Lista de mensajes
  List<Message> messageList = [];

  // Mensaje remitido por mí que debe ser almacenado
  Future<void> sendMessage(String text) async {
    // Validación para evitar mensajes vacíos
    if (text.trim().isEmpty) return;

    final newMessage = Message(text: text, yooEl: YooEl.me);
    
    // Agregar el nuevo mensaje a la lista
    messageList.add(newMessage);

    // Llamar a herReply solamente si es una pregunta
    if (text.endsWith('?')) {
      herReply();
    }

    // Una vez que reciba el cambio que se actualice
    notifyListeners();
    
    // Llamar al move
    moveScrollToBottom();
  }

  // Nuevo método para tomar el mensaje de respuesta
  Future<void> herReply() async {
    final herMessage = await getAnswer.getAnswer();
    
    // Retornar message list
    messageList.add(herMessage);
    notifyListeners();
    
    // Scroll para navegar
    moveScrollToBottom();
  }

  // Función para mover el Scroll
  Future<void> moveScrollToBottom() async {
    // Esperar de forma obligatoria a efectos de una buena acción del scroll
    await Future.delayed(const Duration(milliseconds: 100));
    
    // Scroll con animación, posición, duración, curve es el tipo de animación
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    // Liberar recursos del ScrollController
    chatScrollController.dispose();
    super.dispose();
  }
}