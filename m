From: David Masover <ninja@slaphack.com>
Subject: Re: preexisting 'metas'?
Date: Mon, 14 Jun 2004 07:35:25 -0500
Message-ID: <40CD9B8D.6050002@slaphack.com>
References: <40CBB63E.4060001@slaphack.com> <200406140033.i5E0XiR2002772@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19176-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406140033.i5E0XiR2002772@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Valdis.Kletnieks@vt.edu wrote:
| On Sat, 12 Jun 2004 21:04:46 CDT, David Masover <ninja@slaphack.com>
said:
|
|
|>Well, the '...' in my brother's home dir had some stuff that he'd like
|>to keep secret -- as in, he doesn't want people to know he has them.
|
|
| Just as an aside, note that calling the directory '...' will only slow
down a
| clueless person.  Consider that 'du' and 'ls -a' and 'ls -A' will all
show them
| - as will 'find' and any number of other utilities...

I think the main thing he wanted was to keep people from noticing such a
directory existed.  And especially jaded sysads might pass over a file
called '...' -- or, more easily, a file called '. ' or '.. '.

Based on the content in that directory, I could just ask him what was in
there and know by watching his reaction.  Either way, it's no big deal.

| And if he wants to keep it secret, he should be using at *least*
enough things
| to keep people *that* unclued out.  If they're unclued enough to not
be able to
| find a . file, how did they get *in*??/

Suppose he's browsing through his home dir with someone on his shoulder,
because he wants to show them something.  If he wasn't hiding things at
all, he'd call it 'xxx'.  Otherwise, he'd call it something boring --
but the shoulder-surfer might ask him what's in there...

| If you want actual *security*, you need to be using something that
does actual
| crypto.  Jari Ruuso's 'loop-aes' package (on sourceforge) is one
example of the
| class of software you *want* to be using.

Yeah right.  I'm root, he's not.  His security is the fact that I'm his
brother.  I demonstrated this to him vividly, when I told him I really
don't care about his password, and so I won't look if he doesn't want me
to (when I first had him enter it) -- then I logged in as root and su'd
to his account.  He thinks it isn't fair.  I built the computer >:)



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQM2bjXgHNmZLgCUhAQL+3xAAiTSfSEWeTBFvV0/RafdlV5TrFmcgPNUh
I9GkCz4mUxRwEOrh8wCg7pC3jYsusWT9sXqJ4pbc9GkSopE4NnY96f3Hq/aYfBHD
diGOi7aanSEmRS7hpNgJHzsDTPCrMBvxvqXZNPr3rZLB/ta+YL6W/VzEi3Ff0lL+
BGFyBJKPB2OcSnRsZIpfj3WCDoLvjNkXdhV4Zm1/CFC3vms1CIZUA7R/JJ73CrXN
6AbU533SUMO8RWwMfIoNj12h9FKsN1HB9N9iZ/IId2njF/VPuoAildT0tBk/zzbD
BBjvoxYNQSwtJk0XbPp4szWzh45OXdl91G4fvdouNvBNff+qGMb9PUk9jqn7whV0
xWNSezVH0SfscXpfHLEpuSTzDWfG1hu0aIamtmuWmE7ZiWioomHGVvXWcgZnUjVX
nkIJxQm03HsvvvvZnUeWJUse2uywkxnZ24mFTxycKsApDGMy3yx9X/BEVOdWOHMb
kpf7rmOKCU6nqqvA/QrbUD+e/deNML5uUndU2IDtp+OjBKg4QA+sp0IUJ7QaP9f8
/HzDtVJ1lpMpDTaTnjlXeKCqCsu1vVstsQQuQycNUu5FTo+eXsq5DB5xQwHOPoR7
7oafisQkQ0nmo+q0rSzDB6zrupSVs9DZwrUzcDZUkedqwlJzHvpKHBuMypCR6z/J
1BJhFXeDsFE=
=MgH3
-----END PGP SIGNATURE-----
