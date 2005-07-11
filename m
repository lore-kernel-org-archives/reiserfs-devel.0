From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Mon, 11 Jul 2005 19:17:20 -0400
Message-ID: <87oe99vsov.fsf@evinrude.uhoreg.ca>
References: <20050630153738.GU11013@nysv.org>
	<200506301952.j5UJqPrn013513@laptop11.inf.utfsm.cl>
	<87wto5yo9o.fsf@evinrude.uhoreg.ca> <42D06531.9060903@stesmi.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel=40m.gmane.org-S262065AbVGKXWS@vger.kernel.org>
In-Reply-To: <42D06531.9060903@stesmi.com> (Stefan Smietanowski's message of
 "Sun, 10 Jul 2005 02:00:49 +0200")
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Smietanowski <stesmi@stesmi.com>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Nikita Danilov <nikita@clusterfs.com>, Douglas McNaught <doug@mcnaught.org>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Sun, 10 Jul 2005 02:00:49 +0200, Stefan Smietanowski <stesmi@stesmi.com> said:

> So basically if I write a program that works in both Gnome and KDE I
> should (according to your description) implement my own VFS that will
> use the Gnome or KDE VFS that will then use the OS VFS.

Either that, or use a whole lot of #ifdefs, or hope that GNOME and KDE
agree on a common VFS, or don't use their VFS and just use the basic OS
calls and lose the functionality (and portability) of the VFSes, or pick
one VFS and hope that the other users can adapt.

GNOME and KDE already have their own VFS.  I am not asking for anything
new.  If you don't like the idea of a VFS at that level, take it up with
the GNOME and KDE people.

> Is it only me finding that a little silly?

> I mean, if I am to have the same functionality under neither Gnome nor
> VFS and they don't support something I need I _NEED_ a vfs so that my
> program is so totally independent on anything at all.

> My program calling My VFS which calls KDE/Gnome's VFS which calls the
> OS VFS will be slowe than just calling the VFS immidiately - I do hope
> you can see that.

Of course.  It's probably slower than arranging the bits on the hard
drive directly, and hand-coding everything in assembly.  But there's
always a performance price to pay for maintaining the programmer's
sanity.  There's always a price to pay when writing cross-platform
stuff.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.
