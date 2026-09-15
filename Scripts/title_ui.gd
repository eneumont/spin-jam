extends Control

@export var title: Panel
@export var options: Panel
@export var saves: Panel

var screens =[
	title,
	options,
	saves
]

func _ready() -> void:
	pick_screen(0)

func play_click():
	pick_screen(1)

func options_click():
	pick_screen(2)
	
func quit_click():
	get_tree().quit()

## 0 - title, 1 - options, 2 - saves
func pick_screen(select: int):
	for i in screens.size() - 1:
		screens[i].visible = true if i == select else false
