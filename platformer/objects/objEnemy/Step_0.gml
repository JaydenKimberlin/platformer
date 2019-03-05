vsp = vsp + grv;

//Jumping

if (place_meeting(x,y+1,objWall)) //If you're on the ground...
{
	jumps = maxJumps; //You have 2 jumps
}

//Horizontal Collision
if (place_meeting(x+hsp,y,objWall))
{
	while(!place_meeting(x+sign(hsp),y,objWall))
	{
			x += sign(hsp);
	}
	hsp = -hsp;
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
	sprite_index = sprEnemyJumping;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
} else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sprEnemy
	} else
	{
		sprite_index = sprEnemyRunning;
	}
}
//Check Direction
if (hsp != 0) image_xscale = sign(hsp);