From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser acceptance (was Re: Atomic filesystem or not)
Date: Tue, 20 Jul 2004 09:52:53 +0300
Message-ID: <20040720065253.GW4990@nysv.org>
References: <200407151434.23082.marcel@hilzinger.hu> <200407151354.47063.ctpm@ist.utl.pt> <40F6DE4A.2070103@slaphack.com> <40F6E06B.1080505@namesys.com> <40F73370.2090600@slaphack.com> <40FB876E.1050200@namesys.com> <40FC3730.80908@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19696-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40FC3730.80908@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, Claudio Martins <ctpm@ist.utl.pt>, reiserfs-list@namesys.com, Marcel Hilzinger <marcel@hilzinger.hu>

On Mon, Jul 19, 2004 at 04:03:44PM -0500, David Masover wrote:

>You are fooling yourself if you think we won't need that -- that reiser4
>is the only fs that will ever properly support transactions, or that
>every other fs will support the full sys_reiser4.  And I think it's
>seriously poor design to require such a switch statement in every app,
>and have to modify it to support every new and innovative fs that comes
>along.

But hopefully sys_reiser4 will be the standard, yes?
(Also, rename it to sys_reiser, the number makes it a bit more unclear,
more bound to the fs, not to the guy behind it)

I'd say it's the problem of the next innovator after reiser4. If he won't
support the sys_reiser calls, he has to fight for standardization, and if
he wants the basic stuff that's implemented in sys_reiser and then some,
he could just send in extensions to the sys_reiser.

The Namesys guys have the advantage of being the first around here
with something really new. And good.

>Now, suppose there was a standard library, which contained such a switch
>statement -- so that this library has support for reiser4, some random
>other FS types, and even fakes it on filesystems like ntfs and fat32.

This would have to be a small enough library, having an extra dependancy
for every basic GNU tool is not too good. There's already libattr and
libacl in Debian, for example.

>Being right isn't enough -- being right makes you Tesla, not Edison.

I remember hearing this story in school, but it was four years ago :)
Was it something about Edison being the ultimate asshole who sabotaged
Tesla all the way for his own fame, and he won in the end?

>Do you intend to have a reiser4 patch repository, so that end-users have
>to go and download a patch for each app?  Or are you actually looking
>for inclusion in things like Debian?  If the latter, then you really
>ought to do this my way -- make it look like you are creating a portable
>standard.  Make it so that each app only needs one patch to support any
>filesystem transactions, ever.

How does libaal figure into this? Could it provide the libfsatom
functionality? Just compile the tools against libaal as well...

Also, I think Debian inclusion is a bad target, you have to hit upstream
first. Debian maintainers are probably more difficult people than
the upstream maintainers ;)

Anyway, a patch repository is a good idea. Maybe one entirely open to
the public as well, to begin with. Anything that brings forth easy
inclusion. If I remember correctly, Torvalds implemented POSIX
syscalls on demand, he used his kernel and when it would fail, he would
implement the required call. I think something similar could be done
here?

-- 
mjt

