From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Fwd: reiser4 non-free?
Date: Mon, 3 May 2004 09:58:30 +0300
Message-ID: <20040503065830.GS29226@nysv.org>
References: <20040424193246.GA2490@raptus.homelinux.org> <4091DAFE.5030809@namesys.com> <20040430055619.GD7487@archimedes.ucr.edu> <40923D1C.3090003@namesys.com> <20040430174343.GE7487@archimedes.ucr.edu> <409561EE.7030000@namesys.com> <20040502215500.GB18235@xieana.donarmstrong.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18380-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040502215500.GB18235@xieana.donarmstrong.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-legal@lists.debian.org, reiserfs-list@namesys.com

On Sun, May 02, 2004 at 02:55:00PM -0700, Don Armstrong wrote:
>shareware, or freeware. Debian has freely chosen not to be involved
>with distributing such works for various reasons.

It's really quite a shame that the best distro around is so rigid
as to not allow Reiser's minor, and understandable, addition in
his licensing.

In case you (no-one personally) haven't noticed yet, developing free
software isn't easy. No-one said it would be. It has never been. It's
a tough business and unfortunately it has to be a business as well as
"just for fun."

>My place? I'm not the one who applied it. Presumably it was applied
>because an end user requested that it be applied. Clearly it's
>perfectly reasonable to have an option for a program that enables it
>to be used in non-interactive ways. Would you object to us having a
>shell that allows users to do the equivalent of "foo > /dev/null"?

Wouldn't mkfs -f > /dev/null be adequate suppression?

>Probably, but I fail to see how allowing the user to turn off the
>DARPA message decreases the end user's knowledge of who funded it.

Credits unread are credits unknown.

Hopefully Reiser4 will reach the point of being an fs on which people
will install their Linuxes and if the credits are completely suppressed,
we'll have a situation with a bunch of Linux users sitting in a pub
"You know, DARPA funded Reiser4" "What, you must be shitting me?" "No,
honest to Bog" "That's so cool!"

>> >Furthermore, the list of credits are still included (to my knowledge)
>> >in /usr/share/doc/resierfsprogs/README.gz.

Which should of course be read, but still not everyone reads the README.

>The end user can choose to read it, or they can choose not
>to. Regardless, they should not be assaulted by the credits or forced
>to read them. Going back to journal articles, is the funding grant
>number emblazoned in 24 point font above the article title?[1]

What if there just were a compromise?

Of course it sucks if Reiser4 gets only into non-free, because it would
never then be in the official installer. Besides, from what I've understood,
Debian developers spend quite some time bickering amongst themselves, causing
the Sarge installer to be delayed by a year or so and having the possibility
of completely detaching non-free from Debian.

What this probably means is that the DDs will be fighting each other over
stuff like this for eons and eons and if non-free is detached entirely
it will be even more difficult to get a non-free installer with Reiser4
on it. At least now it could be downloadable from Debian, unless some
policy forbids hosting of non-free installers but not non-free software.

I know it's a tough bullet to bite for Hans if he just removed the addition
to the license and formatted the credits so that no-one would even want
to remove them. AFAIK the reason they were removed was that they were too
big.

Oh, and the funding grant thing, weren't the credits of mkfs.reiserfs
in the end? Where else? It's not like they were flooded all the bloody
time in 24-point font above the title...

I should probably run an mkfs.reiser4 and see the notorious credits, because
I can't remember anything offensive about them.

-- 
mjt

