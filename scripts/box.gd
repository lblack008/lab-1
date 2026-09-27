class_name Box extends Sprite2D
#здоровье одного ящика
@export var health : int = 100

#получение урона при столкновении с пулей (как игрока, так и вражеской)
func take_damage(damage: int) -> void:
	health -= damage
	
	#если здоровье меньше 0 - объект пропадает с поля
	if health <= 0:
		queue_free()
