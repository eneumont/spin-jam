extends AnimatedSprite2D

enum Type {
	NewHire,
	Senior,
	Clown,
	StartDoor,
	Upgrades,
	Loadout,
}

@export var type: Type

func _ready():
	#could define funcs in the connects since they're single use
	$Area2D.mouse_entered.connect(playAnim.bind("play"))
	$Area2D.mouse_exited.connect(playAnim.bind("idle"))
	$Area2D.input_event.connect(click)

##should have two animations idle, mouse hover
func playAnim(a_name: String):
	play(a_name)

func click(view: Node, evt: InputEvent, shape: int):
	if evt is InputEventMouseButton:
		if evt.is_released():
			match (type):
				Type.NewHire:
					PlayerData.main_char = 1
				Type.Senior:
					PlayerData.main_char = 2
				Type.Clown:
					PlayerData.main_char = 3
				Type.StartDoor:
					if PlayerData.main_char != 0:
						#do other setup stuff
						get_tree().change_scene_to_file("res://Scenes/Levels/Main.tscn")
				Type.Upgrades:
					pass
				Type.Loadout:
					pass
