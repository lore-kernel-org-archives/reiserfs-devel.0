From: Dieter =?iso-8859-1?q?N=FCtzel?= <d.nuetzel@wearabrain.de>
Subject: Re: ReiserFS is not suitable for a root FS.
Date: Mon, 19 May 2003 22:42:07 +0200
Message-ID: <200305192242.07474.d.nuetzel@wearabrain.de>
References: <Pine.LNX.4.44.0305191544380.7975-100000@dragon.inside.ntisys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14167-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0305191544380.7975-100000@dragon.inside.ntisys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: bscott@ntisys.com, ReiserFS <reiserfs-list@namesys.com>

Am Montag, 19. Mai 2003 21:55 schrieb bscott@ntisys.com:
>   Observation: Unix and its clones (such as Linux) have, traditionally,
> done poorly when the root filesystem is not safe and sane.  The stance
> appears to be (have been) that, if the root is damaged, the system doesn't
> have enough marbles left to reliably repair itself.  At that point, you
> must boot from some other filesystem.

=46ormer and current FSs of the "other OS" not?
NTFS is so stupid that it couldn't wake up itself when=20
WINNT/system32/AUTOCHK.EXE is missing (on the root partition or rescue CD) =
or=20
when it can't find a sane mft (master file table =3D=3D inode table) even w=
hen=20
there are intact copies of it on the disk.

But current NTFS patches for Linux can handle this...

Greetings,
	Dieter

=2D-=20
Dieter N=FCtzel
Leiter F&E, WEAR-A-BRAIN GmbH, Wiener Str. 5, 28359 Bremen, Germany
Mobil: 0162 673 09 09

