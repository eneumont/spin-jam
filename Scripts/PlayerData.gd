extends Node

var avaiable_spaces: Array[Node2D]
var spins: Dictionary

var rounds: int = 0

var cur_slot: int = 0

var tutorial: bool = true

var copy: bool = false

## 1 - new hire 2 - senior 3 - clown
var main_char: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func save_data() -> Dictionary:
	return {
		
	}
	
func load_data(data: Dictionary):
	pass

func reset_data():
	pass
