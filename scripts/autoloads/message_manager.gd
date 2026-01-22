extends Node

signal message_shown(message: String)

var message_data: Dictionary[String, String] = {
    "1": "Example message",
    "2": "Привет",
    "3": "3",
    "4": "4",
    "5": "5",
    "6": "6",
    "7": "7",
    "8": "8",
    "9": "9",
    "10": "10",
    "11": "11",
}

func display_text_by_id(text_id: String) -> void:
    var message = message_data[text_id]
    message_shown.emit(message)
