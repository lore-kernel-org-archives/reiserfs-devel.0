From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: reiserfs logging patches udpated
Date: Thu, 25 Mar 2004 01:47:42 +0100
Sender: bernd-schubert@web.de
Message-ID: <200403250147.54246.bernd-schubert@web.de>
References: <1080149399.14737.77.camel@watt.suse.com> <20040324143516.3162cbfe.akpm@osdl.org> <1080168379.14743.124.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17449-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080168379.14743.124.camel@watt.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>, Andrew Morton <akpm@osdl.org>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

> It does, but the code has been in testing -suse and on the reiserfs
> list.  This dooesn't mean data=3Dordered is perfect, but it's not quite
> day one either.  I can switch the default back, but I'd rather have a
> trial by fire ;-)

Oh please not, just have a look at german newsgroups, there are real flamew=
ars=20
about the stability of reiserfs. Everytime someone has a disk problem and a=
=20
reiserfs partion is affected by it, then there are more than a dozen answer=
s=20
that its the fault of reiserfs. PLEASE, don't prove them right.

The last example is less than 2 weeks old (see subject "Crash --> ReiserFS=
=20
screwed up"), since Tim told on de.comp.os.unix.linux.misc that badblocks=20
reported that his harddisk is ok, I told him to ask here. By his post here,=
=20
one could see, that his harddisk or ide connection was not so fine as he=20
previously stated, so we continued to discuss in on=20
de.comp.os.unix.linux.misc and finally could solve the problem by setting a=
=20
lower udma speed.
However, besides of the proper discussion about the ide problem, there was =
a=20
'sub' thread with about 50 messages about the instability of reiserfs!!!

IMHO, almost all of the reported reiserfs problems are due to hardware erro=
rs,=20
but some are also due to patches which are enabled by default by=20
distributions like Suse or RedHat.=20
Just another personal example: Before my first post on this list, I didn't=
=20
know much about reiserfs, only that it handles system crashes better then=20
ext2 and that I can have file >2GB on 2.4.x. So I went ahead and replaced=20
every ext2 partition by reiserfs on the next Suse-7.0 installation. Then th=
e=20
problems arrived, since I also exported everything via nfs and since the Su=
se=20
installer had choosen the 3.5 format without warning me about it, I run int=
o=20
serious trouble and reverted everything that was exported by nfs back to ex=
t2=20
for the next 2 years.
Even until Suse-7.3, the 3.5 format was the default from the Suse patched=20
mkreiserfs, without warning the user about it.

I think -mm kernel are experimental and can include experimental stuff, but=
=20
later in the main line everything that is experimental for the 3.6 format=20
should be disabled by default. I wouldn't mind if it becomed included, but=
=20
marked as experimental, so that one can easily wouldn't include it in a=20
server kernel.


Sorry for my long (slightly off topic) message,
	Bernd
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAYiw0C8BUnAF+ydYRApYMAJ9KW83lYY9TJ7oIwiLmHwlub/cf3ACeIaSL
dPX8EuqpIH2kvMh+JPTrRGA=3D
=3Dm5ez
=2D----END PGP SIGNATURE-----
