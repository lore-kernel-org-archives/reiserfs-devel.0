From: William Jared Roberts <wjr6@email.byu.edu>
Subject: Re: Bugs?
Date: Sun, 17 Aug 2003 14:23:39 -0600
Message-ID: <01KZKKW3SRDC90R1IS@EMAIL1.BYU.EDU>
Return-path: <reiserfs-list-return-15350-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lkthomas@sml.dyndns.org
Cc: reiserfs-list@namesys.com

> kernel command-line options <-- sorry, can you point out the full command
> for this please ? Thanks.
> >

I think you can just add some combination of "rw" and/or "rootflags=0" to your
command line to do it.  You may also need to bypass the remount in your
initscripts.  I did this by using "init=/bin/sh" to boot once, then commenting
out the relelvant part of my init script, then rebooting.  You may also want to
add read-write to your lilo stanza and rerun lilo.  I also did an "rdev -R 0" on
my vmlinuz image.  Sorry, I'm not sure which of these steps are really necessary
and which just add to the confusion, but it "works" for me.

