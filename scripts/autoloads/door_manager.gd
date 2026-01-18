extends Node

var doors := {}

func register(door):
    doors[door.door_id] = door

func allow_door(door_id : int):
    if doors.has(door_id):
        doors[door_id].is_allowed_to_open = true
