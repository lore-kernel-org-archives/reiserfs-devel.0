From: David Masover <ninja@slaphack.com>
Subject: Re: ".meta." as a Name Prefix
Date: Sun, 25 Apr 2004 00:27:05 -0500
Message-ID: <408B4C29.1090904@slaphack.com>
References: <84800866490-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18198-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <84800866490-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

| David Masover wrote on Tue, 20 Apr 2004 20:00:34 -0500:
|
|>That's what we were doing before.  I didn't like it -- consider the use
|>on files:
|>
|>touch foo
|>chmod +x foo
|>cd foo/
|>ls
|>
|>You either get 'foo/' or an error message.  You do not get a list of all
|>the pseudo files available.  I'm sorry, but 'cat ..pseudo' just isn't a
|>viable substitute for ls.
|
|
| Why wouldn't that work?  I must have missed something.  I can see that
| the fildirute (combined file / directory / attribute) nature of the new
| file system objects making the old rwx flags obsolete (does the "x" flag
| make it an executable file or does it mean permission to change directory
| to the child objects of the file).  But if you change directory to a
thing,
| it gets appended to your path and the OS should be able to figure out that
| you want to look at its child objects (which I'd prefer to directly
| include things named .meta.blah, while others want a .metas subdirectory
| as a child object).

I imagine that's how it _should_ be implemented, but right now, I can ls
foo/metas, but not foo/.  Of course, I wouldn't expect to find anything
there, anyway...
|
|
|>| I'm probably repeating myself, but the trouble is that the .meta
|>| directory isn't a full directory - you can't add attributes to it.
|>What kind of attributes would you want to add?
|
|
| GUI directory display attributes, like window position and size,
| background picture, when displaying that directory.

I'm finding it hard to imagine where that would be really useful.  I
mean, users are mostly going to be using tools other than a file browser
to view it.  But that's just me -- it's clear in the whitepaper that
Hans is making a general purpose FS, and it's up to us to decide how to
use it.

|> And btw, check out what is currently 'metas/metas'.

Maybe I'm on an older snapshot?  I can currently do 'ls metas/metas' on
one box, but the kernel is 4 days old.

|
|
|>It doesn't have to.  Look at how the "pure object-oriented" languages
|>work.  Many of them make everything some subclass of "object" -- even
|>classes themselves.  A class is an object of type class.  I'm not sure
|>how this is implemented in code, but in concept it works fine.
|
|
| In that kind of class system every object is an object, and you can
| do all object type operations to it (such as finding it's class name).
| The magic .meta directory breaks that very concept by not implementing
| full file system object functionality.  It's not a first class object,
| it's an awkward special case.

I'm thinking things like inheritance, implemented the way I would/will
when I get the time to understand/write languages better.  Sure I can
find the class name of any object -- but not all objects have a class
name, and in fact, some of them will probably just reurn "Object" -- not
because the name is there in that particular object, but because it was
present in the original Class object.

Let's say you can do anything to .meta that you can to a normal
directory, but until you actually make a change to it that doesn't make
sense in the context of a "magic directory", it becomes a true child
object.  The same concept as Copy On Write.  Maybe even do it on a
per-item basis -- try to change the mode of the directory, and it
becomes a magic directory with a mode.  Try to make a (new) file in it,
and it becomes a nearly real directory with a mode and a file.  And so
on.  (At a certain point, of course, it has its own child directory.)

It also doesn't make sense for them to be directories in every sense of
the word by default.  One thing reiserfs/reiser4 is very good at now is
gajillions of tiny files -- files of 100-200 _bytes_.  To add a
directory on to every little file doesn't make sense, at least for
storage.  And making it possible to accidentally add such a directory
should at least allow for that directory to be removed later (if I
create foo/.meta/file and then remove it, foo should be as it was
before, except for maybe a timestamp)

Again, there are implementation details that I'm not sure of, because my
concepts for language design are mostly for some sort of
ruby/perl/python, only compiled better than C is.  I'm not implementing
any new projects for awhile, though -- I'm still in high school, so if I
do get time, I should spend it learning why I'm wrong.

Being loud, stupid, and long-winded on mailing lists is just one way I
find out why I'm wrong.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQItMKHgHNmZLgCUhAQJhzw/7B6p9n4ePCa3JYRtQbYTwm1CkXTpZcxpW
qEc7SgBmaZ6NWxBYWiAF/1MdOQloXjmOT+FnBCm9aAf5gwBi4UU9ES4Bg3pW2uKs
U2C02ekYW5k6p3DIi1iZPrZuqWW5Onpv+W3JujJETzl+4dojnfFR6lLhhmWWh1Iu
F7l4tg78968ibAwBZPC70bvNqwI+nhWLQwXNe5ZM2PbBNnfWcj//B/LZ78N5Up7G
qKnT9ftJCUqQXJL0tA409LNIjmeOJy24Nluqtcx6qphx6W4qBo7x1uzSNh3M+SfF
QPwewBHT0BR42qbWQxy4m1MwjWj6ktkmWzp+OhPg81sxb/iZF+oCBiw6U3phi97y
lyNtRy7w7yohGtQlVG2H8BYDAlZTXZiUcNUEzdV+3NjirBAbmotWtRuntf8wMdj6
Z749u7vS7xJi8wUHegBuzuvFQjlLnZIGdfHpCJ44+18wH2RfZWk+CPRKQBIrsbLE
9f/S/yi9lC/KYURpKvSExqCmEtGasksF6aIFb7Hr7p/vONBw/SntHuqxBN3/nIv4
AB4x5xKaxYpf5XI9fMbDlixASFz6gAE/5h6vRGbdL6ZKel6XqMaADRFDpfr9gY8Z
3t7fLE9p/KqeGRauhPLhohv5/z+MdnJPOhGyOB9XJfuBW8cEgfD0WkZKyXzAL7pL
QaCZzaj+fMw=
=z9qA
-----END PGP SIGNATURE-----
