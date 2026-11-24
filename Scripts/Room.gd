extends AnimatedSprite2D
class_name Room

enum RoomType {
	DEFAULT, START, FIGHT, 
	EVENT, SPIN, TREASURE, 
	TELEPORT, END, SHOP
}

var room_type: RoomType = RoomType.DEFAULT

func set_room():
	match room_type:
		RoomType.DEFAULT:
			default()
		RoomType.START:
			start()
		RoomType.FIGHT:
			fight()
		RoomType.EVENT:
			fight()

func default():
	pass
	
func start():
	for n in get_children():
		n.visible = n.name == "Start"
	
func fight():
	pass

func event():
	pass
