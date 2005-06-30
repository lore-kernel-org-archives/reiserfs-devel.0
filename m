From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Thu, 30 Jun 2005 15:00:43 -0400
Message-ID: <87ll4rvfdw.fsf@evinrude.uhoreg.ca>
References: <hubert@uhoreg.ca>
	<200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>
	<87hdfgvqvl.fsf@evinrude.uhoreg.ca>
	<8783be6605062914341bcff7cb@mail.gmail.com>
	<42C3615A.9020600@namesys.com> <871x6kv4zd.fsf@evinrude.uhoreg.ca>
	<20050630062956.GP16867@khan.acc.umu.se>
	<87psu3vnvc.fsf@evinrude.uhoreg.ca>
	<20050630171057.GT16867@khan.acc.umu.se>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24852-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050630171057.GT16867@khan.acc.umu.se> (David Weinehall's
 message of "Thu, 30 Jun 2005 19:10:57 +0200")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Thu, 30 Jun 2005 19:10:57 +0200, David Weinehall <tao@acc.umu.se> said:

> For the analogy to be complete:

> User has a file browser (say Nautilus)
> The file browser sees the userland VFS (say a unified VFS between
> GNOME and KDE)
> The VFS sees the real file system

I would say that this only works if everyone is forced to use the same
VFS.  In the web example, everyone is forced to use the same API (HTTP),
and so everyone gets the same view.  For the real filesystem, not
everyone is forced to use the hypothetical unified GNOME/KDE VFS.  So if
I try to edit with gedit or kate, I get something different than if I
try to edit with vi or emacs.

As I see it:
web browser <-> Nautilus/user apps
web server <-> filesystem
web server's filesystem/database/etc. <-> physical disk storage

Of course, we all know that analogies are not perfect.  The layering in
both sides isn't exactly the same.  And other people could assign
different equivalences (e.g. web browser <-> Nautilus/user apps; web
server <-> VFS; web server's filesystem <-> filesystem).

Anyways, the analogy wasn't supposed to be about where to handle the
magic extra functionality, whether userspace or kernel space.  The
analogy was for people who might think that it's stupid to return
foo/.data when the user tries to open the directory foo; it was meant to
illustrate that that idea isn't completely braindead.

> This way the userland VFS can be ported to almost any platform.

I think GNOME and KDE will always need a VFS if it wants to be
cross-platform.  But I think that if the kernel provides extra
functionality, GNOME may be better off.  For example, glib provides its
own threading abstraction.  But on systems that use pthreads, glib's
threading library uses it for its implementation.  And I think it can
even be used on systems that don't offer threading, by doing its own
emulation of threading.

> When toying around on the desktop, an abstraction of what a file is
> works fine with me.  When doing serious work (programming, tar:ing up
> stuff, etc) I want to be bloody sure that I see the files in the same
> way always.  I don't want surprises such as files suddenly behaving as
> directories or vice versa.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

