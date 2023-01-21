# A simple platform that follows a path.

extends Node3D

@onready var pathFollow: PathFollow3D = $Path3D/PathFollow3D

var speed: float = 0.25
var direction: float = 1 # 1 or -1, used to know which way the platform should be moving

func _physics_process(delta: float) -> void:
	pathFollow.progress_ratio += speed * delta * direction # Move up the path
	
	# If we've hit the end of the path, reverse direction
	if pathFollow.progress_ratio >= 1 or pathFollow.progress_ratio <= 0:
		direction *= -1
