From: Gerrit Hannaert <degerrit@web.de>
Subject: Re: Bad Blocks?
Date: Wed, 2 Jan 2002 08:42:34 +0100
Message-ID: <200201020842.58067.degerrit@web.de>
References: <1035999303.1204.31.camel@preston>
Reply-To: degerrit@web.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11846-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1035999303.1204.31.camel@preston>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Preston Lord <webmaster@t2.net>, reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----

Often hard drive manufacturers provide utilities to check their disks and=20
remap bad blocks, I was able to get rid of mine using Maxtor's Powermax or=
=20
something. After that you can reiserfsck --rebuild-tree and you should end =
up=20
with a mountable fs.

However, you should see this as a temporary measure (to mount your fs, and=
=20
make a good backup) - in my experience with this one disk, more bad blocks=
=20
keep appearing after a while. (Against my own advice, I'm still using my=20
disk, though)

Also see http://namesys.com/bad-block-handling.html

Cheers,
=2D - Gerrit


On Wednesday 30 October 2002 18:35, Preston Lord wrote:
> I am running the latest reiserfsprogs 3.6.4
>
> I came home last week to find my Linux pc was locked up. After rebooting
> the root partition would not mount. All other partitions are fine. I
> have the failed hard drive in another linux pc now and am trying to
> recover the data from the failed partition. When I run
>
> reiserfsck --check /dev/hda5
>
> I get this:
>
> The problem has occurred looks like a hardware problem.
> Check your hard drive for badblocks.
>
> bread: Cannot read the block (16).
>
>
> how can I fix this bad block?
>
> Linux Kernel 2.4.18
>
> Thanks
>
> Preston
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iQCVAwUBPDK59wtVJ+MDouLxAQGS1QP/WuEvM/TwRkHbtueD6P6usviVhMQu7RnE
mfT1fSzpb0cyVOmStIRp1c8KNLhaaZRJs747ZtJjPXJV5lqO7N4cJ8sVa2hm/PwY
uBrFdEA/6cQaWBu2Kt9H3CPOhrrJYWwYXHow3qaYJUhhmAVWphNQEALEQU15A5iG
LPwM7Z3HQpk=3D
=3DVqVJ
=2D----END PGP SIGNATURE-----

