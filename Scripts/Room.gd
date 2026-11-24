extends AnimatedSprite2D

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
	pass
	
func fight():
	pass

func event():
	pass
