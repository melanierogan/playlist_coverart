Playlist Coverart Generator 
--------------
--------------


A short Ruby app that takes a background image and overlays the title of the playlist.
This is then saved in png format set to the size acceptable for Spotify image uploads. 


Usage 
----------

* `git clone`
* run `bundle` in the directory you cloned in
* place the background image you want to use in `./img` and call it `background.png`
* place your logo in `./img`
* run irb
* require './lib/cover'
* run `OverlayGenerator.new("The text you want", "./img/thelogoyouwant.png").perform`
* your image is saved in `./img/generated`


Improvements needed 
--------

* ability to run with user input, not just in irb. Started this work with `user_assist` method
* allow custom fonts
* image api service to pull background images from free sites based on keywords
* generated images are timestamped so they don't overwrite eachother
* a user interface
* heroku hosting