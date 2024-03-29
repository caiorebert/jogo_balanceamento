extends Node

@export var mob_scene: PackedScene
var score

func _ready():
	new_game() # Replace with function body.

func _process(delta):
	pass
	
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	$StartTimer.start()	
	score = 0

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	
func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	
	mob.position = $MobSpawn.global_position

	mob.velocity.x = -100

	add_child(mob)


func _on_score_timer_timeout():
	pass # Replace with function body.
