From: Valdis.Kletnieks@vt.edu
Subject: Re: error compiling reiserfsprogs
Date: Thu, 01 May 2003 14:00:58 -0400
Message-ID: <200305011800.h41I0wxj005681@turing-police.cc.vt.edu>
References: <00e001c30f5a$91f71bf0$0f02a8c0@observer> <200304302124.h3ULOi5J009954@turing-police.cc.vt.edu>
            <20030501062527.GA22815@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1207321422P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13915-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 01 May 2003 10:25:27 +0400."
             <20030501062527.GA22815@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: Network Operations <downtown@cwo.com>, reiserfs-list@namesys.com

--==_Exmh_1207321422P
Content-Type: text/plain; charset=us-ascii

On Thu, 01 May 2003 10:25:27 +0400, Oleg Drokin said:

> > Did you install whatever kernel-headers package your release of *GCC* (*not
*
> > the kernel itself) wants installed?  If not, do so.
> 
> Well, in fact kernel headers are supplied with glibc, otherwise I agree that 
error looks like
> missing kernel headers installed.

At least under RedHat, the kernel headers that come with gcc are shipped
in a seperate RPM glibc-kernheaders, the numbering of which doesn't follow
anything else:

% rpm -q glibc glibc-kernheaders kernel
glibc-2.3.2-27.9
glibc-kernheaders-2.4-8.10
kernel-2.4.20-9


--==_Exmh_1207321422P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+sWDZcC3lWbTT17ARAjlPAJwIDtd0HFOnYEs5Vvpc/8bEqJOUAwCgpivY
qzFXoteCu1QeG8GVBNK8TS8=
=EWqz
-----END PGP SIGNATURE-----

--==_Exmh_1207321422P--
