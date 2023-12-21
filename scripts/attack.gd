extends Area2D

signal hit_enemy

const SPEED := 400

var velocity := Vector2.ZERO
var direction := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	const path = "res://assets/tipo_attack1.png";
	var image = preload(path)
	$Sprite2D.texture = image

func set_direction(dir:int):
	direction = dir

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += delta * SPEED * direction


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	queue_free()
