From: michael chang <thenewme91@gmail.com>
Subject: Re: Slowdown is gone & apt-get works with updated reiser4. So nevermind...
Date: Fri, 11 Nov 2005 22:07:06 -0500
Message-ID: <b14e81f00511111907l3c159ff7rd2e0de5f9e6a0aa7@mail.gmail.com>
References: <200511111359.39715.jgilmore@glycou.com>
	 <1131746768.9841.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26876-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1131746768.9841.6.camel@localhost>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: John Gilmore <jgilmore@glycou.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

On 11/11/05, Jonathan Briggs <jbriggs@esoft.com> wrote:
> On Fri, 2005-11-11 at 13:59 +0000, John Gilmore wrote:
> [snip]
> > <rant>
> > There is, btw, one main reason that I've decided that whatever trouble =
it may
> > cause, and whatever growing pangs I may experience along the way, root
> > reiser4 is worth it. Does anybody remember GoBack? It was a versioning =
system
> > for windows 95/98 that was incredibly flexible and useful.
> [snip]
>
> I have a "goback" utility for my Linux machines.  It's a 300 GB USB2
> drive and rdiff-backup. :)
>
> You could do a similar thing to GoBack with any recent Linux kernel and
> inotify, actually.
>
> Create a series of snapshot directories that contain copies of every
> file.  Use inotify to watch all changes.  Every 15 minutes update the
> snapshots with the changed files.
>
> Or you might be able to hook it into rdiff-backup or something like it,
> to update only the changed files every 15 minutes, without needing to do
> full disk scans to find the changes.

That would probably be more flexable than any versioning plugin - but
if GoBack was a Win9x program, I'd presume it was double-click, setup,
and go -- the vision of a Reiser4 plugin with that ability makes it
seem like I can simply push "y" in kernel menuconfig, recompile with
Reiser4, and be off to the races.  Besides, if it's transparent
enough, when it runs out of room, it can automatically delete instead
of me running head first into the out-of-space error and then MANUALLY
going to delete a backup (assuming backup is stored in the same
parititon).  Just because you can afford a seperate backup HD doesn't
mean everyone can, and USB just doesn't transfer fast enough for my
needs (as a consumer with 4 kids in the family, I can't be backing
things up all night, or at least that's my impression of it).

Of course, no plugin will be a substitute for hard backups - on
optical media, tapes, or external drives, as the case may be.  [Best
bet, have all three, on off-site locations... but that's a hassle for
a anyone just trying to get his 10 and 14 year old using Linux.]

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
