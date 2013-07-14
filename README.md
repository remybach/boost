	 __                               __
	/\ \                             /\ \__
	\ \ \____    ___     ___     ____\ \ ,_\
	 \ \ '__`\  / __`\  / __`\  /',__\\ \ \/
	  \ \ \L\ \/\ \L\ \/\ \L\ \/\__, `\\ \ \_
	   \ \_,__/\ \____/\ \____/\/\____/ \ \__\
	    \/___/  \/___/  \/___/  \/___/   \/__/

## Disclaimer

+ This was made to suit my own needs and is only up here on the off chance that it might interest or help anyone. If you're going to make use of it, please fork it and customize it to your preferences.
+ I did next to no research as to whether this kind of tool existed already and I'm glad I didn't - I learned a great deal from it and I recommend you all try it sometime.
+ I'm by no means a bash scripting expert - I literally cobbled this together from a few google searches and *a lot* of troubleshooting. If it helps you: great, if you think I'm an idiot and am totally doing something wrong: I'll happily take constructive criticism (especially in the form of pull requests - *hint hint*).

## What's it all about then?

What all started out as me wanting to do what all the "cool kids" were doing and getting a dotfiles repo going, ended up in me writing a script that will get me all set up on any new Linux/OSX system (of which the dotfiles is just a teeny tiny part).

I [wrote up a blog](http://remy.bach.me.uk/blog/2013/07/boost/) post about it with some more info.

## Usage

First, put any ssh keys you use in the `ssh` directory (they'll be ignored from the repo), then make a file in the `config` directory called `repos.cfg` and put each repo you'd want cloned on it's own line.

Once that's all done, simply `cd` into the directory and then type `./install.sh OS` replacing `OS` with one of: `Gnome`, `OSX`, or `Ubuntu`.