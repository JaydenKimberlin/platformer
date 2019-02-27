//Get Player Input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);


//Calc Movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

//Jumping

if (place_meeting(x,y+1,objWall)) //If you're on the ground...
{
	jumps = maxJumps; //You have 2 jumps
}

if(jumps > 0) && (key_jump) //If your jumps are greater than 0 (2) and you jump
{
	jumps -= 1; //Remove one from the jump count
	vsp = -5; //Jump 5 high
}

//Horizontal Collision
if (place_meeting(x+hsp,y,objWall))
{
	while(!place_meeting(x+sign(hsp),y,objWall))
	{
			x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,objWall))
{
	while(!place_meeting(x,y+sign(vsp),objWall))
	{
			y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

//Animation
if (!place_meeting(x,y+1,objWall))
{
	sprite_index = sprPlayerJumping;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
} else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sprPlayer
	} else
	{
		sprite_index = sprPlayerRunning;
	}
}
//Check Direction
if (hsp != 0) image_xscale = sign(hsp);
