if(done == 0) 
{
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
		hsp = 0;
	}
	x += hsp;

	//Vertical Collision
	if (place_meeting(x,y+vsp,objWall))
	{
		if(vsp > 0)
		{
			done = 1;
			image_index = 1; 
		}
		
		while(!place_meeting(x,y+sign(vsp),objWall))
		{
				y += sign(vsp);
		}
		vsp = 0;
	}
	y += vsp;
}