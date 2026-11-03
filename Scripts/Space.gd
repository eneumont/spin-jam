extends Node2D
class_name Space

enum Type {
	START,
	FIGHT, ELITE_FIGHT, BOSS_FIGHT,
	EVENT, RANDOM, SPIN, TREASURE,
	TELEPORT, END, SHOP,
}

class Data:
	var tele_tp_pos: Vector3
	
	func _init() -> void:
		pass
	
var space_type: Type
var data: Data

var marker: Marker
var visited: bool = false

var manager

func setup(type: Type, new_data: Data, mark: Marker):
	space_type = type
	data = new_data
	marker = mark
	position = marker.position
	
	$Sprite.texture = load("res://Textures/Circles/" + Type.keys()[space_type].to_lower() + "_circle.png")
	print(get_signal_connection_list("input_event"))
	$Area2D.input_event.connect(click)
	print(get_signal_connection_list("input_event"))

func activate():
	visited = true 
	
	match space_type:
		Type.START:
			pass
		Type.FIGHT, Type.ELITE_FIGHT, Type.BOSS_FIGHT:
			pass
		Type.EVENT:
			pass
		Type.RANDOM:
			pass
		Type.SPIN:
			pass
		Type.TREASURE:
			pass
		Type.TELEPORT:
			pass
		Type.END:
			pass
		Type.SHOP:
			pass

func fight():
	pass

func click(view: Node, evt: InputEvent, idx: int):
	print("click")
	if evt is InputEventMouseButton and evt.is_released():
		print("click1")
		if PlayerData.avaiable_spaces.has(self):
			print("click2")
			manager.move_player(position)
			PlayerData.avaiable_spaces = marker.available_Neighbors.values()
			if !visited:
				print("click3")
				activate()
