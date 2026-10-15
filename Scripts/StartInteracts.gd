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

func ready():
	#could define funcs in the connects since they're single use
	$Area2D.mouse_entered.connect(playAnim("play"))
	$Area2D.mouse_exited.connect(playAnim("idle"))
	$Area2D.input_event.connect(click)

##should have two animations idle, mouse hover
func playAnim(a_name: String):
	play(a_name)

func click(view: Node, evt: InputEvent, shape: int):
	print("works")
