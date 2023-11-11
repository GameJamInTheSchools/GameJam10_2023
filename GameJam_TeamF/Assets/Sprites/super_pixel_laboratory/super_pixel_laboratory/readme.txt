////////////
// THANKS //
////////////

Hi there, this is Will from unTied Games! Nice to meet you.

Super huge THANK YOU for downloading this asset... It means a lot to me that you've chosen it for your game!
If you use this asset in your game, give me a shoutout if you can at @untiedgames, so I can follow along on your development journey!
Want to follow me? Sign up for my newsletter! Or follow me using the Twitter / FB / Youtube links below.
Newsletter signup: http://untiedgames.com/signup

Did you know? You can get access to ALL of my assets if you support me on Patreon!
Check it out: http://patreon.com/untiedgames
You read that right! At the $10 tier, you can get access to ALL of my assets. Not your cup of tea? At the $5 tier, you can get access to all my assets that are 1 year old or more. There's also a lot more than just pixel art... I make Youtube videos, indie games, development logs, and more!

MORE LINKS:
Browse my other assets: untiedgames.itch.io/
Watch me make pixel art, games, and more: youtube.com/c/unTiedGamesTV
Follow on Facebook: facebook.com/untiedgames
Follow on Twitter: twitter.com/untiedgames
Visit my blog: untiedgames.com

Thanks again,
- Will

/////////////////////
// VERSION HISTORY //
/////////////////////

Version 1.0 (2/21/20)
	- Initial release

///////////////////////////
// HOW TO USE THIS ASSET //
///////////////////////////

Hello! Thank you for downloading the Super Pixel Laboratory Tileset. Here are a few pointers to help you navigate and make sense of this zip file.

- In the root folder, you will find style folders. These folders correspond to each tileset color style.

- In the style folders, you will find a folder named PNG. This folder contains all the objects and tiles as descriptively-named PNGs.

- In the style folders, you will also find a folder named spritesheet. This folder contains the spritesheet, and an easy-to-parse metadata format for reading the spritesheet. The metadata format is: asset_name = x y w h.

- UNITY USERS: I recommend adding the individual PNGs to your project rather than using the spritesheets. The spritesheet is aligned to a 16x16 grid, but if you try to slice it in Unity you'll notice not every asset is 16x16 (e.g. the background images, larger slope tiles, etc). So while slicing will work for the basic tiles, please use the already-sliced PNG files in the PNG folders for best results.

- You can help make sense of the labels using the following guide, which applies to all my tilesets.

File name definitions:
	- "terrain"				Part of the tileset's terrain. The player probably stands on this.

	- "left/right/top/bottom"		The left/right/top/bottom wall or edge of the terrain. Directions ALWAYS refer to the surface normal, but if you're not sure take a look at the spritesheet!

	- "terrain_fill"			The inner part of the terrain. It's optional! You can go without it for smaller platforms, or if you want a simpler design.

	- "midground"				Tiles that should be placed behind the terrain and behind the player.

	- "midground_fill"			The inner part of the midground.

	- "midground_shadowed"			A part of the midground that has a shadow on it. Use it to add depth to your level!

	- "_inner"				An inner corner tile. All corners not labeled "inner" are outer corners.

	- "platform"				Part of the terrain that can be used to make a Nx1 platform.

	- "pillar"				Part of the terrain that can be used to make a 1xN pillar.

	TIP: Pillars and platforms can intersect with other terrain and each other! There are special tiles that allow for platform/pillar intersection, platform/terrain intersection, and pillar/terrain intersection. Platforms can also turn into pillars and vice-versa by using the appropriate corner piece. (For example, to create an L-shaped piece out of a pillar and a platform, the corner of the L would be the terrain_platform_bottom_left.png tile.)

	- "bg", "bg1", "bg2", etc.		Background. If there's a number, a higher number indicates further back.

	- "fg", "fg1", "fg2", etc.		Foreground. If there's a number, a higher number indicates further forwards.

	- "near", "far"				Usually for backgrounds, specifies which part is closer and which part is further in the distance.

	- "_A", "_B", "_C", etc.		A suffix with a letter indicates there are multiple variants of this object. Objects with letter suffixes are almost always interchangeable, depending on the tileset.
						Don't worry if there's an "A" without a "B"! That means if I include more variants of this object in an update, you won't have to worry about tile name changes.

	- "frame0000", "frame0001", etc.	Filenames like this indicate an animation.
	  or "f0", "f1", etc.

	- "2x2", "4x4", etc.			Indicates the size of this object, in tiles.

SUPER PIXEL LABORATORY SPECIFIC TIPS
	- Both fog layers loop horizontally. They're designed for parallax scrolling. Try auto-scrolling them!
	- For added atmosphere, try slowly fading the glow layer in and out.
	- The bg_pillars_A layer is interchangeable with bg_pillars_B. If you need the background to loop vertically, use B.

SUPER PIXEL LABORATORY LAYER ORDER (Front to back)
	- FG terrain (railings)
	- Terrain
	*** DRAW YOUR PLAYER HERE ***
	- Midground tubes
	- Midground
	- BG fog near
	- BG fog far
	- BG glow
	- BG wall

- Pretty much every object and tile is a size multiple of 16x16 pixels. They're made to stick to a 16x16 grid, but you don't necessarily have to stick to a grid if you don't want to.

- Be sure to check out the included example images (wallpapers) to see how to put the tileset together.

Any questions?
Email me at contact@untiedgames.com and I'll try to answer as best I can!

-Will