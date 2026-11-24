extends Control

var screens: Array
var cur_scr := 0

@onready var map = $"../../SpaceManager"
@onready var room = $"../../Backgrounds/Room"

func _ready() -> void:
	screens = [
		$Confirm,
		$Welcome,
		$FirstInfo,
	]
	
	map.create()
	
	map_pause(true)
	room_pause(true)
	
	for s in screens.size():
		if s == cur_scr: screens[s].visible = true
		else: screens[s].visible = false
	
func skip():
	PlayerData.tutorial = false
	get_tree().change_scene_to_file("res://Scenes/Levels/Start.tscn")

func next():
	cur_scr += 1
	for s in screens.size():
		if s == cur_scr: screens[s].visible = true
		else: screens[s].visible = false

func doRoom(room: bool = true, pause: bool = true):
	screens[cur_scr].visible = !screens[cur_scr].visible
	if room:
		room_pause(pause)
	else:
		map_pause(pause)	

func pause():
	get_tree().paused = !get_tree().paused

func room_pause(pause: bool = true):
	room.process_mode = Node.PROCESS_MODE_DISABLED if pause else Node.PROCESS_MODE_INHERIT
	
func map_pause(pause: bool = true):
	map.process_mode = Node.PROCESS_MODE_DISABLED if pause else Node.PROCESS_MODE_INHERIT
