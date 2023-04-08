extends Node2D

@onready var sprite = $FoodSprite
@onready var collect = $CollectAnimation
@onready var sound = $Powerup

func _on_area_2d_body_entered(body):
	sprite.hide()
	
	collect.show()
	collect.play("default")
	
	sound.playing = true
	
	match name:
		"Apple":
			body.effect = 1
		"Banana":
			body.effect = 2
		"Orange":
			body.effect = 3
		"Melon":
			body.effect = 0

func _on_collect_animation_animation_finished():
	queue_free()

