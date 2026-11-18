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
	mark.assign_space(self)
	position = marker.position
	
	$Sprite.texture = load("res://Textures/Circles/" + Type.keys()[space_type].to_lower() + "_circle.png")
	$Area2D.input_event.connect(click)

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
	if evt is InputEventMouseButton and evt.is_released():
		if PlayerData.available_spaces.has(self):
			manager.move_player(position)
			PlayerData.available_spaces = marker.available_Neighbors.values().map(func(mark): return mark.space)
			if !visited:
				activate()
