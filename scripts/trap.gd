class_name Trap extends Polygon2D

#урон при взаимодействии с объектом
@export var contact_damage : int = 10

#нанесение урона объекту, если это возможно
func _on_area_2d_area_entered(area: Area2D) -> void:
	var object = area.get_parent()

	if object.has_method("take_damage"):
		object.take_damage(contact_damage)
