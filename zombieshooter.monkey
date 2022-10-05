
        'Libraries and globals
Import mojo  ' imports mojo inbulit functions
Import brl  'imports brl inbulit functions
Import OS 'imports os modules inbulit functions
Global Game:Game_app'
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Main program starts here:
Function Main ()
	Game = New Game_app
	
End
Global names:String[11]
	Global playerscores:Int[11]
'All game code goes here:
Class Game_app Extends App
	Field level_3:Level3 'level_3 is set to the Class Level3
	Field level_2:Level2 'level_2 is set to the Class Level2
	Field level_1:Level 'level_1 is set to the Class Level1
	Field menubackground:Image    ' field;intialisates variables as a image=
	Field menubackground_2:Image ' Instialises the variable as a image  (this is the 2nd menu background which will switch witth the first 1")
	Field scaryface:Image 'scaryface is set to the datatype image
	Field scaryface2:Image 'scaryface2 is set to the datatype image
	Field helpbackground:Image  'help background is set to image
	Field background_1:Image'Level 1 background is set to data type image
	Field background_2:Image 'level2 background is set to data type image
	Field background_3:Image'level 3  background is set to data type image
	Field namebackground:Image' name bacgkround is set to data type image
	Field Game_Over:Image 'game over is set to data type image
	Field Level_Completion:Image 'level_completion is set to data type image
	Field Level_Completion2:Image 'level 2 level completion is set to data type image
	Field player:Character 'player is set to the class Character
	Field characters:Image 'characters is set to the data type image 
	Field boss:Boss_Zombie ' boss is  set to the class boss zombie
	Field boss_level2:Necromancer 'boss_level 2 is set to class Necromancer
	Field boss_level3:Zombie_King 'boss_level 3 is set to the class Zombie _King
	Field minion_collection:List<minion> 'Minion_collection is set to a the list class minion
	Field Boss_Hp:Int ' Boss hp is set to a integer 
	Field Zombie_Hp:int
	Field bullet_time:Int
	Field bullet_fire:Bool=False
	Field enemy_collection:List<Zombie> 'enemy_collection is set to a list of the class Zombie
	Field strongzombie_collection:List<Strong_Zombie>' Zombie level 2 list
	Field missile_collection: List<Bullets> 'sets up a new list
	Field missile_collection2: List<Bullets2> ' list for bullets when shooting left
	Field bossmissile_collection: List<Boss_Bullets> ' Boss gun list
	Field brutalzombie_collection:List<Brutal_Zombie>' Zombie level 3 list
	Field zombieclaw_collection:List<Zombie_Claw>
	Field speed_powerup:List<Speed> 'speed_powerup is set to a list of the speed class
	Field gun:Sound 'gun is set to the data type sound
	Field powerup:Sound 'powerup is set to the data type sound
	Field ray_gun:Sound 'ray_gun is set to the data type sound
	Field menu_music:Sound 'menu_music  is set to the data type sound
	Field zombie_death:Sound 'zombie_death is set to the data type sound
	Field level_completion:Sound 'level_completion  is set to the data type sound
	Field death:Sound 'death is set to the data type sound
	Field hurt:Sound 'player injured sound
	Field minion_death:Sound 'minion_death is set to the data type sound
	Field minion_spawn:Sound 'minion_spawn is set to the data type sound
	Field level3_music:Sound 'level3_music is set to the data type sound
	Field level2_music:Sound  'level2_music is set to the data type sound
	Field level1_music:Sound  'level1_music is set to the data type sound
	Field boss_move:Bool=True 'boss_move is set to a boolean and is set to True
	Field new_minion:Bool=True  'new_minion is set to a boolean and is set to True
	Field new_claw:Bool=True 'new_claw is set to a boolean and is set to True
	Field health:Int  'health is set to a integer
	Field score:Int 'score is set to a integer
	Field timer:Int  'timer is set to a integer
	Field count:Int 'count is set to a integer
	Field time:Int  'time is set to a integer
	Field time2:Int 'time2 is set to a integer
	Field counter:Int 'counter is set to a integer
	Field number:Int  'number is set to a integer

	Const purple_tile=1 'purple tile is set as a constant equal to 1
	Const red_tile=2 'red tile is set to the constant 2
	Field Game_Completion:Image 'Game_Completion is set to a image
	Field Heart:Image 'heart is set to a image
	Field healthbar_9:Image 'healthbar_9 is set to a image
	Field healthbar_7:Image'healthbar_7 is set to a image
	Field healthbar_5:Image'healthbar_5 is set to a image
	Field healthbar_3:Image'healthbar_3 is set to a image
	Field healthbar_1:Image 'healthbar_1 is set to a image
	Field bullet_count:Int  'bullet_count is set to integer
	Field text:String=" ENTER YOUR NAME:" 'string shown when entering name
	Field result:String="" ' empty string
	Field maxChars:Int=16 ' maximum characters allowed
	Field score_and_name:Bool=False 'score and name is set to the data type boolean and set as false
	Field LeaderBoard:Image 'Leaderboard is set to the datatype image 
	
 	
	Global GameState:String = "MENU" 'initial gamestate
	
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Method OnCreate ()
	'All the intialisation of the game goes here
	SetUpdateRate 60 'framerate is set to  60
	'Loads image for the menu as its the intial thing to load up
	menubackground = LoadImage ("menu.jpg") 'menu background
	menubackground_2=LoadImage("menu2.png") 'Menu background 2
	helpbackground=LoadImage("controls.png")'help background
	background_1=LoadImage("first_level.jpg") ' level 1 background
	Game_Over=LoadImage("Game_Over.png")' gameover background
	Level_Completion=LoadImage("Level_Completion.png")' level completion background
	Level_Completion2=LoadImage("Level_Completion2.png")' level completion background
	Game_Completion=LoadImage("Game_Completion.png")
	background_2=LoadImage("Level_2.png")' level 2 background
	namebackground=LoadImage("name_background.png")
	scaryface=LoadImage("scary_face.png") 'For menu screen-scary face
	scaryface2=LoadImage("scary_face2.png")'menu scary face
	background_3=LoadImage("level_3.jpg") 'level 3 background
	Heart=LoadImage("heart.png") ' loads heart image
	healthbar_9=LoadImage("healthbar9.png") ' loads health bar when boss has 9-8  health
	healthbar_7=LoadImage("healthbar_7.png") ' loads health bar when boss has 7-5  health
	healthbar_5=LoadImage("healthbar_5.png") ' loads health bar when boss has 7-5  health
	healthbar_3=LoadImage("healthbar_3.png") ' loads health bar when boss has 3 or less health
	'Game sounds
	hurt=LoadSound("hurt.wav")' Player injured sound
	gun=LoadSound("gun.wav") 'Player shooting sound
	powerup=LoadSound("boost.wav") 'speed powerup sound
	ray_gun=LoadSound("ray_gun.wav") 'boss gun shooting sound
	menu_music=LoadSound("menu_music.wav") ' main menu sound
	zombie_death=LoadSound("zombie_death.wav")' zombie death sound
	level_completion=LoadSound("win.wav") ' Level completion sound
	death=LoadSound("game_over.wav") ' gameover sound
	minion_death=LoadSound("minion_death.wav") ' minion dying sound
	minion_spawn=LoadSound("minion_spawn.wav") ' minion spawning sound
	level3_music=LoadSound("level3_music.wav")'level 3 music is loaded in
	level2_music=LoadSound("level2_music.wav")'level 2 music is loaded in
	level1_music=LoadSound("level1_music.wav")'level 1 music is loaded in
	
	health=3 'intialises health
	
	level_1= New Level
	level_1.load()
	level_2= New Level2
	level_2.load()
	level_3=New Level3
	level_3.load()
	characters = LoadImage("character.png") 'Loads player image
	player = New Character 'Spawns entity of player
	player.sprite = characters.GrabImage(0,0,48,60)
	missile_collection = New List<Bullets>  '(shoot To the Right)
	missile_collection2 = New List<Bullets2> '(shoot To the Left)
	enemy_collection = New List<Zombie>' creates a list for the class zombie
	
	boss=New Boss_Zombie ' intialises boss zombie/creates a new instance
	boss_level2=New Necromancer	 ' intialises Necromancer/creates a new instance
	minion_collection=New List<minion>' creates a list for the class minion
	boss_level3=New Zombie_King ' creates a new instance of the zombie king
	zombieclaw_collection=New List<Zombie_Claw> ' creates a list for the class zombie claw
	
	strongzombie_collection = New List<Strong_Zombie> 'initialises  list /creates a object of a class
	bossmissile_collection = New List<Boss_Bullets> 'initialises  list /creates a object of a class
	brutalzombie_collection=New List<Brutal_Zombie> 'initialises  list /creates a object of a class
	speed_powerup = New List<Speed> 'initialises  list /creates a object of a class
	For Local index:=0 Until 10  ; 'counter control loop which goes from 0 to 10
		playerscores[index]=0 'sets the score as empty
		names[index]=""'empty string
	Next 
	LeaderBoard=LoadImage("Leaderboard.png") ' loads the leaderboard image in 
	SetFont(LoadImage("font_16.png",16,16,64)) ' loads the font image in and sets the font to it.
	
		PlaySound(menu_music,1,1) 'Play Sound main menu sound requires 2 parameters (1 for sound variable , and the second is if the sound should be looped or not in this case the sound will be looped)
		


End
	
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Method OnUpdate ()
	'Handles alll the game logic
	Select GameState
	Case "MENU" 'Controls menu gamestate		
		StopChannel(5) ' stops game complete music 
		StopChannel(6) 'stops game over music
		StopChannel(2) ' stops level 1 sound music 
		StopChannel(3) 'stops level 2 sound music
		StopChannel(4) 'stops level 3 sound music
		ResumeChannel(1)	'Resumes the channel ;music plays again	
		timer+=1 'timer increases by 1 each update is used for my menu
		If KeyHit (KEY_Q) Then ExitApp(0)' if key q is pressed it exits game
		If KeyHit (KEY_SPACE) Then GameState="NAME" 'if space it hit it goes to the name which the user enters he/shes name
		If KeyHit (KEY_H) Then GameState="HELP" ' is h is pressed go to help screen
		If KeyHit (KEY_L) Then GameState="LEADERBOARD" ' if l is pressed go to leaderboard
	Case "INITIALISE"
		PauseChannel(1) 'channel stops playing
		PlaySound(level1_music,2,1) 'Play Sound for level1 music which loops and channel is set to 2
		SetChannelVolume(2,0.1) ' sets channel 2 to a volume of 0.01
		score_and_name=False 'set score and name to false
		Boss_Hp=10 ' intaaises boss hp
		health=3 ' inisitialises health
		score=0	'intialises score
		
		For Local enemy:=Eachin enemy_collection 
			enemy_collection.Remove enemy 'removes zombie 
			enemy_collection.Remove enemy 'removes zombie 
			enemy_collection.Remove enemy 'removes zombie 
		Next 
			For Local missile:=Eachin missile_collection 'loops through each missile
				missile_collection.Remove missile ' removes missile
				missile_collection.Remove missile' removes missile
				missile_collection.Remove missile 'removes missile
			Next 
			For Local missile:=Eachin missile_collection2 'loops through each missile 
				missile_collection2.Remove missile ' removes missile
				missile_collection2.Remove missile' removes missile
				missile_collection2.Remove missile 'removes missile
		      End 
		enemy_collection.AddLast(New Zombie(600,400)) 'adds new entity of zombie at certain coordinates
		enemy_collection.AddLast(New  Zombie(600,320)) 'adds new entity of zombie at certain coordinates
		enemy_collection.AddLast(New  Zombie(600,520))'adds new entity of zombie at certain coordinates
		
		speed_powerup.AddLast(New Speed(100,350))'adds new entity of speed powerup at certain coordinates
		player.x = 100     'Player spawn area
		player.y = 592 
		player.speed=2 'player  base speed
		player.speed_x = 0 'x direction
		player.speed_y = 0'y direction
		bullet_count=0
		
		GameState="PLAYING" 
		
	Case "PLAYING" 'Controls game gamestate	
	
		
		If KeyHit (KEY_ESCAPE) Then GameState="MENU" 
		'Player movement
		If KeyDown (KEY_A) Then ' if a is pressed  player moves left 
			player.speed_x = -player.speed
		End
		If KeyDown (KEY_D) Then ' if d is pressed  player moves right 
			player.speed_x = player.speed
		End 
		If KeyDown (KEY_W) Then ' if d is pressed  player moves  upwards 
			player.speed_y = -player.speed
		End
		If KeyDown (KEY_S) Then 'if s is pressed playwer moves downwards
			player.speed_y = player.speed
		End
		
		player.x += player.speed_x
		'If player collides with tile speed=0
		If level_1.tile_hit(player.x, player.y) = purple_tile Then ' intersection between player and tile
			player.x -=player.speed_x   
			player.speed_x = 0  ' player speed is equal to 0
		End 
		If level_1.tile_hit(player.x, player.y) = red_tile Then  'intersection between player and tile
			player.x -=player.speed_x 
			player.speed_x = 0 ' player speed is equal to 0
		End
		player.y += player.speed_y
		If level_1.tile_hit(player.x, player.y) = purple_tile Then 'intersection between player and tile
			player.y -=player.speed_y 
			player.speed_y = 0 ' player speed is equal to 0
		End 
		If level_1.tile_hit(player.x, player.y) = red_tile Then 'intersection between player and tile
			player.y -=player.speed_y 
			player.speed_y = 0' player speed is equal to 0
		End
		'handles player to zombie intersection
			For Local enemy:=Eachin enemy_collection  ' looks at each enemy
				If intersects(player.x,player.y,48,68,enemy.x,enemy.y,120,68) Then  ' intersection between play and enemy
					PlaySound(hurt)'plays injured sound 
			     		health=health-1	 'each time player intersects with zombie it loses 1 health
					enemy_collection.Remove enemy 'removes zombie 
					  enemy_collection.AddLast(New Zombie(Rnd(800,1000),Rnd(100,600)))	'respawns
			 	End
			Next 
		
		'player health
		If health<=0 Then 
			score_and_name=True ' set score and name to true
			PlaySound(death) ' gameover sound
			GameState="GAMEOVER" 'goes to gameover state
		End 
		  'spawns a new enitity of bullets each time you hit  a key
		If KeyHit(KEY_K) Then
			missile_collection.AddLast(New Bullets(player.x,player.y))'spawns a new entity of bullet when k is pressed
			PlaySound(gun) 'gun sound
			bullet_count=bullet_count+1 ' if bullet count is between 10 and 12 it spawns 3 new bullets
			If bullet_count>=10 And bullet_count<12 Then ' if bullet count is between 10 and 11
				missile_collection.AddLast(New Bullets(player.x,player.y-3)) 'spawns a new entity of bullet when j is pressed
				missile_collection.AddLast(New Bullets(player.x,player.y+10))'spawns a new entity of bullet when k is pressed
				missile_collection.AddLast(New Bullets(player.x,player.y+7))'spawns a new entity of bullet when k is pressed	
			End 
			If bullet_count=12 Then ' if bullet count is equal to `12
				missile_collection.AddLast(New Bullets(player.x,player.y-3)) 'spawns a new entity of bullet when j is pressed
				missile_collection.AddLast(New Bullets(player.x,player.y+10))'spawns a new entity of bullet when k is pressed
				missile_collection.AddLast(New Bullets(player.x,player.y+7))'spawns a new entity of bullet when k is pressed	
				bullet_count=0 'bullet count resets to 0
			End 	
		End 
		 'spawns a new enitity of bullets each time you hit  a key
		If KeyHit(KEY_J) Then
			missile_collection2.AddLast(New Bullets2(player.x,player.y)) 'spawns a new entity of bullet when j is pressed
			PlaySound(gun) 'gun sound
			bullet_count=bullet_count+1 ' increment bullet count by 1
			If bullet_count>=10 And bullet_count<12 Then 'if bullet count is between 10 and 12 it spawns 3 new bullet
				missile_collection2.AddLast(New Bullets2(player.x,player.y-3)) 'spawns a new entity of bullet when j is pressed
				missile_collection2.AddLast(New Bullets2(player.x,player.y+10))'spawns a new entity of bullet when k is pressed
				missile_collection2.AddLast(New Bullets2(player.x,player.y+7))'spawns a new entity of bullet when k is pressed	
			End 
			If bullet_count=12 Then ' if bullet count is equal to 12 
				missile_collection2.AddLast(New Bullets2(player.x,player.y-3)) 'spawns a new entity of bullet when j is pressed
				missile_collection2.AddLast(New Bullets2(player.x,player.y+10))'spawns a new entity of bullet when k is pressed
				missile_collection2.AddLast(New Bullets2(player.x,player.y+7))'spawns a new entity of bullet when k is pressed	
				bullet_count=0 ' bullet count resets to 0
			End 	
		End 
		'Handles zombie movement
		For  Local Zombie:=Eachin enemy_collection 'loops through each zombie
			Zombie.Move(-1.5)	'zombie moves by 1.5 (left)
			If Zombie.x<0Then  
				enemy_collection.Remove Zombie 'removes zombie if it goes below 0
				  enemy_collection.AddLast(New Zombie(Rnd(800,1000),Rnd(100,600)))	
				  'when the enemy zombie goes into the border  spawns between x is between (800-1000) and y is between (100-600)
			 End
	   	Next 
	   	
		'Handle missile movement
		For Local missile:=Eachin missile_collection 'loops through each missile
			missile.Move(-5) 'missile moves by 5 each update
			If player.speed=3 Then missile.Move(-7)'powerup - when powerup speed is aquired missile movement speed increases
			If level_1.tile_hit(missile.x, missile.y) = red_tile Then missile_collection.Remove missile		' Removes bullet when it hits a tile
			If level_1.tile_hit(missile.x, missile.y) = purple_tile Then  missile_collection.Remove missile  ' Removes bullet when it hits a tile
		Next 
		For Local missile:=Eachin missile_collection2 'loops through each missile
			missile.Move(-5)  'missile moves by 5 each update
			If player.speed=3 Then missile.Move(-7) 'powerup - when powerup speed is aquired missile movement speed increases
			If level_1.tile_hit(missile.x, missile.y) = red_tile Then missile_collection2.Remove missile		' Removes bullet when it hits a tile
			If level_1.tile_hit(missile.x, missile.y) = purple_tile Then  missile_collection2.Remove missile  ' Removes bullet when it hits a tile
		Next 
		
		
		'Handles intersection of missles to zombies
		For Local missile:=Eachin missile_collection 'looks at each missile
			For Local enemy:=Eachin enemy_collection  'looks at each enemy
				If intersects(missile.x,missile.y,21,22,enemy.x,enemy.y,120,68) Then 'intersection between missile and enemy
					score=score+10 ''score increases by 10
					PlaySound(zombie_death) ' play death sound	
					SetMusicVolume(0.5) ' this sets current sound to be set to 0.5 ( uses inbulit function)
					enemy_collection.Remove enemy ' removes enemy 
					missile_collection.Remove missile 'removes missile
					 enemy_collection.AddLast(New Zombie(Rnd(800,1000),Rnd(100,600)))  'removes missile
			   	End 
			  Next 
		Next  		
		'Handles intersection of missles to zombies
		For Local missile:=Eachin missile_collection2'looks at each missile
			For Local enemy:=Eachin enemy_collection  'looks at each enemy
				If intersects(missile.x,missile.y,21,22,enemy.x,enemy.y,120,68) Then
					score=score+10 ''score increases by 10
					PlaySound(zombie_death)  'sound of zombie death
					SetMusicVolume(0.5) ' this sets current sound to be set to 0.5 ( uses inbulit function)
					enemy_collection.Remove enemy  'removes enemy 
					missile_collection2.Remove missile  'removes missile
					 enemy_collection.AddLast(New Zombie(Rnd(1000),Rnd(100,600))) 'removes missile
			   	End 
			  Next 
		Next  		
		
		'Boss zombie
			bossmissile_collection.AddLast(New Boss_Bullets(boss.x,boss.y)) 'add a new boss bullet object
			For Local missile:=Eachin bossmissile_collection ' looks at each bossmissile
				bullet_time+=1 ' increment bullet time by 1
				If bullet_time>40 Then   'bullet is on screen for longer so the player can actually see when boss fires a bullet (bullet says on for around 3 seconds)
					bullet_fire=False 'when bullet fire is false it removes the bullet
					bossmissile_collection.Remove missile '	
				End 
       				 If bullet_time> 120 Then 'Delay for firing bullets when it reaches 120 fires a new bullet
       			 		bullet_fire=True 'fires a bullet until it reaches 40 ^(around 4 seconds)
       			 		bossmissile_collection.AddLast(New Boss_Bullets(boss.x,boss.y)) ' adds a bullet
       			 		PlaySound(ray_gun)' plays sound of boss zombie gun 
       			 		SetMusicVolume(0.6)	
         				bullet_time = 0 'resets loops		
         				If intersects(missile.x,missile.y,600,60,player.x,player.y,48,60) And bullet_fire=True Then ' controls the interction between boss gun shots to the player
       					bossmissile_collection.Remove missile ' remove missile
						health=health-1 ' remove health by 1
						PlaySound(hurt)'plays injured sound 
					End 
       				End 	
       			Next 
       			

       	
		' bossmissile to missile intersection only 1 of the guns is required to kill him/ direction as the boss will be situated at the top and moving side to side and no space behind him to kill him so missile_collection won't be required
       			For Local missile:=Eachin missile_collection2
					For Local bossmissile:=Eachin bossmissile_collection 'look at each boss missile
						If intersects(bossmissile.x,bossmissile.y,600,60,missile.x,missile.y,21,22) Then
							missile_collection2.Remove missile 'removes missile
						End 
					Next
				Next 
			'Boss to player interaction
			If intersects(boss.x,boss.y,150,150,player.x,player.y,48,60) Then
				health=health-3 'lose 3 health
			End If 
			'missile to boss interaction
				For Local missile:=Eachin missile_collection2 'loop which looks at every bullet
					If intersects(missile.x,missile.y,21,22,boss.x,boss.y,150,150) Then  ' checks intersection between bulllet and missile
							Boss_Hp=Boss_Hp-1 'boss loses a life each  time he is hit
							missile_collection2.Remove missile 'remove bullet if it has hit the boss
						If Boss_Hp=0 Then 
							score=score+100 'reward the player 100 points if it beats the boss
							PlaySound(level_completion,5) ' play level completion sound when level is complete
							GameState="LEVEL_1_COMPLETION" 'created a new gamestate for Completion
						End 
					End 
				Next 
			'Boss Movement	
			If level_1.tile_hit(boss.x, boss.y) =red_tile Then 'if boss hits a red tile it moves downward ( by a 100)
				boss.Move(-100)	  'boss moves 100 down
			Elseif level_1.tile_hit(boss.x,boss.y) = purple_tile Then    'if boss hits a purple tile it moves upwards by 1 
				boss.Move(1)  
			Else 
				boss.Move(1)  'Else it will continously move upwards by 1
			End 
		'Powerups collision
			For Local speed:=Eachin speed_powerup  'speed accesses list/class Speed
				If intersects(player.x,player.y,48,68,speed.x,speed.y,50,35) Then 
						player.speed=3 'player speed
						PlaySound(powerup) 'powerup sound
						speed_powerup.Remove speed 'removes zombie 
					End 
				Next 
		
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''					
	Case "INITIALISE2"
		StopChannel(5)
		bullet_count=0
		PlaySound(level2_music,3,1) 'Play Sound for level1 music which loops and channel is set to 3
		SetChannelVolume(3,0.1) 'sets channel 3 to volume of 0.01
		Boss_Hp=10 ' boss health 
		health=3  ' health 
		player.x = 120     'Player spawn area
		player.y = 400 
		
		For Local index:=0 Until 10 
		playerscores[index]=0
		names[index]=""
		Next
		For Local missile:=Eachin missile_collection 'loops through each missile
			missile_collection.Remove missile ' removes missile
			missile_collection.Remove missile' removes missile
			missile_collection.Remove missile 'removes missile
		Next 
		For Local missile:=Eachin missile_collection2 'loops through each missile 
			missile_collection2.Remove missile ' removes missile
			missile_collection2.Remove missile' removes missile
			missile_collection2.Remove missile 'removes missile
		Next 
		For Local enemy:=Eachin minion_collection 'Loops through each minion
			minion_collection.Remove enemy 'removes zombie 
			minion_collection.Remove enemy 'removes zombie 
			minion_collection.Remove enemy 'removes zombie 
		Next  
		minion_collection.AddLast(New minion(boss_level2.x,boss_level2.y))
		
		For Local enemy:=Eachin strongzombie_collection' loops through each strong zombie
			strongzombie_collection.Remove enemy 'removes zombie 
			strongzombie_collection.Remove enemy 'removes zombie 
			strongzombie_collection.Remove enemy 'removes zombie 
		Next 
		
		
		strongzombie_collection.AddLast(New Strong_Zombie(500,100)) ' creates a new instance of Strong zombie and spawns it at specific coords
		strongzombie_collection.AddLast(New  Strong_Zombie(500,220))  ' creates a new instance of Strong zombie and spawns it at specific coords
		strongzombie_collection.AddLast(New  Strong_Zombie(520,320)) ' creates a new instance of Strong zombie and spawns it at specific coords
		player.speed=3 'player speed
		Zombie_Hp=2 ' zombie hp is set 2
		bullet_count=0 ' set bullet count to 0
		
		GameState="LEVEL2" 	
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''								
	Case "LEVEL2" 
		
		If KeyHit (KEY_ESCAPE) Then GameState="MENU" 
		'Player movement
		If KeyHit (KEY_ESCAPE) Then GameState="MENU" 
		'Player movement
		If KeyDown (KEY_A) Then ' if a is pressed  player moves left 
			player.speed_x = -player.speed
		End
		If KeyDown (KEY_D) Then ' if d is pressed  player moves right 
			player.speed_x = player.speed
		End 
		If KeyDown (KEY_W) Then ' if d is pressed  player moves  upwards 
			player.speed_y = -player.speed
		End
		If KeyDown (KEY_S) Then 'if s is pressed playwer moves downwards
			player.speed_y = player.speed
		End
		player.x += player.speed_x
		'If player collides with tile speed=0
		If level_2.tile_hit(player.x, player.y) = purple_tile Then' intersection between player and tile
			player.x -=player.speed_x 
			player.speed_x = 0  'player speed is equal to 0
		End 
		If level_2.tile_hit(player.x, player.y) = red_tile Then' intersection between player and tile
			player.x -=player.speed_x 
			player.speed_x = 0 'player speed is equal to 0
		End
		player.y += player.speed_y
		If level_2.tile_hit(player.x, player.y) = purple_tile Then' intersection between player and tile
			player.y -=player.speed_y 
			player.speed_y = 0 'player speed is equal to 0
		End 
		If level_2.tile_hit(player.x, player.y) = red_tile Then' intersection between player and tile
			player.y -=player.speed_y 
			player.speed_y = 0  'player speed is equal to 0
		End
		
		
		'player health
		If health<=0 Then
			score_and_name=True
			PlaySound(death,6) 'Gameover sound
			GameState="GAMEOVER"
	 	End 
		  'spawns a new enitity of bullets each time you hit  a key
		If KeyHit(KEY_K) Then
			missile_collection.AddLast(New Bullets(player.x,player.y))'spawns a new entity of bullet when k is pressed
			PlaySound(gun) 'gun sound
			bullet_count=bullet_count+1 ' if bullet count is between 10 and 12 it spawns 3 new bullets
			If bullet_count>=10 And bullet_count<12 Then ' if bullet count is between 10 and 11
				missile_collection.AddLast(New Bullets(player.x,player.y-3)) 'spawns a new entity of bullet when j is pressed
				missile_collection.AddLast(New Bullets(player.x,player.y+10))'spawns a new entity of bullet when k is pressed
				missile_collection.AddLast(New Bullets(player.x,player.y+7))'spawns a new entity of bullet when k is pressed	
			End 
			If bullet_count=12 Then ' if bullet count is equal to `12
				missile_collection.AddLast(New Bullets(player.x,player.y-3)) 'spawns a new entity of bullet when j is pressed
				missile_collection.AddLast(New Bullets(player.x,player.y+10))'spawns a new entity of bullet when k is pressed
				missile_collection.AddLast(New Bullets(player.x,player.y+7))'spawns a new entity of bullet when k is pressed	
				bullet_count=0 'bullet count resets to 0
			End 	
		End 
		 'spawns a new enitity of bullets each time you hit  a key
		If KeyHit(KEY_J) Then
			missile_collection2.AddLast(New Bullets2(player.x,player.y)) 'spawns a new entity of bullet when j is pressed
			PlaySound(gun) 'gun sound
			bullet_count=bullet_count+1 ' increment bullet count by 1
			If bullet_count>=10 And bullet_count<12 Then 'if bullet count is between 10 and 12 it spawns 3 new bullet
				missile_collection2.AddLast(New Bullets2(player.x,player.y-3)) 'spawns a new entity of bullet when j is pressed
				missile_collection2.AddLast(New Bullets2(player.x,player.y+10))'spawns a new entity of bullet when k is pressed
				missile_collection2.AddLast(New Bullets2(player.x,player.y+7))'spawns a new entity of bullet when k is pressed	
			End 
			If bullet_count=12 Then ' if bullet count is equal to 12 
				missile_collection2.AddLast(New Bullets2(player.x,player.y-3)) 'spawns a new entity of bullet when j is pressed
				missile_collection2.AddLast(New Bullets2(player.x,player.y+10))'spawns a new entity of bullet when k is pressed
				missile_collection2.AddLast(New Bullets2(player.x,player.y+7))'spawns a new entity of bullet when k is pressed	
				bullet_count=0 ' bullet count resets to 0
			End 	
		End 
	
	   	
		'Handle missile movement
		For Local missile:=Eachin missile_collection
			missile.Move(-5)		
			If level_2.tile_hit(missile.x, missile.y) = red_tile Then missile_collection.Remove missile		' Removes bullet when it hits a tile
			If level_2.tile_hit(missile.x, missile.y) = purple_tile Then  missile_collection.Remove missile  ' Removes bullet when it hits a tile
		Next 
		'Handles missile movement
		For Local missile:=Eachin missile_collection2
			missile.Move(-5)
			If level_2.tile_hit(missile.x, missile.y) = red_tile Then missile_collection2.Remove missile		' Removes bullet when it hits a tile
			If level_2.tile_hit(missile.x, missile.y) = purple_tile Then  missile_collection2.Remove missile  ' Removes bullet when it hits a tile
		Next 
		
			'Handles Zombie movement
		For  Local Strong_Zombie:=Eachin strongzombie_collection 'looks at every zombie
			Strong_Zombie.Move(-2)	'moves the zombie left 
			If Strong_Zombie.x<0Then  ' if zombies goes bellow x= 0 
				strongzombie_collection.Remove Strong_Zombie 'removes zombie if it goes below 0
				  strongzombie_collection.AddLast(New Strong_Zombie(Rnd(800,1000),Rnd(100,600)))	 '
				  'when the enemy zombie goes into the border  spawns between x is between (800-1000) and y is between (100-600)
			 End
	   	Next 
			'handles player to zombie intersection
			For Local enemy:=Eachin strongzombie_collection  'looks at each enemy
				If intersects(enemy.x,enemy.y,75,75,player.x,player.y,48,60) Then  ' if player and enemy intersect
			     		health=health-1	 'each time player intersects with zombie it loses 1 health
			     		PlaySound(hurt)'plays injured sound 
					strongzombie_collection.Remove enemy 'removes zombie 
					  strongzombie_collection.AddLast(New Strong_Zombie(Rnd(800,1000),Rnd(100,600)))	'respawns strong zombie
			 	End
			Next 
		
		
		
		'Handles intersection of missles to zombies
		For Local missile:=Eachin missile_collection 'looks at each missile 
			For Local enemy:=Eachin strongzombie_collection 'iterates through each enemy
				If intersects(missile.x,missile.y,21,22,enemy.x,enemy.y,75,75) Then	
					Zombie_Hp=Zombie_Hp-1'zombie hp minuses 1 per missile
					missile_collection.Remove missile' removes missile
					If Zombie_Hp=0 Then  
						PlaySound(zombie_death) ' play death sound
						SetMusicVolume(0.5) ' this sets current sound to be set to 0.5 ( uses inbulit function)
						score=score+10  'if zombie dies give the player 10 points
						strongzombie_collection.Remove enemy 'removes enemy
						missile_collection.Remove missile 'removes missile
						 strongzombie_collection.AddLast(New Strong_Zombie(Rnd(800,1000),Rnd(100,600))) 'adds a new zombie	
						  Zombie_Hp=2 'zombie hp becomes 2 again after zombie dies.
			   		 End 
			  	End 
			Next 
		Next 		
		'Handles intersection of missles to zombies
		For Local missile:=Eachin missile_collection2 'looks at each missile 
			For Local enemy:=Eachin strongzombie_collection  'iterates through each enemy
				If intersects(missile.x,missile.y,21,22,enemy.x,enemy.y,75,75) Then
					score=score+10 'if zombie dies give the player 10 points
					Zombie_Hp=Zombie_Hp-1 'zombie hp minuses 1 per missile
					missile_collection2.Remove missile ' removes missile
					If Zombie_Hp=0 Then  
						PlaySound(zombie_death) ' play death sound
						SetMusicVolume(0.5) ' this sets current sound to be set to 0.5 ( uses inbulit function)
						strongzombie_collection.Remove enemy  'removes enemy
						missile_collection2.Remove missile 'removes missile
						 strongzombie_collection.AddLast(New Strong_Zombie(Rnd(1000),Rnd(100,600)))	'adds a new zombie	
						 Zombie_Hp=2		'zombie hp becomes 2 again after zombie dies.
					End 
			   	End 
			  Next 
		Next  	
		
			
		'necromancer Movement 
		If  boss_level2.y<100 Then   'if boss goes bellow y 100 then it moves downwards 
				boss_move=False 
		Elseif boss_level2.y>500 Then  'if boss goes above 500, boss moves upwards
				boss_move=True 
		End 
			If boss_move=True  ' boolean statement which moves the boss up 2 each time (downards)
				boss_level2.Move(2)   
			elseif boss_move=False 
				boss_level2.Move(-2)		' boolean statement which moves the boss up 2 each time (upwards)	
			End 
		
		'Necromancer bullet intersection 
		For Local missile:=Eachin missile_collection
					If intersects(missile.x,missile.y,21,22,boss_level2.x,boss_level2.y,150,150) Then
							Boss_Hp=Boss_Hp-1 ' if boss hp becomes 0 Level Completed!
							missile_collection.Remove missile' remove missile
						If Boss_Hp=0 Then 
							score=score+100 'Reward player for 100 points for killing the boss
							PlaySound(level_completion,5) ' play completion sound
						GameState="LEVEL_2_COMPLETION"  'created a new gamestate for Completion
						End 
					End 
				Next 
		'Necromancer bullet intersection 
		For Local missile:=Eachin missile_collection2
					If intersects(missile.x,missile.y,21,22,boss_level2.x,boss_level2.y,150,150) Then
							Boss_Hp=Boss_Hp-2 ' if boss hp becomes 0 Level Completed!
							missile_collection2.Remove missile ' remove missile
						If Boss_Hp=0 Then 
							score=score+100 'iReward player for a  100 points for killing the boss
							PlaySound(level_completion,5) ' play completion sound
							GameState="LEVEL_2_COMPLETION" 'created a new gamestate for Completion
						End 
					End 
				Next 
				
				
		
		'Boss to player Intersection
		If intersects(boss_level2.x,boss_level2.y,150,150,player.x,player.y,48,60) Then 'if boss collides with player , player instantly dies
				health=health-3 ' player loses 3 health ( player dies )
			End If 
			
		
		'Necromancer minion movement
		For  Local minion:=Eachin minion_collection ' loops through  each  minion 
			If minion.x < player.x Then minion.x += minion.speed 'If x is less than player x then minion position goes up up and moves closer to the player..
			If minion.x > player.x Then minion.x -= minion.speed	' if x is bigger than player x then minion position goes down up and moves closer to the player
			If minion.y < player.y Then minion.y += minion.speed' if y is less than player y then minion position goes up up and moves closer to the player
			If minion.y > player.y Then minion.y -= minion.speed' if y is bigger than player y then minion position goes down up and moves closer to the player
	   	Next 
	   	'handles player to minion intersection
			For Local minion:=Eachin minion_collection 'looks at each minion
				If intersects(minion.x,minion.y,70,70,player.x,player.y,48,60)  Then 
					minion_collection.Remove minion 'removes zombie 
			     		health=health-1	 'each time player intersects with zombie it loses 1 health
			     		PlaySound(hurt)'plays injured sound 
			 	End
			Next 
			'handles minion to bullet
			For Local missile:=Eachin missile_collection ' looks at each missile
				For Local enemy:=Eachin minion_collection ' looks at each minion
				If intersects(missile.x,missile.y,21,22,enemy.x,enemy.y,70,70) Then 'if missile intersects with minion
					score=score+10 ' score increments by 10
					PlaySound(minion_death) ' play death sound
					minion_collection.Remove enemy  ' removes minion
					missile_collection.Remove missile ' removes missile
			   	End 
			  Next 
		Next  		
		'Handles intersection of missles to minion
		For Local missile:=Eachin missile_collection2'looks at each missile
			For Local enemy:=Eachin minion_collection ' looks at each minion
				If intersects(missile.x,missile.y,21,22,enemy.x,enemy.y,70,70) Then 'if missile intersects with minion
					score=score+10' score increments by 10
					PlaySound(minion_death) ' play death sound
					minion_collection.Remove enemy' removes minion
					missile_collection2.Remove missile' removes missile
					
			   	End 
			  Next 
		Next  		
		'timer for minions to spawn	
		time+=1' timer increments by 1 
		If time=300 And new_minion=True  ' if the timer is equal to 300 and new_minion is true (Default state) it will go through this selection state
			PlaySound(minion_spawn) ' play spawn sound
			number=Rnd(1,3) 'randomly chooses to spawn either 1 minion or 2 minions
			If number=1 'if it choooses 1 spawn 1 minion
				minion_collection.AddLast(New minion(boss_level2.x,boss_level2.y))	 ' initialises a new minion
				
			Elseif number=2 'if 2 is chosen spawn 2 zombies 
				minion_collection.AddLast(New minion(boss_level2.x,boss_level2.y))	
				minion_collection.AddLast(New minion(boss_level2.x-50,boss_level2.y-100))		
			End 
			new_minion=False	'set new_minion to false 			
		Elseif new_minion=False ' if new_minion is false time=0
			time=0 'timer is set to 0
			new_minion=True ' resets selection statement
			
		End 
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''					
	Case "INITIALISE3"
		
		StopChannel(5) 'stops channel 5(level completion sound from playing)
		bullet_count=0' bullet count is set to 0
		
		Boss_Hp=10 ' boss hp for level 3
		health=3  ' health resets to 3
		Zombie_Hp=3 ' zombie hp for level 3
		player.x = 140     'Player spawn area
		player.y = 80 
		For Local index:=0 Until 10 
		playerscores[index]=0
		names[index]=""
		Next
		For Local missile:=Eachin missile_collection 'loops through each missile
			missile_collection.Remove missile ' removes missile
			missile_collection.Remove missile' removes missile
			missile_collection.Remove missile 'removes missile
		Next 
		For Local missile:=Eachin missile_collection2 'loops through each missile
			missile_collection2.Remove missile ' removes missile
			missile_collection2.Remove missile' removes missile
			missile_collection2.Remove missile 'removes missile
		Next 
		For Local enemy:=Eachin brutalzombie_collection 
			brutalzombie_collection.Remove enemy 'removes zombie 
			brutalzombie_collection.Remove enemy 'removes zombie 
			brutalzombie_collection.Remove enemy 'removes zombie 
		Next  
		For Local enemy:=Eachin zombieclaw_collection 
			zombieclaw_collection.Remove enemy 'removes zombie 
			zombieclaw_collection.Remove enemy 'removes zombie 
			zombieclaw_collection.Remove enemy 'removes zombie 
		Next  
		brutalzombie_collection.AddLast(New Brutal_Zombie(500,100))'adds new entity of brutal zombie at certain coordinates
		brutalzombie_collection.AddLast(New  Brutal_Zombie(500,220))'adds new entity of brutal zombie at certain coordinates
		brutalzombie_collection.AddLast(New Brutal_Zombie(520,320))'adds new entity of brutal zombie at certain coordinates
		zombieclaw_collection.AddLast(New Zombie_Claw(boss_level3.x,boss_level3.y)) 'adds new entity of zombie at certain coordinates
		PlaySound(level3_music,4,1) 'Play Sound main menu sound requires 2 parameters (1 for sound variable , and the second is if the sound should be looped or not in this case the sound will be looped)
		SetChannelVolume(4,0.1) 'sets channel 4 to volume of 0.01
	
		GameState="LEVEL3" 			
	
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	Case "LEVEL3"
		
		If KeyHit (KEY_ESCAPE) Then GameState="MENU" ' return to menu when escape is pressed
		'Player movement
		If KeyDown (KEY_A) Then ' if a is pressed  player moves left 
			player.speed_x = -player.speed
		End
		If KeyDown (KEY_D) Then ' if d is pressed  player moves right 
			player.speed_x = player.speed
		End 
		If KeyDown (KEY_W) Then ' if d is pressed  player moves  upwards 
			player.speed_y = -player.speed
		End
		If KeyDown (KEY_S) Then 'if s is pressed playwer moves downwards
			player.speed_y = player.speed
		End
		
		player.x += player.speed_x
		'If player collides with tile speed=0
		If level_3.tile_hit(player.x, player.y) = purple_tile Then ' intersection between player and tile
			player.x -=player.speed_x   
			player.speed_x = 0  ' player speed is equal to 0
		End 
		If level_3.tile_hit(player.x, player.y) = red_tile Then  'intersection between player and tile
			player.x -=player.speed_x 
			player.speed_x = 0 ' player speed is equal to 0
		End
		player.y += player.speed_y
		If level_3.tile_hit(player.x, player.y) = purple_tile Then 'intersection between player and tile
			player.y -=player.speed_y 
			player.speed_y = 0 ' player speed is equal to 0
		End 
		If level_3.tile_hit(player.x, player.y) = red_tile Then 'intersection between player and tile
			player.y -=player.speed_y 
			player.speed_y = 0' player speed is equal to 0
		End
		'player health
		If health<=0 Then
			score_and_name=True
			PlaySound(death,6) 'Gameover sound
			GameState="GAMEOVER"
	 	End 
		  'spawns a new enitity of bullets each time you hit  a key
		If KeyHit(KEY_K) Then
			missile_collection.AddLast(New Bullets(player.x,player.y))'spawns a new entity of bullet when k is pressed
			PlaySound(gun) 'gun sound
			bullet_count=bullet_count+1 ' if bullet count is between 10 and 12 it spawns 3 new bullets
			If bullet_count>=10 And bullet_count<12 Then ' if bullet count is between 10 and 11
				missile_collection.AddLast(New Bullets(player.x,player.y-3)) 'spawns a new entity of bullet when j is pressed
				missile_collection.AddLast(New Bullets(player.x,player.y+10))'spawns a new entity of bullet when k is pressed
				missile_collection.AddLast(New Bullets(player.x,player.y+7))'spawns a new entity of bullet when k is pressed	
			End 
			If bullet_count=12 Then ' if bullet count is equal to `12
				missile_collection.AddLast(New Bullets(player.x,player.y-3)) 'spawns a new entity of bullet when j is pressed
				missile_collection.AddLast(New Bullets(player.x,player.y+10))'spawns a new entity of bullet when k is pressed
				missile_collection.AddLast(New Bullets(player.x,player.y+7))'spawns a new entity of bullet when k is pressed	
				bullet_count=0 'bullet count resets to 0
			End 	
		End 
		 'spawns a new enitity of bullets each time you hit  a key
		If KeyHit(KEY_J) Then
			missile_collection2.AddLast(New Bullets2(player.x,player.y)) 'spawns a new entity of bullet when j is pressed
			PlaySound(gun) 'gun sound
			bullet_count=bullet_count+1 ' increment bullet count by 1
			If bullet_count>=10 And bullet_count<12 Then 'if bullet count is between 10 and 12 it spawns 3 new bullet
				missile_collection2.AddLast(New Bullets2(player.x,player.y-3)) 'spawns a new entity of bullet when j is pressed
				missile_collection2.AddLast(New Bullets2(player.x,player.y+10))'spawns a new entity of bullet when k is pressed
				missile_collection2.AddLast(New Bullets2(player.x,player.y+7))'spawns a new entity of bullet when k is pressed	
			End 
			If bullet_count=12 Then ' if bullet count is equal to 12 
				missile_collection2.AddLast(New Bullets2(player.x,player.y-3)) 'spawns a new entity of bullet when j is pressed
				missile_collection2.AddLast(New Bullets2(player.x,player.y+10))'spawns a new entity of bullet when k is pressed
				missile_collection2.AddLast(New Bullets2(player.x,player.y+7))'spawns a new entity of bullet when k is pressed	
				bullet_count=0 ' bullet count resets to 0
			End 	
		End 
			'Handle missile movement
		For Local missile:=Eachin missile_collection
			missile.Move(-5)		
			If level_3.tile_hit(missile.x, missile.y) = red_tile Then missile_collection.Remove missile		' Removes bullet when it hits a tile
			If level_3.tile_hit(missile.x, missile.y) = purple_tile Then  missile_collection.Remove missile  ' Removes bullet when it hits a tile
		Next 
		'Handles missile movement
		For Local missile:=Eachin missile_collection2
			missile.Move(-5)
			If level_3.tile_hit(missile.x, missile.y) = red_tile Then missile_collection2.Remove missile		' Removes bullet when it hits a tile
			If level_3.tile_hit(missile.x, missile.y) = purple_tile Then  missile_collection2.Remove missile  ' Removes bullet when it hits a tile
		Next 
			'Handles Zombie movement
		For  Local Brutal_Zombie:=Eachin brutalzombie_collection ' loops through each brutal zombie
			Brutal_Zombie.Move(-3)'Moves -3 per update (moves left)
			If Brutal_Zombie.x<0Then 
				brutalzombie_collection.Remove Brutal_Zombie 'removes zombie if it goes below 0
				  brutalzombie_collection.AddLast(New Brutal_Zombie(Rnd(800,1000),Rnd(100,600)))	 
				  'when the enemy zombie goes into the border  spawns between x is between (800-1000) and y is between (100-600)
			 End
	   	Next 
		'handles player to zombie intersection
			For Local enemy:=Eachin brutalzombie_collection  ' loops through each brutal zombie
				If intersects(enemy.x,enemy.y,75,75,player.x,player.y,48,60) Then 
			     		health=health-1	 'each time player intersects with zombie it loses 1 health
			     		PlaySound(hurt)'plays injured sound 
					brutalzombie_collection.Remove enemy 'removes zombie 
					  brutalzombie_collection.AddLast(New Brutal_Zombie(Rnd(800,1000),Rnd(100,600)))'respawns new entity of Brutal zombie at theses coords
			 	End
			Next 
		
		
			'Handles intersection of missles to zombies
		For Local missile:=Eachin missile_collection 'looks at each missile 
			For Local enemy:=Eachin brutalzombie_collection 'iterates through each enemy
				If intersects(missile.x,missile.y,21,22,enemy.x,enemy.y,75,75) Then	
					Zombie_Hp=Zombie_Hp-1'zombie hp minuses 1 per missile
					missile_collection.Remove missile 'removes missile
					If Zombie_Hp=0 Then  
						score=score+10  'if zombie dies give the player 10 points
						PlaySound(zombie_death) ' play death sound
						SetMusicVolume(0.5) ' this sets current sound to be set to 0.5 ( uses inbulit function)
						brutalzombie_collection.Remove enemy 'removes enemy
						missile_collection.Remove missile 'removes missile
						 brutalzombie_collection.AddLast(New Brutal_Zombie(Rnd(800,1000),Rnd(100,600))) 'adds a new zombie	
						  Zombie_Hp=3'zombie hp becomes 2 again after zombie dies.
			   		 End 
			  	End 
			Next 
		Next 		
		'Handles intersection of missles to zombies
		For Local missile:=Eachin missile_collection2 'looks at each missile 
			For Local enemy:=Eachin brutalzombie_collection  'iterates through each enemy
				If intersects(missile.x,missile.y,21,22,enemy.x,enemy.y,75,75) Then
					score=score+10 'if zombie dies give the player 10 points
					Zombie_Hp=Zombie_Hp-1 'zombie hp minuses 1 per missile
					missile_collection2.Remove missile 'removes missile
					If Zombie_Hp=0 Then  
						PlaySound(zombie_death) ' play death sound
						SetMusicVolume(0.5) ' this sets current sound to be set to 0.5 ( uses inbulit function)
						brutalzombie_collection.Remove enemy  'removes enemy
						missile_collection2.Remove missile 'removes missile
						brutalzombie_collection.AddLast(New Brutal_Zombie(Rnd(1000),Rnd(100,600)))	'adds a new zombie	
						 Zombie_Hp=3 	'zombie hp becomes 2 again after zombie dies.
					End 
			   	End 
			  Next 
		Next  	
		'Zombie King Movement 
		If  boss_level3.y<100 Then   'if boss goes bellow y 100 then it moves downwards 
				boss_move=False 
		Elseif boss_level3.y>600 Then  'if boss goes above 500, boss moves upwards
				boss_move=True 
		End 
			If boss_move=True  ' boolean statement which moves the boss up 2 each time (downards)
				boss_level3.Move(2)   
			Elseif boss_move=False 
				boss_level3.Move(-2)		' boolean statement which moves the boss up 2 each time (upwards)	
			End 		
		'Zombie king bullet intersection 
		For Local missile:=Eachin missile_collection ' loops each missile and looks at each one
					If intersects(missile.x,missile.y,21,22,boss_level3.x,boss_level3.y,150,150) Then
							Boss_Hp=Boss_Hp-1 ' if boss hp becomes 0 Level Completed!
							missile_collection.Remove missile'removes missile
						If Boss_Hp=0 Then 
							score=score+100 'score increases by 100
							PlaySound(level_completion,5)'score increases by 100
							score_and_name=True ' set score and name to true
							GameState="Game_Complete" 'created a new gamestate for Completion
						End 
					End 
				Next 
		'Zombie king bullet intersection 
		For Local missile:=Eachin missile_collection2 ' loops each missile and looks at each one
					If intersects(missile.x,missile.y,21,22,boss_level3.x,boss_level3.y,150,150) Then
							Boss_Hp=Boss_Hp-1 ' if boss hp becomes 0 Level Completed!
							missile_collection2.Remove missile 'removes missile
						If Boss_Hp=0 Then 
							score=score+100  'score increases by 100
							PlaySound(level_completion,5) ' level completion sound is played
							score_and_name=True ' set score and name to true
							GameState="Game_Complete" 'created a new gamestate for Completion
						End 
					End 
				Next 
				
	'Boss to player Intersection
		If intersects(boss_level3.x,boss_level3.y,150,150,player.x,player.y,48,60) Then 'if boss collides with player , player instantly dies
				health=health-3
			End If 
			
				'Zombie claw spawn rate				
		time2+=1 'timer for claws to spawn
		If time2=200 And new_claw=True  ' if the timer is equal to 200 and new_minion is true (Default state) it will go through this selection state
			zombieclaw_collection.AddLast(New Zombie_Claw(boss_level3.x-50,boss_level3.y)) 'adds new entity of zombie at certain coordinates
			new_claw=False	'set new_minion to false 			
		Elseif new_claw=False ' if new_minion is false time=0
			time2=0 
			new_claw=True
		End 
	'Handles zombie claw movement
		For  Local  enemy:=Eachin zombieclaw_collection ' loops through each zombie claw
			enemy.Move(-1.5)	'zombie  claw moves by 1.5 (left)
			If enemy.x<0Then 
				zombieclaw_collection.Remove enemy 'removes zombie if it goes below 0
				zombieclaw_collection.AddLast(New Zombie_Claw(boss_level3.x,boss_level3.y)) 'adds new entity of zombie claw at certain coordinates
			 End
	   	Next 
	   	'handles player to claw intersection
			For Local enemy:=Eachin zombieclaw_collection 'loops through each zombie 
				If intersects(enemy.x,enemy.y,70,70,player.x,player.y,48,60)  Then 
					zombieclaw_collection.Remove enemy 'removes zombie 
			     		health=health-1	 'each time player intersects with zombie it loses 1 health
			     		PlaySound(hurt)'plays injured sound 
			 	End
			Next 
		
		'Name
	Case "NAME"	
		If KeyHit(KEY_ENTER) Then GameState="INITIALISE"
		While result.Length<16 ' If the result  is less than 16
			Local char=GetChar()'sets char to the function Getchar()
			If Not char Exit' If its Not equal equal to char exit 
			If char>= 32 'if char is more than 32
				result+=String.FromChar(char) 'adds the characters to the array 
			Endif 
		Wend 
		If KeyHit(KEY_BACKSPACE) Then 
			If result.Length>0 Then result=result[0..result.Length-1] ' if you press backspace it removes a character
		End 
		
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	Case "HELP" 'Controls help/controls gamestate
		If KeyHit (KEY_ESCAPE) Then GameState="MENU" 
		
		
	Case "GAMEOVER" 'Controls exit gamestate
		StopChannel(2) ' stops level 1 music
		StopChannel(3) 'stops level 2 music
		StopChannel(4)  'stops level 3 music
		If score_and_name=True Then  'if score and name is true then 
			name_score(result,score) 'write the score and result to the file
			score_and_name=False 'set score and name to false
			End 
		If KeyHit( KEY_SPACE) Then GameState="MENU" 
		
	Case "LEVEL_1_COMPLETION" 'Controls exit gamestate
		StopChannel(2) 'stops level 1 music
		If KeyHit( KEY_SPACE) Then  GameState="INITIALISE2"
	Case "LEVEL_2_COMPLETION" 'Controls exit gamestate
		StopChannel(3) 'stops level 3 music
		If KeyHit( KEY_SPACE) Then  GameState="INITIALISE3"
	Case "Game_Complete"
		If score_and_name=True Then  'if score and name is true then 
				name_score(result,score) 'write the score and result to the file
				score_and_name=False 'set score and name to false
			End 
		StopChannel(4) 'stops level 4 music
			
		If KeyHit(KEY_SPACE) Then GameState="MENU"
	Case "LEADERBOARD"
		Ten_Scores()
		If KeyHit(KEY_SPACE) Or KeyHit(KEY_ESCAPE) Then
		GameState="MENU"
		End 
	End 		
	
End 
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Method OnRender ()
'All the graphics drawing goes here
	Select GameState
		Case "MENU"		
			If timer<=80 'if timer is equal to or less than 80   it draws the first scaryface
				DrawImage(menubackground, 0,0) ' draws the menu background
				DrawImage(scaryface,512,350) 'draws the first scary face 
			Elseif timer<=160  'if timer is equal to or less than 160   it draws the second scaryface
				DrawImage(menubackground_2, 0,0) ' draws the menu background(2nd image)
				DrawImage(scaryface2,130,150) ' draws 2nd scary face
			Elseif timer<=240  'if timer is equal to or less than 240   it draws the first scaryface
				DrawImage(menubackground, 0,0) ' draws the menu background
				DrawImage(scaryface,800,150) 'draws 1st scary face 
			Elseif timer<=320 'if timer is equal to or less than 320   it draws the second scaryface
				DrawImage(menubackground_2, 0,0) ' draws the menu background(2nd image)
				DrawImage(scaryface2,150,150) 'draws 2nd scary face 
			Elseif timer<=480  'if timer is equal to or less than 480 it draws the first scaryface
				DrawImage(menubackground, 0,0) ' draws the menu background
				DrawImage(scaryface,420,300) 'draws first scary face
			Elseif timer>=560 And timer<=640 'if timer is between 560-640  it draws the second scaryface
				DrawImage(menubackground_2, 0,0) ' draws the menu background (2nd image)
				DrawImage(scaryface2,520,600) 'draws 2nd scaryface
			Elseif timer>=640  'if timer more than 640 than the timer resets and starts the selection statements again
				timer=0 'reset timer
			End 
		Case "NAME"
		DrawImage(namebackground,0,0)'name background
		DrawText(text + result.ToUpper(),50,50)  ' makes text upper case 

		Case "PLAYING"
			DrawImage(background_1,0,0) ' level 1 background
			level_1.draw ' draws tiles onto level
			DrawText("LIVES=",20,20) ' draws Lives text
			If health=3  'if health=3 then draw 3 hearts
				DrawImage(Heart,110,20) ' draws heart
				DrawImage(Heart,130,20) 'draws heart
				DrawImage(Heart,150,20) 'draws heart
			Elseif health=2 'if health =2 draw 2 hearts 
				DrawImage(Heart,110,20) 'draws heart
				DrawImage(Heart,130,20) 'draws heart
			Elseif health=1 'if health=1 draw 1 heart
				DrawImage(Heart,110,20) 'draws heart
			End 
	
			If bullet_count<9 Then   ' if bullet count is less than 9
					DrawText("MULTI SHOT TIME::"+(10-bullet_count),20,660) ' Displays multshot timer
			Elseif bullet_count>=9 And bullet_count<=11Then  ' if its greater or equal to 9 and less than or equal to 11
				DrawText("MULTISHOT IS READY",20,660) ' displays that multishot is ready
			Else
				DrawText("MULTI SHOT TIME :10",20,660) 'Displays multshot timer
			End  
			
			DrawText("SCORE="+score,20,40) ' draws score
			DrawImage player.sprite, player.x, player.y ' draws player sprite
			For Local missile:=Eachin missile_collection ' looks at each missile
				DrawImage missile.sprite, missile.x, missile.y ' draws each missile
			Next
			For Local missile:=Eachin missile_collection2' ' looks through each missile
				DrawImage missile.sprite, missile.x, missile.y 'draws each missile
			Next

			'enemy zombies
			For Local enemy:=Eachin enemy_collection 'looks through each enemy
				DrawImage enemy.sprite, enemy.x, enemy.y ' draws each enemy
			Next
					'boss
			DrawImage boss.sprite, boss.x, boss.y 'draws boss sprite
			For Local missile:=Eachin bossmissile_collection ' looks through each missile
					DrawImage missile.sprite, missile.x, missile.y	 ' draws each missile
			Next
			'boss health bar
			If Boss_Hp<=9 And Boss_Hp>=8 Then  ' If boss health is 8-9 
				DrawImage(healthbar_9,boss.x+40,boss.y-40) 'draw health bar above the boss
			Elseif Boss_Hp<=7 And Boss_Hp>=6  Then  'if boss health is 7-6
				DrawImage(healthbar_7,boss.x+40,boss.y-40) 'draw health bar above the boss
			Elseif Boss_Hp<=5 And  Boss_Hp>=4   Then  'if boss health is 5-4
				DrawImage(healthbar_5,boss.x+40,boss.y-40) 'draw health bar above the boss
			Elseif Boss_Hp<=3 Then  'if boss health is less than 3
				DrawImage(healthbar_3,boss.x+40,boss.y-40) 'draw health bar above the boss
			End 
			'powerup (speed)
			For Local speed:=Eachin speed_powerup ' for each speed powerup
				DrawImage speed.sprite, speed.x, speed.y ' draw speed image
			Next
		Case "LEVEL2"
			DrawImage(background_2,0,0) ' level 2 design
			level_2.draw ' draws the tiles
			DrawText("LIVES=",20,20) ' draws Lives text
			If health=3  'if health=3 then draw 3 hearts
				DrawImage(Heart,110,20) 'draws heart
				DrawImage(Heart,130,20)'draws heart 
				DrawImage(Heart,150,20)'draws heart
			Elseif health=2 'if health =2 draw 2 hearts 
				DrawImage(Heart,110,20)'draws heart
				DrawImage(Heart,130,20)'draws heart
			Elseif health=1 'if health=1 draw 1 heart
				DrawImage(Heart,110,20)'draws heart
			End 
			
			If bullet_count<9 Then   ' if bullet count is less than 9
					DrawText("MULTI SHOT TIME::"+(10-bullet_count),20,660) ' Displays multshot timer
			Elseif bullet_count>=9 And bullet_count<=11Then  ' if its greater or equal to 9 and less than or equal to 11
				DrawText("MULTISHOT IS READY",20,660) ' displays that multishot is ready
			Else
				DrawText("MULTI SHOT TIME :10",20,660) 'Displays multshot timer
			End  
			
			DrawText("SCORE="+score,20,40) ' draws score
			DrawImage player.sprite, player.x, player.y		' draws the player sprite
				For Local missile:=Eachin missile_collection ' looks at each bullet
				DrawImage missile.sprite, missile.x, missile.y ' draws each bullet
			Next
			For Local missile:=Eachin missile_collection2 ' looks at each bullet
				DrawImage missile.sprite, missile.x, missile.y  ' draws each bullet
			Next
			
			'enemy zombies	
				For Local enemy:=Eachin strongzombie_collection ' looks at each strong zombie
					DrawImage enemy.sprite, enemy.x, enemy.y ' draws each zombie
				Next 
				'boss healthbar
				If Boss_Hp<=9 And Boss_Hp>=8 Then  ' If boss health is 8-9 
				DrawImage(healthbar_9,boss_level2.x+40,boss_level2.y-40) 'draw health bar above the boss
			Elseif Boss_Hp<=7 And Boss_Hp>=6  Then  'if boss health is 7-6
				DrawImage(healthbar_7,boss_level2.x+40,boss_level2.y-40) 'draw health bar above the boss
			Elseif Boss_Hp<=5 And  Boss_Hp>=4   Then  'if boss health is 5-4
				DrawImage(healthbar_5,boss_level2.x+40,boss_level2.y-40) 'draw health bar above the boss
			Elseif Boss_Hp<=3 Then  'if boss health is less than 3
				DrawImage(healthbar_3,boss_level2.x+40,boss_level2.y-40) 'draw health bar above the boss
			End 
			'boss
			If time<=280 Then DrawImage boss_level2.sprite, boss_level2.x, boss_level2.y'if timer is less than or equal to 280 it becomes image 1 of necromancer
			If time>=280  Then DrawImage boss_level2.sprite2, boss_level2.x, boss_level2.y ' if timer is bigger than or equal to 280 it becomes image 2 of necromancer
			For Local minion:=Eachin minion_collection ' loops through every minion
					DrawImage minion.sprite, minion.x, minion.y ' draws each minion
			End 		
		Case "LEVEL3"
			
			DrawImage(background_3,0,0) ' level 3 background 
			level_3.draw ' draws tiles / level design
			DrawText("LIVES=",20,20) ' draws Lives text
			If health=3  'if health=3 then draw 3 hearts
				DrawImage(Heart,110,20) 'draws heart
				DrawImage(Heart,130,20) 'draws heart
				DrawImage(Heart,150,20)'draws heart
			Elseif health=2 'if health =2 draw 2 hearts 
				DrawImage(Heart,110,20)'draws heart
				DrawImage(Heart,130,20)'draws heart
			Elseif health=1 'if health=1 draw 1 heart
				DrawImage(Heart,110,20)'draws heart
			End 
			
			If bullet_count<9 Then   ' if bullet count is less than 9
					DrawText("MULTI SHOT TIME::"+(10-bullet_count),20,660) ' Displays multshot timer
			Elseif bullet_count>=9 And bullet_count<=11Then  ' if its greater or equal to 9 and less than or equal to 11
				DrawText("MULTISHOT IS READY",20,660) ' displays that multishot is ready
			Else
				DrawText("MULTI SHOT TIME :10",20,660) 'Displays multshot timer
			End  
			
			DrawText("SCORE="+score,20,40) 'draws score
			DrawImage player.sprite, player.x, player.y	'draws player
			For Local missile:=Eachin missile_collection 'draws missiles
				DrawImage missile.sprite, missile.x, missile.y
			Next
			
			'player missile
			For Local missile:=Eachin missile_collection2 'looks through each missile
				DrawImage missile.sprite, missile.x, missile.y  'draws each missile
			Next
			'enemy zombies
			For Local enemy:=Eachin brutalzombie_collection 'loops  through each zombie
				DrawImage enemy.sprite2, enemy.x, enemy.y ' draws each zombie
			Next
			
			'Boss 
			DrawImage boss_level3.sprite, boss_level3.x, boss_level3.y ' draws the zombie king
			'zombie claw
				For Local enemy:=Eachin zombieclaw_collection
					DrawImage enemy.sprite, enemy.x, enemy.y ' draws each zombie claw
				Next 
			'Boss healthbar
			If Boss_Hp<=9 And Boss_Hp>=8 Then  ' If boss health is 8-9 
				DrawImage(healthbar_9,boss_level3.x+40,boss_level3.y-40) 'draw health bar above the boss
			Elseif Boss_Hp<=7 And Boss_Hp>=6  Then  'if boss health is 7-6
				DrawImage(healthbar_7,boss_level3.x+40,boss_level3.y-40) 'draw health bar above the boss
			Elseif Boss_Hp<=5 And  Boss_Hp>=4   Then  'if boss health is 5-4
				DrawImage(healthbar_5,boss_level3.x+40,boss_level3.y-40) 'draw health bar above the boss
			Elseif Boss_Hp<=3 Then  'if boss health is less than 3
				DrawImage(healthbar_3,boss_level3.x+40,boss_level3.y-40) 'draw health bar above the boss
			End 
			
		Case "HELP"
			 DrawImage (helpbackground ,0,0) 'draws help background
		Case "LEADERBOARD"
			DrawImage(LeaderBoard, 0,0) ' draws leaderboard image
			For Local rank:=0 Until 10 ' loop which iterates until its equal to 10- only top 10 names will be shown
				DrawText(" "+(rank+1)+")"+playerscores[rank]+" "+names[rank].ToUpper(),650,200+(rank*15)) ' draws leaderboard-Rank numbers,names and scores
				Scale(1,1.05) ' increase the size of the leaderboard
			Next
			
		Case "GAMEOVER"
			DrawImage(Game_Over,0,0) ' draw game over screen			
			
		Case "LEVEL_1_COMPLETION"
			DrawImage(Level_Completion,0,0) ' draw level completion screen
		Case "LEVEL_2_COMPLETION"
			DrawImage(Level_Completion2,0,0) ' draw level completion screen
		Case "Game_Complete"
			DrawImage(Game_Completion,0,0) ' draw game completion screen
	End 
End 
End 
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class Character
	Field sprite:Image ' access to sprite image
	Field x:Int ' x position of character
	Field y:Int 'y position of character
	Field speed:Int ' speed of character
	Field speed_x:Int ' x direction speed
	Field speed_y:Int ' y direction speed
	Method draw()
		DrawImage sprite, x, y ' method which draws the sprite
	End
End
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class Bullets
	Field sprite:Image = LoadImage ("bullet.png")
	Field x:Float ' x position of bullet
	Field y:Float' y position of bullet
	Method New(x_spawn:Int,y_spawn:Int)
		x = x_spawn+24  'distance  it fires from the player
		y = y_spawn
	End
	Method Move(x_distance:Int)
			x-=x_distance 'fires in the x axis	to the right	
	End
	
End
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class Bullets2
	Field sprite:Image = LoadImage ("bullet_flipped.png")
	Field x:Float
	Field y:Float
	Method New(x_spawn:Int,y_spawn:Int)
		x = x_spawn+15  'distance  it fires from the player
		y = y_spawn
	End
	Method Move(x_distance:Int)
			x+=x_distance 'fires in the x axis	to the left
	End
End
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class Boss_Bullets
	Field sprite:Image = LoadImage ("boss_bullet.png")
	Field x:Float
	Field y:Float
	Method New(x_spawn:Int,y_spawn:Int)
		x = x_spawn+65 'distance  it fires from the Boss
		y = y_spawn+40
	End
	Method Move(x_distance:Int)
			x-=x_distance 'fires in the x axis	to the right
	End
End
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class Zombie
	Field sprite:Image = LoadImage ("zombie1.png")
	Field x:Float 'x position
	Field y:Float 'y position
	Method New(x_spawn:Int,y_spawn:Int)
		x = x_spawn
		y = y_spawn
	End
	Method Move(x_distance:Int)  'Move left to right
	x+=x_distance
	End
End 
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class Strong_Zombie 
	 Field sprite:Image = LoadImage ("zombie2.png") ' the sprite image of my zombie
	Field x:Float ' x position 
	Field y:Float 'y position
	Method New(x_spawn:Int,y_spawn:Int) 'used to spawn new instances of the zombie
		x = x_spawn
		y = y_spawn
	End
	Method Move(x_distance:Int)  'Moves in the x direction (right or left) 
	x+=x_distance
	End
End 
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class Brutal_Zombie Extends Strong_Zombie ' inherits attributes and methods from the super class (Strong_Zombie)
 Field sprite2:Image = LoadImage ("zombie3.png") ' loads the zombie image 
	
	Method New(x_spawn:Int,y_spawn:Int) '  'used to spawn new instances of the zombie   
		Super.New(x_spawn,y_spawn) ' calls the constructer of the parent class and passes the variables 
	End
	Method Move(x_distance:Int)  'Move  right to left 
		x+=x_distance
	End
End 
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class Boss_Zombie  
Field sprite:Image = LoadImage ("boss_zombie.png") ' loads sprite
Field x:Float = 300  'spawn area
Field y:Float = 100
	Method Move(y_distance:Int)
		y-=y_distance 'Moves right 	
	End
End
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class Necromancer  
Field sprite:Image = LoadImage ("necromancer.png") ' loads first image
Field sprite2:Image=LoadImage("necromancer2.png") ' loads second image
Field x:Float = 800  'spawn area
Field y:Float = 400
	Method Move(y_distance:Int)
		y-=y_distance 'Moves up or down (y direction)
	End
End
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class minion
	Field sprite:Image = LoadImage("minion.png") ' loads the minion image 
	Field x:Int
	Field y:Int
	Field speed:Int=2  ' uses speed to compare to the character speed ( base speed)
	Field speed_x:Int ' speed in x direction
	Field speed_y:Int 'speed in y direction
	Method New(x_spawn:Int,y_spawn:Int) 'used to spawn minions 
		x = x_spawn 
		y = y_spawn
	End
End

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class Zombie_King
Field sprite:Image = LoadImage ("Zombie_King.png") ' loads zombie king sprite
Field x:Float = 800  'spawn area
Field y:Float = 400
	Method Move(y_distance:Int)
		y-=y_distance 'direction of movement (y up or down)	
	End
End
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class Zombie_Claw 
Field sprite:Image = LoadImage ("zombie_claw.png") 'loads zombie claw sprit
	Field x:Float 'x position
	Field y:Float 'y position
	Method New(x_spawn:Int,y_spawn:Int) 'used to spawn a new instance of the claw
		x = x_spawn
		y = y_spawn
	End
	Method Move(x_distance:Int)  'Moves x direction (left or right)
	x+=x_distance
	End
End 
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class Speed 'Power up which speeds up movement and bullet speed
Field sprite:Image = LoadImage ("speed.png") 'loads in image
Field x:Float  'spawn area
Field y:Float 
	Method New(x_spawn:Int,y_spawn:Int) 'Initialises  x and y and allows multiple speed powerups to spawn,
		x = x_spawn
		y = y_spawn
	End
End 
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class Level 
	Field tiles:String[17][]  '16 tiles wide but a extra one to make it easier.
	Field tileset:Image
	
	Const purple_tile=1 'First image in the tileset 
	Const red_tile=2'Second image in the tileset
	
	Method New()
		tileset = LoadImage ("tileset.png",64,50,3) 'has a group of images  (pixel size is 64x50) (3 images)
		For Local i:Int = 0 To 16 ' Insililasing the array 16x14 
			tiles[i] = New String[15] '15 to make it easier in future
		Next
	
	End 
	Method load() 'reads the data into the array
		Local level_file:FileStream 'pointer of the array 
		Local level_data:String ' contains the data file
		Local data_item:String[] 'a row of the data file
		level_file = FileStream.Open("monkey://data/level1.txt","r") 'opens array text file
		level_data = level_file.ReadString() ' reads the file
		level_file.Close  ' closes the file

		data_item = level_data.Split("~n") 'splits the rows
		For Local y:Int = 0 To 13 ' a loop which iterates through all the rows and columns and converts them to integers
			For Local x:Int = 0 To 15
			tiles[x][y]=Int(data_item[y][x..x+1]) 'extracts characters from string
			Next
		Next
	End
	Method draw() ' draws each tile
		Local tile:String 
		For Local y:Int = 0 To 13 'nested loop to initiliase array then  draws tiles
			For Local x:Int = 0 To 15
				tile = tiles[x][y]
				If tile = purple_tile Then DrawImage tileset, x*64, y*50, purple_tile 'calculates the position of the tiles
					If tile = red_tile Then DrawImage tileset, x*64, y*50, red_tile 
			Next
		Next
	End
	Method tile_hit:Int (x:Int,y:Int)' checks if tiles have collided.
		'tile collesiion checks the 4 possible collision tiles
		Local left_tile:Int = x / 64 ' left tile
		Local right_tile:Int = (x+63) / 64 ' right tile
		Local top_tile:Int = y / 50 'top tile
		Local bottom_tile:Int = (y+49) / 50 ' bottom tilel
		'theses check that the tiles aren't out of bound of the array (0-15)
		If left_tile < 0 Then left_tile = 0 ' checks if they the left tile is less than 0 
		If right_tile > 15 Then right_tile = 15  ' checks if the right tile is less than 15
		If top_tile < 0 Then top_tile = 0 ' checks if the top tile is less than 0 
		If bottom_tile > 13 Then bottom_tile = 13 ' checks if the bottom tile is less than 13
	
		'This checks each of the four possible tiles, and returns the value of the tile hit.
		Local collision_result:Int = 0 ' set result as 0
		For Local i:Int = left_tile To right_tile 'loop whiich checks left and right tile
			For Local j:Int = top_tile To bottom_tile 'loop which looks at top and bottom tile
				If tiles[i][j] = purple_tile Then collision_result = purple_tile ' if tile collide to a purple tile then return purple tile
				If tiles[i][j] = red_tile Then collision_result = red_tile  'if tile collide to a red  tile then return red tile
		Next
	Next
	Return collision_result ' returns a value of the tile hit
	End
End

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class Level2  Extends Level 'takes the attributes and methods from the parent class (level)
	Method New()
		tileset = LoadImage ("tileset2.png",64,50,3) 'has a group of images  (pixel size is 64x50) (3 images)
		For Local i:Int = 0 To 16 ' Insililasing the array 16x14 
			tiles[i] = New String[15] '15 to make it easier in future
		Next
	
	End 
	Method load() 'reads the data into the array
		Local level_file:FileStream 'pointer of the array 
		Local level_data:String ' contains the data file
		Local data_item:String[] 'a row of the data file
		level_file = FileStream.Open("monkey://data/level2.txt","r") 'opens array text file
		level_data = level_file.ReadString() ' reads the file
		level_file.Close  ' closes the file

		data_item = level_data.Split("~n") 'splits the rows
		For Local y:Int = 0 To 13 ' a loop which iterates through all the rows and columns and converts them to integers
			For Local x:Int = 0 To 15
			tiles[x][y]=Int(data_item[y][x..x+1]) 'extracts characters from string
			Next
		Next
	End
	Method draw()
		Super.draw() ' calls the constructer of the parent class and passes the variables 
	End 
	Method tile_hit:Int (x:Int,y:Int)' 
		'tile collesiion checks the 4 possible collision tiles
		Local left_tile:Int = x / 64 ' left tile
		Local right_tile:Int = (x+63) / 64 ' right tile
		Local top_tile:Int = y / 50 'top tile
		Local bottom_tile:Int = (y+49) / 50 ' bottom tilel
		'theses check that the tiles aren't out of bound of the array (0-15)
		If left_tile < 0 Then left_tile = 0 ' checks if they the left tile is less than 0 
		If right_tile > 15 Then right_tile = 15  ' checks if the right tile is less than 15
		If top_tile < 0 Then top_tile = 0 ' checks if the top tile is less than 0 
		If bottom_tile > 13 Then bottom_tile = 13 ' checks if the bottom tile is less than 13
	
		'This checks each of the four possible tiles, and returns the value of the tile hit.
		Local collision_result:Int = 0 ' set result as 0
		For Local i:Int = left_tile To right_tile 'loop whiich checks left and right tile
			For Local j:Int = top_tile To bottom_tile 'loop which looks at top and bottom tile
				If tiles[i][j] = purple_tile Then collision_result = purple_tile ' if tile collide to a purple tile then return purple tile
				If tiles[i][j] = red_tile Then collision_result = red_tile  'if tile collide to a red  tile then return red tile
		Next
	Next
	Return collision_result ' returns a value of the tile hit
	End
End

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Class Level3  Extends Level 
	
	Method New()
		tileset = LoadImage ("tileset3.png",64,50,3) 'has a group of images  (pixel size is 64x50) (3 images)
		For Local i:Int = 0 To 16 ' Insililasing the array 16x14 
			tiles[i] = New String[15] '15 to make it easier in future
		Next
	
	End 
	Method load() 'reads the data into the array
		Local level_file:FileStream 'pointer of the array 
		Local level_data:String ' contains the data file
		Local data_item:String[] 'a row of the data file
		level_file = FileStream.Open("monkey://data/level3.txt","r") 'opens array text file
		level_data = level_file.ReadString() ' reads the file
		level_file.Close  ' closes the file

		data_item = level_data.Split("~n") 'splits the rows
		For Local y:Int = 0 To 13 ' a loop which iterates through all the rows and columns and converts them to integers
			For Local x:Int = 0 To 15
			tiles[x][y]=Int(data_item[y][x..x+1]) 'extracts characters from string
			Next
		Next
	End
	Method draw()
		Super.draw() ' calls the constructer of the parent class and passes the variables 
	End 
	Method tile_hit:Int (x:Int,y:Int)' 
		'tile collesiion checks the 4 possible collision tiles
		Local left_tile:Int = x / 64 ' left tile
		Local right_tile:Int = (x+63) / 64 ' right tile
		Local top_tile:Int = y / 50 'top tile
		Local bottom_tile:Int = (y+49) / 50 ' bottom tilel
		'theses check that the tiles aren't out of bound of the array (0-15)
		If left_tile < 0 Then left_tile = 0 ' checks if they the left tile is less than 0 
		If right_tile > 15 Then right_tile = 15  ' checks if the right tile is less than 15
		If top_tile < 0 Then top_tile = 0 ' checks if the top tile is less than 0 
		If bottom_tile > 13 Then bottom_tile = 13 ' checks if the bottom tile is less than 13
	
		'This checks each of the four possible tiles, and returns the value of the tile hit.
		Local collision_result:Int = 0 ' set result as 0
		For Local i:Int = left_tile To right_tile 'loop whiich checks left and right tile
			For Local j:Int = top_tile To bottom_tile 'loop which looks at top and bottom tile
				If tiles[i][j] = purple_tile Then collision_result = purple_tile ' if tile collide to a purple tile then return purple tile
				If tiles[i][j] = red_tile Then collision_result = red_tile  'if tile collide to a red  tile then return red tile
		Next
	Next
	Return collision_result ' returns a value of the tile hit
	End
End

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Function name_score:Int(name:String,score:Int) ' name and score is passed to the function (stores name and score)
	Local scores_file:FileStream 'local variable which will hold the file 
	Local scores_value:String' holds the value as a string
	scores_file=FileStream.Open("E:/Computer Science-Coursework/Game-Coursework/zombieshooter.data/score.txt","a") 'opens file in amend mode
	scores_value=String(score) 'sets score as string
	scores_file.WriteString(scores_value+","+name+"~r~n") 'writes score and name in a new line
	scores_file.Close 'closes file
	Return 1 'returns 1 because a function must return a value
End 

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Function Ten_Scores() ' function which stores 10  the scores and names in descending order
	Local scores_file:FileStream 'creates a local variable which accesses the file
	Local scores_data:String ' sets the variable as a string
	Local scoresInt:Int  'sets the variable as integer
	Local HighscoreList:=New IntList 'creates a variable as a list which will store integers
	Local counter:Int ' sets the counter as a integer
	Local last:Int 'sets the variable as a integer
	Local itemcount:Int 'sets the variable as a integer
	scores_file=FileStream.Open("E:/Computer Science-Coursework/Game-Coursework/zombieshooter.data/score.txt","r") 'Setting the path for the score file
	scores_data=scores_file.ReadString()  'score data is equal to the score file and is read as string
	scores_file.Close 'close score file
	For Local eachScore:String=Eachin  scores_data.Split("~n") 'loop which splits data into new lines holding the value of score_File
		scoresInt=Int(eachScore)'convert the string into integer ' converts the scores into a integer
		HighscoreList.AddLast	scoresInt 'add to end of the highscorelist array '
	Next
	HighscoreList.Sort(False) 'sorts the scores in desendign order
	For Local pointer=0 Until 10 ' counter control loop
		playerscores[pointer]=0 'sets pointer to 0
		names[pointer]="" 'sets each of the names to a empty string
	Next 
	
	counter=0 ' counter is set to 0
	For Local smallest=Eachin HighscoreList  ' Finding the 10th item in the list. This value is stored in last variable 
		If counter=10 Then 
			last= smallest 'cut	off point- if the last value equals the smallest variable
		End If 
		counter +=1 'counter is incremented by 1
	Next
	'to generate the index for the name and score arrays
	counter=0'counter is set to 0
	'at the end of running the for loop,you willl have playerscores array with top 10 scores and name array with the corresponding names for the top 10 scores.
	For Local score:String=Eachin scores_data.Split("~n")
		itemcount=0
		For Local item:String=Eachin score.Split(",")
			'checking the scores in the list is above the 10th score then ad the name and the score to the array
			If itemcount=0 And Int(item)>= last Then 
				playerscores[counter]=Int(item)
			End If 
			If itemcount=1 And playerscores[counter]>= last Then 
				names[counter]=item
			End If
			itemcount +=1
		Next
		If playerscores[counter]>=last And counter< 10 Then 
			counter +=1
		Endif 
	Next
	InsertionSort() 'uses insertion sort to sort the leaderboard.
	Return 1 ' function so it has to return a value
	End 
	

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Function InsertionSort:Void() 'insertion sort
	For Local index:Int=1 Until playerscores.Length  'looks at the values of player score
		Local value:Int=playerscores[index] ' current value
		Local item:String=names[index] ' current name item
		Local previous:Int =index-1  ' previous index
		'checks if the previous value is larger then the next value and keeps comparing until the value is smaller. This sorts the items into place
		While ((previous>=0) And (playerscores[previous]<value)) ' checks if the previous value is bigger than 0 and if its smaller than the current value
			playerscores[previous+1]=playerscores[previous]  ' makes the next value the previous value
			names[previous+1]=names[previous]  'makes the next name value the previous value
			previous-=1 'previous is decreased by 1
		Wend
		playerscores[previous+1]=value 'makes the previous item the current value 
		names[previous+1]=item 'makes the previous name  item the curent item
	Next
End Function


'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Function intersects:Bool (x1:Int, y1:Int, w1:Int, h1:Int, x2:Int, y2:Int, w2:Int, h2:Int)  'takes x and y 
If x1 >= (x2 + w2) Or (x1 + w1) <= x2 Then Return False
If y1 >= (y2 + h2) Or (y1 + h1) <= y2 Then Return False
Return True
End