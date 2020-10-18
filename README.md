# Midsemester Jam: The Climb to Daylight
A midsemester game jam for CS 315

### GitHub Pages Web Release
[The Climb to Daylight](https://bsu-cs315.github.io/MJ-ClimbToDaylight/)

## Project Report
### Reflection:
The inspiration for this jumper/climber style of game came from a game titled "Celeste." I recently found this game and loved the style and concept of it, and wanted to try something similar. I loved looking into how to wrap the player around the screen sides, and especially loved when it wasn't as hard as I thought it would be. The most difficult part for this style of game was getting the camera to only follow the player upwards and not follow them back down when they fell. This took some tweaking with the camera limits and drag_margins, but eventually I got it to work almost exactly how I envisioned it. I also had an issue for a bit with detecting the collisions with all the randomly spawned books, and making sure one of the books was hitting the player. I liked the idea of randomly spawned obstacles, and used a few of the ideas from the very first game tutorial. The problem I ran into was that the body_id for every randomly spawned book was different. However, once I thought about it it was fairly easy to get working with the use of an int array and GDScript's handy append function.

### Self-Evaluation:
- [x] D-1: The repository link is submitted to Canvas before the project deadline.
- [x] D-2: The repository contains a <code>README.md</code> file in its top-level directory.
- [x] D-3: The project content is eligible for an <a href="https://www.esrb.org/ratings-guide/">ESRB Rating</a> of M or less.
- [x] C-1: Your repository is well-formed, with an appropriate <code>.gitignore</code> file and no unnecessary files tracked.
- [x] C-2: Your release is tagged using <a href="https://semver.org/">semantic versioning</a> where the major version is zero, the minor version is the iteration number, and the patch version is incremented as usual for each change made to the minor version, and the release name matches the release tag.
- [x] C-3: You have a clear legal right to use all incorporated assets, and the licenses for all third-party assets are tracked in the <code>README.md</code> file.
- [x] C-4: The <code>README.md</code> contains instructions for how to play the game or such instructions are incorporated into the game itself.
- [x] C-5: The project content is eligible for an <a href="https://www.esrb.org/ratings-guide/">ESRB Rating</a> of T or less.
- [x] C-6: The game is stable and includes some gameplay.
- [ ] B-1: The <code>README.md</code> file contains a personal reflection on the iteration and self-evaluation, as defined above.
- [x] B-2: The source code and project structure comply with our adopted style guides.
- [x] B-3: The game runs to a clear end state.
- [x] A-1: The game includes a complete traditional player experience loop&mdash;title, gameplay, and ending&mdash;and the player has the option to play again.

## Third-Party Assets:
Sprites:

`2D Game Zombie Character` sprite pack licensed free for use (https://craftpix.net/file-licenses/). Source: https://craftpix.net/freebies/2d-game-zombie-character-free-sprite-pack-1/

`100 furniture sprites` sprite set licensed "Free for non-commercial use". Source: https://www.deviantart.com/neoriceisgood/art/100-furniture-sprites-405058884

`Pixel art wood planks` tilset licensed under [Attribution 4.0 Iternational (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/). Source: https://ipixl.itch.io/pixel-art-wood-planks-tileset

`Book Animation` sprite set licensed under [Attribution 3.0 Unported (CC BY 3.0)](https://creativecommons.org/licenses/by/3.0/). Source: https://opengameart.org/content/book-animation

<br>
Fonts:

`Retro Computer` font licensed "Free for Personal Use". Source: https://www.dafont.com/retro-computer.font

`Creepster` font licensed under [SIL Open Font License (OFL)](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL). Source: https://www.1001fonts.com/creepster-font.html#more

`CryptCreep` font licensed "Free for Personal Use". Source: https://www.1001fonts.com/cryptcreep-font.html

<br>
Sounds:

`Jump Hop` sound licensed under [Attribution 3.0 Unported (CC BY 3.0)](https://creativecommons.org/licenses/by/3.0/). Source: https://freesound.org/people/felixyadomi/sounds/456373/

`Spook` loop licensed under [Creative Common Zero (CCO)](https://creativecommons.org/publicdomain/zero/1.0/). Source: https://freesound.org/people/wi-photos/sounds/505664/