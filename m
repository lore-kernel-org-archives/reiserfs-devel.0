From: Valdis.Kletnieks@vt.edu
Subject: Re: Re[2]: When Reiser4 will be officially included in the kernel? ...
Date: Wed, 04 May 2005 23:26:50 -0400
Message-ID: <200505050326.j453Qp0U010445@turing-police.cc.vt.edu>
References: <42727F32.60301@futuretg.com> <1115198582.4456.32.camel@tribesman.namesys.com> <4278C117.7020805@superbug.demon.co.uk> <1115223159.4741.58.camel@tribesman.namesys.com> <42791F82.8080906@futuretg.com>
            <1346698530.20050505003854@wp.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1115263610_5625P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23983-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 05 May 2005 00:38:54 +0200."
             <1346698530.20050505003854@wp.pl> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Pysiak Satriani <pysiak.satriani@wp.pl>
Cc: reiserfs-list@namesys.com

--==_Exmh_1115263610_5625P
Content-Type: text/plain; charset=us-ascii

On Thu, 05 May 2005 00:38:54 +0200, Pysiak Satriani said:
> >     This is OK, however, what I am looking for is to download the Kernel
> > from kernel.org, and found Reiser4 code inside. This means officially
> > for me.
> FYI, kernel.org does have patches with r4, eg.
> http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.12-rc3/2.6.12-rc3-mm2/2.6.12-rc3-mm2.bz2
> 
> When 2.6.12 comes up, you might want to take the next 2.6.12-mm1 or
> the next 2.6.12 reiser patch from namesys.com

Please do *NOT* run -mm kernels unless you are *sure* you know what you're
doing.  They are *literally* bleeding-edge test kernels, and *are* the most
likely things on the entire kernel.org server to hang, wedge, reformat your
disks and eat your data, and otherwise have a bad time with.

To repeat:  -mm are *TEST* kernels.  2.6.12-rc3-mm1 came out at 23:11 Friday.
2.6.12-rc3-mm2 came out at 16:43 the next day. Why? Umm.. let's just say
that it didn't even *compile* cleanly for uniprocessor X86... ;)  I've been
running -mm kernels on this laptop since 2.5.45-mm1 or so, and I'd estimate
that at *least* 1 in 4 hasn't even booted cleanly to multiuser without additional
patching and tweaking. In the last 31 -mms, I've needed 10 additional patches.
Think about that - since 2.6.9-rc2-mm1, there's been 31, and 10 needed patches.
Cool stuff if "Test Pilot" is part of your job description, but not what you
want to put on production boxes. ;)

If you're brave, you can pull the -broken-out variant and apply all the
reiser4-* patches in the order they're listed in the 'series' file - that
should work unless they depend on some other patch being applied first.

If you're willing to stress test new stuff, and are prepared to recover your
system from backups, go for it - Linus and Andrew want -rc and -mm kernels to
get more runtime.  But they're definitely *not* the "official" kernels that the
original poster wanted, which is usually called "mainline" or "Linus" kernels.

From where I'm sitting on the sidelines, Reiser4 *can't* make 2.6.12, is a long
shot for .13, and most likely will land somewhere around .14 to .16.  And I'm
going to predict there will be at least one more major bun fight on the lkml
list about pseudo-files before it gets in (sorry Hans, but I have to side with
the guys who said "Cool idea, but it really needs to be at the VFS level")...


--==_Exmh_1115263610_5625P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCeZJ6cC3lWbTT17ARAuLeAJ9uZcLV2CtMqMdRiFArBf5mciNDZACgtzX1
wVRqnIx8HJUDMLa5ZQpjO+U=
=zzAB
-----END PGP SIGNATURE-----

--==_Exmh_1115263610_5625P--
