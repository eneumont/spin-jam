class_name Char extends Resource

enum Stat_Type {
	Health, Offense, Endurance,
	Utility, Luck, Mana,
}

@export var base_Stats: Dictionary = {
	Stat_Type.Health: 10,
	Stat_Type.Offense: 5,
	Stat_Type.Endurance: 5,
	Stat_Type.Utility: 5,
	Stat_Type.Luck: 3,
}

@export var bonus_Stats: Dictionary = {
	Stat_Type.Health: 0,
	Stat_Type.Offense: 0,
	Stat_Type.Endurance: 0,
	Stat_Type.Utility: 0,
	Stat_Type.Luck: 0,
}

##1 is default and 2 is unlocked through a condition
@export var spindials: Dictionary = {
	1: SpinDial.new(
	{
		1: [Vector2(0, 0), Vector2(3, 0), Vector2(6, 0)],
		2: [Vector2(0, 0), Vector2(3, 0), Vector2(6, 0)],
		3: [Vector2(0, 0), Vector2(3, 0), Vector2(6, 0)],
	}),
	2: SpinDial.new(
	{
		1: [Vector2(0, 0), Vector2(3, 0), Vector2(6, 0)],
		2: [Vector2(0, 0), Vector2(3, 0), Vector2(6, 0)],
		3: [Vector2(0, 0), Vector2(3, 0), Vector2(6, 0)],
	}),
}

class SpinDial:
	const MAX_DIAL_SLOTS := 6
	const MAX_DIALS := 5
	## dial number (max_dials): slot_number, cooldown (max_dial_slots)
	var dials := {
		1: [Vector2(0, 0), Vector2(3, 0), Vector2(6, 0)],
		2: [Vector2(0, 0), Vector2(3, 0), Vector2(6, 0)],
		3: [Vector2(0, 0), Vector2(3, 0), Vector2(6, 0)],
	}
	
	## 0-2: Attack, 3-5: Heal, 6-8: Guard, 9-11: Regen, 12-14: Block, 15-17: Two-Hit, 18-20: Three Hit, 21-23: Aoe
	enum Slot_Icon {
		Light_Attack, Moderate_Attack, Heavy_Attack,
		Light_Heal, Moderate_Heal, Heavy_Heal,
		Light_Guard, Moderate_Guard, Heavy_Guard,
		Light_Regen, Moderate_Regen, Heavy_Regen,
		Light_Block, Moderate_Block, Heavy_Block,
		Light_TwoHit, Moderate_TwoHit, Heavy_TwoHit,
		Light_ThreeHit, Moderate_ThreeHit, Heavy_ThreeHit,
		Light_Aoe, Moderate_Aoe, Heavy_Aoe,
	}
	
	enum Combo_Effect {
		Struggle,
		Attack,
		TwoHit,
		ThreeHit,
		Aoe,
		Heal,
		Regen,
		Guard,
		Block,
		Vamp,
		Counter,
		Absorb,
		Bomb,
		Reflect,
		Pulse,
		MultiHit,
	}
	
	## 1,2,3: lgt,mod,hvy 0: struggle [br]effect, degree
	func combo_result(slots: Array) -> Array:
		if slots.count(slots[0]) == slots.size():
			var stringSlot: String = Slot_Icon.keys()[slots[0]]
			##will return error if doesn't receive Light/Moderate/Heavy
			var degree: int = 1 if stringSlot.get_slice("_", 0) == "Light" else 2 if stringSlot.get_slice("_", 0) == "Moderate" else 3
			var effect := stringSlot.get_slice("_", 1)
			
			return [effect, degree]
		
		match slots.size():
			3:
				pass
			4:
				pass
			5:
				pass
				
		return [Combo_Effect.Struggle, 0]
	
	func _init(start_dials: Dictionary) -> void:
		dials = start_dials
