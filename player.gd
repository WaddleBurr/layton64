extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	var spring=get_node("/root/World/SpringArm3D")
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_pressed("camleft"):
		spring.rotation.y+=.1
	if Input.is_action_pressed("camright"):
		spring.rotation.y-=.1
	if Input.is_action_pressed("camup"):
		spring.rotation.x-=.1
	if Input.is_action_pressed("camdown"):
		spring.rotation.x+=.1
	if Input.is_action_pressed("camzoomin"):
		spring.spring_length-=.1
		spring.shape.length-=.1
	if Input.is_action_pressed("camzoomout"):
		spring.spring_length+=.1
		spring.shape.length+=.1

	if spring.rotation.y > deg_to_rad(360):
		spring.rotation.y=0
	if spring.rotation.y < deg_to_rad(-360):
		spring.rotation.y=0
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("right", "left", "backward", "forward")
	if spring.position.x < self.position.x:
		if spring.position.x > self.position.x+.5:
			spring.position.x=self.position.x
		else:
			spring.position.x+=.05
			if spring.position.x < self.position.x-5:
				spring.position.x-=.05
	if spring.position.x > self.position.x:
		if spring.position.x < self.position.x-.5:
			spring.position.x=self.position.x
		else:
			spring.position.x-=.05
			if spring.position.x > self.position.x+5:
				spring.position.x-=.05
	if spring.position.y < self.position.y:
		if spring.position.y > self.position.y+.5:
			spring.position.y=self.position.y
		else:
			spring.position.y+=.05
			if spring.position.y < self.position.y-5:
				spring.position.y+=.05
	if spring.position.y > self.position.y:
		if spring.position.y < self.position.y-.5:
			spring.position.y=self.position.y
		else:
			spring.position.y-=.05
			if spring.position.y > self.position.y+5:
				spring.position.y-=.05
	if spring.position.z < self.position.z:
		if spring.position.z > self.position.z+.5:
			spring.position.z=self.position.z
		else:
			spring.position.z+=.05
			if spring.position.z < self.position.z-5:
				spring.position.z+=.05
	if spring.position.z > self.position.z:
		if spring.position.z < self.position.z-.5:
			spring.position.z=self.position.z
		else:
			spring.position.z-=.05
			if spring.position.z > self.position.z+5:
				spring.position.z-=.05
	if rotation.y < spring.rotation.y:
		rotation.y-=.01
	if rotation.y > spring.rotation.y:
		rotation.y+=.01
	rotation.y = spring.rotation.y+135
	var direction := ((transform.basis * Vector3(input_dir.x, 0, input_dir.y))).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		#$Luke2/Armature/Skeleton3D/Luke.rotation.x=direction.x
		velocity.z = direction.z * SPEED
		if Input.is_action_pressed("right"):
			$Luke2/Armature/Skeleton3D/Luke.rotation.y=deg_to_rad(270)
			if Input.is_action_pressed("forward"):
				$Luke2/Armature/Skeleton3D/Luke.rotation.y=deg_to_rad(315)
			elif Input.is_action_pressed("backward"):
				$Luke2/Armature/Skeleton3D/Luke.rotation.y=deg_to_rad(225)
		elif Input.is_action_pressed("left"):
			$Luke2/Armature/Skeleton3D/Luke.rotation.y=deg_to_rad(90)
			if Input.is_action_pressed("forward"):
				$Luke2/Armature/Skeleton3D/Luke.rotation.y=deg_to_rad(45)
			elif Input.is_action_pressed("backward"):
				$Luke2/Armature/Skeleton3D/Luke.rotation.y=deg_to_rad(135)

		elif Input.is_action_pressed("forward"):
			$Luke2/Armature/Skeleton3D/Luke.rotation.y=deg_to_rad(0)
		elif Input.is_action_pressed("backward"):
			$Luke2/Armature/Skeleton3D/Luke.rotation.y=deg_to_rad(180)
		else:
			$Luke2/Armature/Skeleton3D/Luke.rotation.y=-direction.z*1.5+rad_to_deg(90)
		$Luke2/AnimationPlayer.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
