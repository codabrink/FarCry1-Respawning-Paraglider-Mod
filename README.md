# FarCry1-Respawning-Paraglider-Mod

### Important Note
    This does not work in it's current state. It'll cause multiplayer games to crash.
    In order to get this to work, the paraglider needs to "die" first, before respawning.
    I haven't had the time to fix this yet.

A mod for FarCry1 to allow for Paragliders to respawn with the onAbandon hook in the editor. (Multiplayer)

Built for GOG.com's release of FarCry1, but should technically work with any FarCry1 release.
You'll just need to point the installer to the root of your FarCry installation manually if your install is not from GOG.

To use mod - connect a Paraglider's `On Abandoned` event to a multiplayer Phoenix. That's it. :) The paraglider will now start respawning after use.

Keep in mind that I have not tested this in a networked environment yet. It works when I'm the only person in the match, but may cause desyncs when another player with the mod is in the game. I will test soon.

Download installer [here](https://github.com/codabrink/FarCry1-Respawning-Paraglider-Mod/releases/download/0.0.1/ParagliderMod.exe).

![example](https://i.imgur.com/ezVJK8s.jpg)
