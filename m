From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: [reiserfs-dev] Re: [ANNOUNCE] reiser4 snaphots
Date: Fri, 8 Nov 2002 21:48:01 +0100
Message-ID: <200211082148.01328.Dieter.Nuetzel@hamburg.de>
References: <9918235451.20021106132043@kgpa.ru> <200211082004.gA8K4kC8008480@turing-police.cc.vt.edu> <20021108203919.GF1750@mrball.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11954-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021108203919.GF1750@mrball.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Todd Lyons <todd@mrball.net>, Valdis.Kletnieks@vt.edu
Cc: Nikita Danilov <Nikita@namesys.com>, ReiserFS-List <reiserfs-list@namesys.com>

Am Freitag, 8. November 2002 21:39 schrieb Todd Lyons:
> Valdis.Kletnieks@vt.edu wanted us to know:
> >> Todd Lyons wrote:
> >> Maybe my understanding is a little off, but I thought that I could
> >> just rebuild the modules and install them and run depmod and the new
> >> module symbols would be in effect.  But that didn't work (same
> >> error).
> >> So then I tried also a make bzImage and make install (which updates the
> >> System.map, something that didn't get done with make modules_install).
> >> It still would not load (same error).
> >> Finally, I rebooted loading the new kernel and that fixed it.  No
> >> comments needed, unless they are "what you did should have worked."
> >
> >I've seen similar issues when the /boot/System.map file doesn't match
> >the kernel in use (this is particularly an issue for 'depmod' - the
> >standard 'make modules_install' target passes a -F flag to depmod to
> >use the just-created System.map file.
>
> That I get.  You're saying that my make install step which updated the
> System.map in /boot was nullfied because it didn't exactly match the
> running kernel version.  And you're also saying that -F makes it ignore
> what /proc/ksyms has.
>
> But then that leads to the next problem.  That System.map doesn't match
> the /proc/ksyms, so I'm still left with a reboot as my only option.

That's normal for all kernel developers.
If you build a new kernel with new symbols some stuff couldn't match until =
you=20
have rebooted.

> Thinking out loud.  But I didn't change the way that the kernel was
> compiled.  Reiser4 is _still_ a module.  What am I missing?

Are you sure?

=2DDieter
