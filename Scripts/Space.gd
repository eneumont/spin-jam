extends Node2D
class_name Space

enum Type {
	START,
	FIGHT,
	ELITE_FIGHT,
	BOSS_FIGHT,
	ENCOUNTER,
	RANDOM,
	SPIN,
	TREASURE,
	TELEPORT,
	END,
	SHOP,
}

class Data:
	var tele_tp_pos: Vector3
	

var available_spaces: Array[Node2D]
var space_type: Type = Type.START
var data: int #figure class

func setup():
	pass

func activate():
	match space_type:
		Type.START:
			pass
		Type.FIGHT, Type.ELITE_FIGHT, Type.BOSS_FIGHT:
			pass
		Type.ENCOUNTER:
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
	if evt is InputEventMouseButton and evt.is_pressed():
		if PlayerData.avaiable_spaces.has(self):
			#move player to this space
			pass
