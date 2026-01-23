extends Node

signal message_shown(message: String)

var message_data: Dictionary[String, String] = {
    "start": "Brrr… what a chill! And the wind! No better than out there.",
    "window_closed": "Ah, that’s better… no more snow down my collar! I grow weary of this endless winter…",
    "window_after": "Whirling snow blinds the path… no soul could find their way home in this weather.",
    "matches_not_found": "What lies beyond the windowpane?",
    "matches_found": "Matches! Now we’re getting somewhere! if only I knew what to light.",
    "lamp_lit": "Another little flame!",
    "all_lamps_lit": "Ah, now it’s properly bright! It's not any warmer than before though… my teeth are chattering.",
    "firewood_not_found": "Too high… I cannot reach there. I'm a gnome, after all!",
    "firewood_found": "Firewood is here, matches are here… and the hearth as well. What a fortunate gnome I am!",
    "key_not_found": "What’s that in the corner? I can’t make it out…",
    "key_found": "A key! How did I not see it before?",
    "ladder_not_found": "It’s locked. Surely my old eyes aren't the only ones to see it?",
    "ladder_found": "Ah, the ladder! Of course… it was in the trapdoor under the floor! So obvious!",
    "fireplace_not_lit": "The bricks inside are frozen and crusted with ice.",
    "fireplace_lit": "Ah, how warm and cozy it is now… almost like home, at last.",
    "xylophone_start": "What a delightful sound!",
    "xylophone_10th": "All of this must surely mean something…",
    "xylophone_20th": "Perhaps I should try to play a melody…?",
    "xylophone_35th": "Better listen carefully…",
    "xylophone_50th": "1… 3… 2… 3… 4… Why did that suddenly cross my mind?",
}

func display_text_by_id(text_id: String) -> void:
    var message = message_data[text_id]
    message_shown.emit(message)
