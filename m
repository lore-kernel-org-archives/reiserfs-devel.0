From: michael chang <thenewme91@gmail.com>
Subject: Re: recovering from "rm -rf"
Date: Fri, 5 Aug 2005 16:57:32 -0400
Message-ID: <b14e81f0050805135739c94933@mail.gmail.com>
References: <42F3A08A.30102@planet.nl> <42F3A16D.6090306@namesys.com>
	 <42F3C73B.9040808@slaphack.com>
Reply-To: michael chang <thenewme91@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25310-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F3C73B.9040808@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

On 8/5/05, David Masover <ninja@slaphack.com> wrote:
> I've got a Reiser4 partition which I just moved (mv) a bunch of stuff
> off of, onto another drive.  The other drive died immediately after.
>=20
> I'm trying to repair the other drive, and to find any backups, but is
> there a reasonable chance to recover from the good drive?  Maybe force
> fsck.reiser4 to rebuild stuff... somehow?  It's sort of the equivalent
> of an "rm -rf".

I have no idea what you're trying to say; can you identify your drives
by e.g. Drive A and Drive B?  However, I've heard that Spinrite
(grc.com) is known to be pretty good at drive recovery, and supposedly
compatable with Linux partitions.  Requires an i386 compatable
machine, and I believe you need Windows to write the diskette/iso
which you can boot the recovery system from.  Haven't tried it though.

What are you trying to do?  Format a broken hard drive so you can
write to it again, or recover data you deleted unintentionally?  A
"dead" hard drive usually may be usable, but using one is extremely
dangerous (read: you're best off throwing it away, because any data
stored on it would have to have a backup on another e.g. hard drive
anyways, so you shouldn't use it).  For all you know, the drive could
have died because the internals wore out/broke, or because your cable
died/broke/etc.

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
