# odin_playplay_haihai
Some odin fun playing bc I'm bored.

## Some thoughts.

I just wrote a simple set of packages that run a game engine that does nothing, a window, and a renderer. The interactions among them are interesting.

The refactorability and code moving flexibility of odin is really nice actually. I think this language I'm gonna like a lot.

It'll be kinda a bit of a pain to figure out exactly how I'll get it to work for something like vulkan, however. I think that it will be good, but not really in the beginning.

At the very least I think that package/interface creation is a lot more sleek. And I'm excited to see how it goes with speed (especially since it's somewhere between c and c++ as far as speed afaik).

I think the below would have to be available/figured out for me to want to make a full fledged game engine in it:
- Jolt Physics
- Vulkan Rendering
- cglm (or any simd math library)

~~Or, honestly, maybe just using the directx suite could work? Ahhhh but then I'd have to develop cross-compiling to windows and then use the proton layer for everything.~~

So honestly, I would probs start with OpenGL as a base until basic game engine/mechanic stuff is created, and then move to using vulkan and work on the renderer to fully flesh out the game.

Especially if I'm creating a sekiro-like, it would definitely be a very difficult to do type of game I would figure.


## Some game idea thoughts.

But perhaps the first thing I should try doing is creating a simple collect and explore puzzler with a story? And then after that create the sekiro-like game with the collect and explore puzzler as a base?

That would be nice I think. First making the puzzle-platformer and collector where things are collected and then you explore the areas to find exactly where stuff is via navigating the environment. Have this be floating islands system or no?
  - This game could simply be just a set of cylinders running around. Or it could be a grid set? Like sokoban? Like Link to the Past? Like a 3D Zelda game?
    - If it is top-down, I think that having a directional detection for parrying and attacking is a must.
    - ^^ It would prevent the need to have jolt physics or some kind of physics ig ya?
    - But hey, I really would like to create some kind of 3D platformer type game as well???

Then have Sekiro-like gameplay incorporated where it's the same game but using the collected materials/items for weapon materialization and parrying and attacking.
