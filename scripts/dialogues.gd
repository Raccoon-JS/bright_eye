extends Node

onready var g = get_parent().get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	if g.get_name() == "prologue":
		var center = 450
		g.write("BRIGHT EYES", null, Vector2(center,100), Vector2(0.7,0.7))
		g.write("black felien corps", null, Vector2(center,320), Vector2(.9,.9))
		g.write("\"we cach big fishs\"", null, Vector2(center,320), Vector2(.9,.9))
		g.write("board meatn topic - we rn out uv money 4 cachn big fishs in n deap s.", null, Vector2(center,660), null)
		g.write("Tom","we nid money 4 teh bigur fish.",Vector2(center,1000),null)
		g.write("Thom","ho dew we dew so?", Vector2(center,1320),null)
		g.write("Tommy","first, we nid 2 build n inteligent eyebol 4 evuri ndroid.", Vector2(center,1640), null)
		g.write("Thomas","fntastic!", Vector2(center, 1980), null)
		g.write("Tom", "i jus hirid an hundrid uv scentists 2 develop dis inteligent eyebol.", Vector2(center, 2320), null)
		g.write("Thom","they r putng dis eyebol in n intense hel.", Vector2(center, 2650), null)
		g.write("Tommy","let sea hao it gos.", Vector2(center, 2650), null)
		g.write("Thomas", "i em grabn mai popcourn.", Vector2(center, 2930), null)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
