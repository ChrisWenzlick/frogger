extends CharacterBody2D

var direction: Vector2 = Vector2(1,0)
var speed: int = 200

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down");
	velocity = direction * speed
	animate()
	move_and_slide()

func animate():
	if direction:
		if abs(direction.x) > abs(direction.y):
			$AnimatedSprite2D.flip_h = direction.x > 0
			$AnimatedSprite2D.play("left")
		elif direction.y < 0:
			$AnimatedSprite2D.play("up")
		else:
			$AnimatedSprite2D.play("down")
	else:
		$AnimatedSprite2D.frame = 0
