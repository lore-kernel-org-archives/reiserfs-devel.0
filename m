From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: large files
Date: Tue, 18 May 2004 16:49:18 +0200
Sender: Bernd Schubert <Bernd.Schubert@tc.pci.uni-heidelberg.de>
Message-ID: <200405181649.22909.bernd-schubert@web.de>
References: <200405172148.33162.bernd-schubert@web.de> <200405181544.36152.bernd-schubert@web.de> <1084888676.20437.1477.camel@watt.suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_yJiqACxBRkyPs1F";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18747-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1084888676.20437.1477.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Chris Mason <mason@suse.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

--Boundary-02=_yJiqACxBRkyPs1F
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

> > 1.) During the filecreation in 2.4.26 the load on the system was around
> > 3-4, whereas in 2.6.6-mm3 the load was at about 8-9.
>
> Which procs contributed to this load?  The simple dd should have kept
> the load at one.

Thats all I can see from top (2.4.26):

top - 16:45:14 up  4:47,  1 user,  load average: 3.30, 2.80, 2.09
Tasks:  80 total,   1 running,  79 sleeping,   0 stopped,   0 zombie
Cpu(s):   0.0% user,  24.0% system,   0.0% nice,  76.0% idle
Mem:   3104428k total,  3018816k used,    85612k free,   228936k buffers
Swap:  1951888k total,        0k used,  1951888k free,  2662272k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND       =
                                   =20
1043 root      19   0  1392  364  320 D 40.7  0.0   3:11.55 dd             =
                                     =20
7 root       9   0     0    0    0 D  3.7  0.0   4:02.48 kupdated          =
                                  =20
6 root       9   0     0    0    0 D  1.7  0.0   2:15.18 bdflush           =
                                  =20
5 root       9   0     0    0    0 S  1.0  0.0   2:47.13 kswapd            =
                                 =20
17 root       9   0     0    0    0 D  0.3  0.0   0:46.62 kreiserfsd       =
                                =20
1052 root       9   0  1040 1040  820 R  0.3  0.0   0:00.02 top            =
                                 =20


taylor:~# cat /proc/stat=20
cpu  402 0 538233 2938065
cpu0 221 0 267698 1470431
cpu1 181 0 270535 1467634
page 215506778 453499588
swap 1 0
intr 200179775 1738350 2 0 9 4 0 2 0 4 2 0 0 0 0 13 5 0 0 0 0 0 0 0 0 50177=
28=20
187006 0 0 0 193236650 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 =
0=20
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0=
 0=20
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0=
 0=20
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0=
 0=20
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0=
 0=20
0 0 0 0 0 0 0 0 0 0 0
disk_io: (3,0):(4,4,32,0,0) (8,0):
(5058268,3638518,431013524,1419750,906999184)=20
ctxt 179608469
btime 1084874257
processes 1054


Unfortunality I even don't have an idea how to interprete those numbers.


> > Do you have any ideas how we could improve 2.4.x?
>
> 2.6.6-mm has a few key improvements.  There's less metadata
> fragmentation thanks to some block allocator fixes.  More importantly,
> during the rm, metadata blocks are read in 16 at a time instead of 1 at
> a time.  I'd be happy to give someone pointers on porting the metadata
> readahead bits back to 2.4.

I certainly have neither the knowledge nor the time to do that.


Cheers,
	Bernd

--Boundary-02=_yJiqACxBRkyPs1F
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAqiJyC8BUnAF+ydYRAs9IAKCcN6+uQsAmt5PPge4vaNUDP+nSJACgq+tk
MvNbHZW7h/QOfOE51zh41hE=
=nVd4
-----END PGP SIGNATURE-----

--Boundary-02=_yJiqACxBRkyPs1F--
