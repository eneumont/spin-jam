extends Control

var screens: Array
var cur_scr := 0

func _ready() -> void:
	screens = [
		$Confirm,
		$Welcome,
		$FirstInfo,
	]
	
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

func pause():
	get_tree().paused = !get_tree().paused
