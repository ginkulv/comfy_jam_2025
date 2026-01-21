extends Node

signal message_shown(message: String)

var message_data: Dictionary[String, String] = {
    "1": "Example message",
}

func display_text_by_id(text_id: String) -> void:
    var message = message_data[text_id]
    message_shown.emit(message)
