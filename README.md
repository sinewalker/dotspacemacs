Personal Spacemacs configuration
====

This is my [Spacemacs](https://github.com/syl20bnr/spacemacs) configuration.

I've been an [Emacs](https://www.gnu.org/software/emacs/) user for about 2 decades and I've been keeping my emacs configuration ever since February 2000 when it was just a simple `.emacsrc` until it evolved over time to something quite complex and hairy. In recent months it's developed a will of its own, to the point where I cannot easily maintain it: if I make a change to something, three other things will unexpectedly break.

So, I have declared Emacs Configuration Bankruptcy.

I recently discovered [use-package](https://github.com/jwiegley/use-package), which offers a way to replace my own ELPA-wrangling code (based off the [Emacs Starter Kit, version 2](https://github.com/technomancy/emacs-starter-kit/tree/v2)) with something much more sensible and simple.  It's great, but I would still need to write many package configurations to tidy up what I've accumulated over the years and make it all make sense and work.

Then I discovered ***Spacemacs***, which uses `use-package` and comes with batteries included in the form of *Layers*. Wow, this is so elegant &mdash; and importantly, much of the package installations/configurations I've been doing on my own are already done for me (by people with much more skill than I). So, I'm getting in on it!

Of course it still needs tweaking to personal taste (there's no accounting for personal taste), and that is what this project is for.

I've made it Public because I will probably be blogging as I go along. My main aims in configuring Spacemacs are:

* Make it less like vim (I know, people tell me vim is great but I don't agree)
* Add my personal utility `defun`s, where still required (in a Layer, probably)
* Configure personal preference variables
* Add modern/super-keybindings (similar to the existing `osx` Layer plus
some of the less radical ideas from [ErgoEmacs](http://ergoemacs.org/))
* (maybe in the Future) configure separate Layers for different groupings of settings, and also contrive to add different groups of Layers for different hosts I install Spacemacs to (e.g. some Layers for Windows/Cygwin settings that are only added when on a Windows host, or a host with a specific name)

That should pretty well be all I do with this, aside from adding/removing layers as I want.

I'm learning as I go, always. You might find what I do here instructive, or at least interesting, or you might find it crazy. That's okay.
