class_name Bullet extends Sprite2D

#скорость полёта пули
@export var speed_of_flight : int = 2000
#урон, наносимый пулей
@export var damage : int = 10

#настройка направления полёта пули
func _process(delta: float) -> void:
	position += Vector2.UP.rotated(rotation + PI/2) * speed_of_flight * delta 

#взаимодействие пули с другими объектами на уровне
func _on_area_2d_area_entered(area: Area2D) -> void:
	var object = area.get_parent()

	#нанесение урона объекту, если это возможно
	if object.has_method("take_damage"):
		object.take_damage(damage)
		queue_free()
