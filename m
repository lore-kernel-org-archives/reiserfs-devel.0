From: Domenico Andreoli <cavok@tiscali.it>
Subject: Fwd: reiser4 non-free?
Date: Sat, 24 Apr 2004 21:32:46 +0200
Sender: Domenico Andreoli <cavok@libero.it>
Message-ID: <20040424193246.GA2490@raptus.homelinux.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18192-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Sami Liedes <sliedes@cc.hut.fi>, ed@debian.org, debian-legal@lists.debian.org, reiserfs-list@namesys.com

hi Hans,

  we have bad news for your filesystems :(( it happens that some sections
of the license are not compatible with Debian Free Software Guidelines [0].

Even more grave is that something makes them also not suited for debian's
non-free archive.

I'm sorry but if thing do not get fixed, this stuff won't ship with
next distribution release.

Here follows the message posted to debian-legal mailing list which
starts the thread.

cheers
domenico

[0] http://www.debian.org/social_contract

----- Forwarded message from Sami Liedes <sliedes@cc.hut.fi> -----

Date: Sat, 24 Apr 2004 14:40:13 +0300
From: Sami Liedes <sliedes@cc.hut.fi>
To: debian-legal@lists.debian.org
Cc: ed@debian.org, cavok@debian.org
Subject: reiser4 non-free?

[Cc:'d to the reiser4progs maintainers. Please Cc: me when replying,
I'm not subscribed to -legal.]

There has previously been discussion at least in April 2003 on this
list about the freeness of reiserfs.

It seems a further "clarification" has been added to the license (GPL
+ clarifications) in both reiser4progs and kernel-patch-2.6-reiser4
since then. This is the section that has been modified:

> Finally, nothing in this license shall be interpreted to allow you to
> fail to fairly credit me, or to remove my credits such as by creating
> a front end that hides my credits from the user or renaming mkreiser4
> to mkyourcompanyfs or even just make_filesystem, without my
> permission, unless you are an end user not redistributing to others.
> If you have doubts about how to properly do that, or about what is
> fair, ask.  (Last I spoke with him Richard was contemplating how best
> to address the fair crediting issue in the next GPL version.)

New here is the "such as by creating a front end that hides [...] or
even just make_filesystem". The controversy last year was created by
mkreiserfs printing an overly verbose (tens of lines of sponsor
credits and other non-licensing information) advertisement when
running from the command line and Mr. Reiser's assertion that removing
it violates the GPL.

To me, these new "clarifications" seem non-free. (IANADD, and I
believe the other IANA* goes without saying. :-)

Another section has been added after the above one:

> Also, a clustering file system built to work on top of this file
> system shall be considered a derivative work for the purposes of
> interpreting the GPL license granted herein.  Plugins are also to be
> considered derivative works.  Share code or pay money, we give you the
> choice.

Surely a license cannot add anything to the set of derived works (if
the other work is not derived, the license obviously doesn't apply to
it and hence never gets to say it is derived; if it is, it is even
without the license saying so). However I believe -legal has not
considered text like this a problem before (I might be wrong though).

	Sami

----- End forwarded message -----


-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
