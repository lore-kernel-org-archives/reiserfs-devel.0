From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 30 Aug 2004 20:26:18 -0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <87fz64xidx.fsf@uhoreg.ca>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org>
 <20040828170515.GB24868@hh.idb.hist.no>
 <Pine.LNX.4.58.0408281038510.2295@ppc970.osdl.org>
 <4131074D.7050209@namesys.com>
 <16691.16656.726300.438533@gargle.gargle.HOWL>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>>>>> "John" == John Stoffel <stoffel@lucent.com> writes:

[...]

John> I went and read the Pike paper on namespaces which Hans quotes
John> much earlier in this thread, and I think it isn't applicable to
John> this thread.  In the paper Pike compares the MVS, VMS, DOS and
John> Unix name spaces for disk layouts.  It's an interesting paper,
John> though a bit dated since it's 20 years old.  The concepts are
John> good, but the examples aren't any more.  How many Unix systems
John> today have /n/faces/... to link email addresses to digitized
John> images of people faces?

IIRC, gdm uses some directory in /usr/share to match usernames to
pictures (along with ~<username>/<somefile>).  But I can't find the
directory nor remember exactly what the name is.

Then there's the gconf database, which uses the filesystem to store its
hierarchical structure.  Or the .cddb/ database that uses filenames to
match the discid to the data.  Or on Debian systems, there's
/var/lib/dpkg/info database that attaches (post|pre)(inst|rm) scripts,
file lists, etc. to packages.  (Although I would have organized that
directory differently.)

And then there's the fact that there would be more examples if
filesystems were more expressive.  Like my LDAP database that sometimes
gets corrupted when the power gets pulled.  It's stored in a number of
opaque files, so I don't know how it gets corrupted, and I can't use
the normal fsck to check it.  Wouldn't it be nice if the database could
be stored as normal files, using the filesystem hierarchy to mimic the
LDAP hierarchy?  Then if something gets corrupted, fsck will fix it, or
I can easily see which record contains the garbage.  The problem is
that the filesystem can't do queries, so I'll have to wait until
Reiser6.

John> The big point of this paper though was to make the syntax simple,
John> and the semantics clear and unambiguous.  For example, they point
John> out how the "Cedar" file system added in VMS style version numbers
John> to filenames with the syntax "<name>!<version>" and they pointedly
John> ask what does "/usr/rob!3/bin/cat-v mean?  Which I think just
John> points out that the syntax of streams (metas) needs be carefully
John> thought out, and how that syntax implies various semantics.

The problem isn't just with things being confusing.  It's also about
making things accessible through a unified interface.  If we take the
attributes example, if we need to use a special xattr syscall, then I
can't use GIMP to edit icon attribute of xterm, or use emacs/vim/nano/ed
to edit the comment attribute of sound_of_silence.ogg (or the lyrics
attribute of sound_of_silence.ogg).  I need to fire up some stupid
program to do batch edits of the attributes of my ogg collection because
the FreeDB database had the wrong CD title info for the CD that I just
ripped and I didn't catch the error before I ripped it.  If attributes
were exposed through the regular filesystem interface (possibly through
some userspace helper to do the actual OGG parsing), I could just type
a couple of lines on the command line, and be done with it.

John> Lots of people keep asking for ACLs, but time and time again
John> people point out that while the Unix permission model isn't as
John> flexible, it is _simpler_ and easier to keep track of.

Not if you need to add a whole bunch of groups just to do the things
you want to do.  I personally haven't done that.  Why?  Because I would
rather deal with suboptimal permissions than having to add all those
groups.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

