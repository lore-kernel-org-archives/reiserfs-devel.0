From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Wed, 29 Jun 2005 16:57:56 -0400
Message-ID: <87d5q4vq23.fsf@evinrude.uhoreg.ca>
References: <20050629135820.GJ11013@nysv.org>
	<200506291719.j5THJCSg011438@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24813-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506291719.j5THJCSg011438@laptop11.inf.utfsm.cl> (Horst von
 Brand's message of "Wed, 29 Jun 2005 13:19:12 -0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Douglas McNaught <doug@mcnaught.org>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Wed, 29 Jun 2005 13:19:12 -0400, Horst von Brand <vonbrand@inf.utfsm.cl>=
 said:

> Markus T=C3=B6rnqvist <mjt@nysv.org> wrote: [...]

>> Note that MacOS has the monopoly on what they ship, Linux has a
>> motherload of file managers and window systems and all.

> Yep. Part of what is nice about it, too ;-)

I guess that's why Apple doesn't want to make its X11 support too good.
Otherwise the Mac world would get flooded with X11 programs that don't
work the same way as the rest of the Mac programs.

>> What pisses me off is the fact that Gnome and friends implement their
>> own incompatible-with-others VFS's and automounters and stuff.

> Then get them to agree on a common framework! They are trying hard to
> get other parts of the GUI work well together, so this isn't far off
> in wishfull thinking land.

I honestly hope you're right.  The more cooperation we have between
GNOME and KDE and everyone else, the better.

>> Surely supporting this in the kernel and extending the LSB to require
>> this is the best step to take without infringing anyone's freedom as
>> such.

> Right. So then we have Gnome's way of doing things (Gnome isn't just
> for Linux!), KDE's way, XFCE's way, ... (ditto). Plus the kernel
> way. Flambee with a monthly thread on all reachable fora about "Why on
> &%@# does the %&~#@ GUI not use the *#%&@ kernel's way?!".

GNOME has HAL, their hardware abstraction layer, which uses (I assume)
the kernel's facility to interact with the hardware.  If someone ports
GNOME to Windows, then HAL would use the Windows way to interact with
the hardware.  I can't see why it can't do something similar with the
filesystem.  Because who knows, maybe Gnumeric will need to access
substream data under Windows to open an Excel file properly.  Or
Nautilus may have to read ... OS/2 extended attributes :-/

--=20
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

