extends Button

@export var slot: int = 1
@export var confirm_menu: Panel

var empty: bool = true

func _ready() -> void:
	empty = !FileAccess.file_exists("user://saves/save_" + str(slot) + ".json")
	design()

func design():
	$HBox.visible = !empty
	text = "Save" + str(slot) if !empty else "New Game"

func play():
	if PlayerData.copy:
		if await confirm():
			SaveManager.save_game(slot, SaveManager.load_game(PlayerData.cur_slot))
			empty = false
			design()
		PlayerData.copy = !PlayerData.copy
		return
	
	PlayerData.cur_slot = slot
	if !empty: PlayerData.load_data(SaveManager.load_game(slot))
	if PlayerData.tutorial: get_tree().change_scene_to_file("res://Scenes/Levels/Tutorial.tscn")
	else: get_tree().change_scene_to_file("res://Scenes/Levels/Start.tscn")

##work on this
func confirm():
	var affirm := false
	var yesclick = func():
		affirm = true
		
	var noclick = func():
		affirm = false
	
	confirm_menu.visible = true
	confirm_menu.get_node("yesBtn").connect("button_up", yesclick)
	confirm_menu.get_node("noBtn").connect("button_up", noclick)
	get_tree().paused = true
	
	#TODO -> dont execute next step til either button is pressed
	
	confirm_menu.visible = false
	get_tree().paused = false
	return affirm
	
func copy():
	PlayerData.copy = !PlayerData.copy
	if PlayerData.copy: PlayerData.cur_slot = slot

func delete():
	if PlayerData.copy: return
	
	if await confirm():
		SaveManager.delete_save(slot)
		empty = true
		design()
