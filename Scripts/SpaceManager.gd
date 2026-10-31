extends Node2D

var space_scn: PackedScene = preload("res://Scenes/Space.tscn")
var player_scn: PackedScene = preload("res://Scenes/PlayerSpace.tscn")

var teleport : bool = false

func _ready() -> void:
	set_marker_neighbors()
	if PlayerData.tutorial: setup_tutorial() 
	else: setup()
	
	PlayerData.avaiable_spaces = $Markers/Mark4.available_Neighbors.values()
	
	var player = player_scn.instantiate()
	add_child(player)
	player.position = $Markers/Mark4.position

#this is dumb, do better than this...
#I'm bout to do the dumbest thing... nevermind...
func set_marker_neighbors() -> void:
	$Markers/Mark1.Neighbors = {
		Marker.Dir.UP: $Markers/Mark7,
		Marker.Dir.DOWN: $Markers/Mark2,
		Marker.Dir.LEFT: $Markers/Mark22,
		Marker.Dir.RIGHT: $Markers/Mark16,
	}
	
	$Markers/Mark2.Neighbors = {
		Marker.Dir.UP: $Markers/Mark1,
		Marker.Dir.DOWN: $Markers/Mark3,
		Marker.Dir.LEFT: $Markers/Mark21,
		Marker.Dir.RIGHT: $Markers/Mark15,
	}
	
	$Markers/Mark3.Neighbors = {
		Marker.Dir.UP: $Markers/Mark2,
		Marker.Dir.DOWN: $Markers/Mark4,
		Marker.Dir.LEFT: $Markers/Mark17,
		Marker.Dir.RIGHT: $Markers/Mark14,
	}
	
	$Markers/Mark4.Neighbors = {
		Marker.Dir.UP: $Markers/Mark8,
		Marker.Dir.DOWN: $Markers/Mark18,
		Marker.Dir.LEFT: $Markers/Mark3,
		Marker.Dir.RIGHT: $Markers/Mark5,
		Marker.Dir.UL: $Markers/Mark14,
		Marker.Dir.UR: $Markers/Mark11,
		Marker.Dir.DL: $Markers/Mark17,
		Marker.Dir.DR: $Markers/Mark20,
	}
	
	$Markers/Mark5.Neighbors = {
		Marker.Dir.UP: $Markers/Mark4,
		Marker.Dir.DOWN: $Markers/Mark6,
		Marker.Dir.LEFT: $Markers/Mark11,
		Marker.Dir.RIGHT: $Markers/Mark20,
	}
	
	$Markers/Mark6.Neighbors = {
		Marker.Dir.UP: $Markers/Mark5,
		Marker.Dir.DOWN: $Markers/Mark7,
		Marker.Dir.LEFT: $Markers/Mark12,
		Marker.Dir.RIGHT: $Markers/Mark19,
	}
	
	$Markers/Mark7.Neighbors = {
		Marker.Dir.UP: $Markers/Mark6,
		Marker.Dir.DOWN: $Markers/Mark1,
		Marker.Dir.LEFT: $Markers/Mark13,
		Marker.Dir.RIGHT: $Markers/Mark25,
	}
	
	$Markers/Mark8.Neighbors = {
		Marker.Dir.UP: $Markers/Mark9,
		Marker.Dir.DOWN: $Markers/Mark4,
		Marker.Dir.LEFT: $Markers/Mark14,
		Marker.Dir.RIGHT: $Markers/Mark11,
	}
	
	$Markers/Mark9.Neighbors = {
		Marker.Dir.UP: $Markers/Mark10,
		Marker.Dir.DOWN: $Markers/Mark8,
		Marker.Dir.LEFT: $Markers/Mark15,
		Marker.Dir.RIGHT: $Markers/Mark12,
	}
	
	$Markers/Mark10.Neighbors = {
		Marker.Dir.UP: $Markers/Mark23,
		Marker.Dir.DOWN: $Markers/Mark9,
		Marker.Dir.LEFT: $Markers/Mark16,
		Marker.Dir.RIGHT: $Markers/Mark13,
	}
	
	$Markers/Mark11.Neighbors = {
		Marker.Dir.UP: $Markers/Mark12,
		Marker.Dir.DOWN: $Markers/Mark4,
		Marker.Dir.LEFT: $Markers/Mark8,
		Marker.Dir.RIGHT: $Markers/Mark5,
	}
	
	$Markers/Mark12.Neighbors = {
		Marker.Dir.UP: $Markers/Mark13,
		Marker.Dir.DOWN: $Markers/Mark11,
		Marker.Dir.LEFT: $Markers/Mark9,
		Marker.Dir.RIGHT: $Markers/Mark6,
	}
	
	$Markers/Mark13.Neighbors = {
		Marker.Dir.UP: $Markers/Mark22,
		Marker.Dir.DOWN: $Markers/Mark12,
		Marker.Dir.LEFT: $Markers/Mark10,
		Marker.Dir.RIGHT: $Markers/Mark7,
	}
	
	$Markers/Mark14.Neighbors = {
		Marker.Dir.UP: $Markers/Mark15,
		Marker.Dir.DOWN: $Markers/Mark4,
		Marker.Dir.LEFT: $Markers/Mark3,
		Marker.Dir.RIGHT: $Markers/Mark8,
	}
	
	$Markers/Mark15.Neighbors = {
		Marker.Dir.UP: $Markers/Mark16,
		Marker.Dir.DOWN: $Markers/Mark14,
		Marker.Dir.LEFT: $Markers/Mark2,
		Marker.Dir.RIGHT: $Markers/Mark9,
	}
	
	$Markers/Mark16.Neighbors = {
		Marker.Dir.UP: $Markers/Mark25,
		Marker.Dir.DOWN: $Markers/Mark15,
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark10,
	}
	
	$Markers/Mark17.Neighbors = {
		Marker.Dir.UP: $Markers/Mark4,
		Marker.Dir.DOWN: $Markers/Mark21,
		Marker.Dir.LEFT: $Markers/Mark18,
		Marker.Dir.RIGHT: $Markers/Mark3,
	}
	
	$Markers/Mark18.Neighbors = {
		Marker.Dir.UP: $Markers/Mark4,
		Marker.Dir.DOWN: $Markers/Mark24,
		Marker.Dir.LEFT: $Markers/Mark20,
		Marker.Dir.RIGHT: $Markers/Mark17,
	}
	
	$Markers/Mark19.Neighbors = {
		Marker.Dir.UP: $Markers/Mark20,
		Marker.Dir.DOWN: $Markers/Mark25,
		Marker.Dir.LEFT: $Markers/Mark6,
		Marker.Dir.RIGHT: $Markers/Mark24,
	}
	
	$Markers/Mark20.Neighbors = {
		Marker.Dir.UP: $Markers/Mark4,
		Marker.Dir.DOWN: $Markers/Mark19,
		Marker.Dir.LEFT: $Markers/Mark5,
		Marker.Dir.RIGHT: $Markers/Mark18,
	}
	
	$Markers/Mark21.Neighbors = {
		Marker.Dir.UP: $Markers/Mark17,
		Marker.Dir.DOWN: $Markers/Mark22,
		Marker.Dir.LEFT: $Markers/Mark24,
		Marker.Dir.RIGHT: $Markers/Mark2,
	}
	
	$Markers/Mark22.Neighbors = {
		Marker.Dir.UP: $Markers/Mark21,
		Marker.Dir.DOWN: $Markers/Mark13,
		Marker.Dir.LEFT: $Markers/Mark23,
		Marker.Dir.RIGHT: $Markers/Mark1,
	}
	
	$Markers/Mark23.Neighbors = {
		Marker.Dir.UP: $Markers/Mark24,
		Marker.Dir.DOWN: $Markers/Mark10,
		Marker.Dir.LEFT: $Markers/Mark25,
		Marker.Dir.RIGHT: $Markers/Mark22,
	}
	
	$Markers/Mark24.Neighbors = {
		Marker.Dir.UP: $Markers/Mark18,
		Marker.Dir.DOWN: $Markers/Mark23,
		Marker.Dir.LEFT: $Markers/Mark19,
		Marker.Dir.RIGHT: $Markers/Mark21,
	}
	
	$Markers/Mark25.Neighbors = {
		Marker.Dir.UP: $Markers/Mark19,
		Marker.Dir.DOWN: $Markers/Mark16,
		Marker.Dir.LEFT: $Markers/Mark7,
		Marker.Dir.RIGHT: $Markers/Mark23,
	}

#set markers avaiable neighbors to specific path and set specific spaces
func setup_tutorial():
	#tutorial spaces
	var mark = $Markers/Mark4
	create_space(Space.Type.START, Space.Data.new(), mark)
	mark.available_Neighbors = {
		Marker.Dir.UP: $Markers/Mark8,
		Marker.Dir.UR: $Markers/Mark11,
		Marker.Dir.RIGHT: $Markers/Mark5,
		Marker.Dir.DR: $Markers/Mark20
	}
	
	mark = $Markers/Mark8
	create_space(Space.Type.EVENT, Space.Data.new(), mark)
	mark.available_Neighbors = {
		Marker.Dir.RIGHT: $Markers/Mark11,
		Marker.Dir.DOWN: $Markers/Mark4
	}
	
	mark = $Markers/Mark11
	create_space(Space.Type.FIGHT, Space.Data.new(), mark)
	mark.available_Neighbors = {
		Marker.Dir.DOWN: $Markers/Mark4,
		Marker.Dir.LEFT: $Markers/Mark8,
		Marker.Dir.RIGHT: $Markers/Mark5
	}
	
	mark = $Markers/Mark5
	create_space(Space.Type.RANDOM, Space.Data.new(), mark)
	mark.available_Neighbors = {
		Marker.Dir.UP: $Markers/Mark4,
		Marker.Dir.RIGHT: $Markers/Mark20,
		Marker.Dir.LEFT: $Markers/Mark11,
	}
	
	mark = $Markers/Mark20
	create_space(Space.Type.SPIN, Space.Data.new(), mark)
	mark.available_Neighbors = {
		Marker.Dir.UP: $Markers/Mark4,
		Marker.Dir.DOWN: $Markers/Mark19,
		Marker.Dir.LEFT: $Markers/Mark5
	}
	
	mark = $Markers/Mark19
	create_space(Space.Type.END, Space.Data.new(), mark)
	mark.available_Neighbors = {
		Marker.Dir.UP: $Markers/Mark20,
		Marker.Dir.RIGHT: $Markers/Mark24
	}
	
	mark = $Markers/Mark24
	create_space(Space.Type.TELEPORT, Space.Data.new(), mark)
	mark.available_Neighbors = {
		Marker.Dir.LEFT: $Markers/Mark19
	}
	
	mark = $Markers/Mark1
	create_space(Space.Type.TELEPORT, Space.Data.new(), mark)
	mark.available_Neighbors = {
		Marker.Dir.RIGHT: $Markers/Mark16
	}
	
	mark = $Markers/Mark16
	create_space(Space.Type.TREASURE, Space.Data.new(), mark)
	mark.available_Neighbors = {
		Marker.Dir.LEFT: $Markers/Mark1,
		Marker.Dir.RIGHT: $Markers/Mark10
	}
	
	mark = $Markers/Mark10
	create_space(Space.Type.SHOP, Space.Data.new(), mark)
	mark.available_Neighbors = {
		Marker.Dir.LEFT: $Markers/Mark16
	}
	
	#empty spaces
	mark = $Markers/Mark13
	create_space(Space.Type.BOSS_FIGHT, Space.Data.new(), mark)
	
	mark = $Markers/Mark7
	create_space(Space.Type.BOSS_FIGHT, Space.Data.new(), mark)
	
	mark = $Markers/Mark25
	create_space(Space.Type.BOSS_FIGHT, Space.Data.new(), mark)
	
	mark = $Markers/Mark23
	create_space(Space.Type.BOSS_FIGHT, Space.Data.new(), mark)
	
	mark = $Markers/Mark22
	create_space(Space.Type.BOSS_FIGHT, Space.Data.new(), mark)
	
	mark = $Markers/Mark21
	create_space(Space.Type.BOSS_FIGHT, Space.Data.new(), mark)
	
	mark = $Markers/Mark2
	create_space(Space.Type.BOSS_FIGHT, Space.Data.new(), mark)
	
	mark = $Markers/Mark15
	create_space(Space.Type.BOSS_FIGHT, Space.Data.new(), mark)
	
	mark = $Markers/Mark9
	create_space(Space.Type.BOSS_FIGHT, Space.Data.new(), mark)
	
	mark = $Markers/Mark12
	create_space(Space.Type.BOSS_FIGHT, Space.Data.new(), mark)
	
	mark = $Markers/Mark6
	create_space(Space.Type.BOSS_FIGHT, Space.Data.new(), mark)
	
	mark = $Markers/Mark18
	create_space(Space.Type.BOSS_FIGHT, Space.Data.new(), mark)
	
	mark = $Markers/Mark17
	create_space(Space.Type.BOSS_FIGHT, Space.Data.new(), mark)
	
	mark = $Markers/Mark3
	create_space(Space.Type.BOSS_FIGHT, Space.Data.new(), mark)
	
	mark = $Markers/Mark14
	create_space(Space.Type.BOSS_FIGHT, Space.Data.new(), mark)

func setup():
	pass

func create_space(type: Space.Type, data: Space.Data, mark: Node):
	var new_space = space_scn.instantiate()
	$Spaces.add_child(new_space)
	new_space.setup(type, data, mark)
	new_space.manager = self

func move_player(new_pos: Vector2):
	create_tween().tween_property($PlayerSpace, "position", new_pos, 1)
