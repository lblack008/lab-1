class_name Bullet extends Sprite2D

#переменнаяя скорости полёта пули
@export var speed_of_flight : int = 2000

#заглушка
func _ready() -> void:
	pass

#функция для направления полёта пули
func _process(delta: float) -> void:
	position += Vector2.UP.rotated(rotation + PI/2) * speed_of_flight * delta 

#функция удаления пули из сцены при столкновении с коллизией
func on_area_2d_area_entered(area: Area2D) -> void:
	self.queue_free()
