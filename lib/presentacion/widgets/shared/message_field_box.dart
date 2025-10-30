import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    // Controles para el apartado de texto
    final textController = TextEditingController();
    
    // Mantener abierto el foco, sin cerrar al terminar de escribir
    final focusNode = FocusNode();
    
    // Habilitar borde con el color deseado
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    // Se almacena todo el diseño de los iconos en un InputDecoration
    final inputDecoration = InputDecoration(
      // Hint text de message
      hintText: 'Ingrese el mensaje deseado',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      // Suffix icon send
      suffixIcon: IconButton(
        // Realizar el onPressed para que reaccione al presionar el botón
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          // Obtener el valor del texto ingresado
          final textValue = textController.value.text;
          
          // Llamar al onValue
          if (textValue.trim().isNotEmpty) {
            onValue(textValue);
            textController.clear();
          }
        },
      ),
    );

    // Return dentro del TextFormField instanciando a inputDecoration
    return TextFormField(
      // Crear funcionalidad para el onTap, al clickear afuera se minimiza
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        // Validar que no esté vacío
        if (value.trim().isNotEmpty) {
          // Valor del submit
          onValue(value);
          // Limpiar lo que se escribió
          textController.clear();
          // Después de limpiar que el foco permanezca abierto
          focusNode.requestFocus();
        }
      },
    );
  }
}