From: Posern <foo@posern.org>
Subject: Re: [2006-08#14.139] Re: mutt tells me: "Fetching message... Bus error"
Date: Tue, 29 Aug 2006 20:49:23 +0200
Message-ID: <20060829184922.GF9135@jolie.SPINNEN-NET>
References: <20060829093756.GA9135@jolie.SPINNEN-NET> <44F48371.7080606@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LTeJQqWS0MN7I/qa"
Return-path: <reiserfs-list-return-29742-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44F48371.7080606@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

--LTeJQqWS0MN7I/qa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi.

I am using reiser4 since not so long. In my mind it is only a few month.

I verified and I think my first kernel with reiser4 was:

    linux-2.6.16.11-reiser4-r2

and now it is:

    linux-2.6.17.8-reiser4-r3

I am using a gentoo based system. And the package system portage logs nice =
things:
jolie ~ # genlop -e reiser4progs
 * sys-fs/reiser4progs

     Fri Nov 12 15:44:41 2004 >>> sys-fs/reiser4progs-1.0.1
     Sun Jan 22 05:59:28 2006 >>> sys-fs/reiser4progs-1.0.5

So it means that from the beginning I used reiser4progs v1.0.5.

---

For the kernels I am using a selfbuilt ebuild to autoamtically patch the va=
nilla kernel with the newest according patch from your ftp server.
And for this ebuild, my gentoo logs say:

 * sys-kernel/reiser4-sources

     Wed Apr 12 20:55:39 2006 >>> sys-kernel/reiser4-sources-2.6.16.4-r2
     Mon May  1 19:12:11 2006 >>> sys-kernel/reiser4-sources-2.6.16.11-r2
     Mon Aug 14 12:15:16 2006 >>> sys-kernel/reiser4-sources-2.6.17.8-r3

So maybe I also used already reiser4-sources-2.6.16.4-r2...
=2E..but I think I only downloaded this package and I did NOT configure, bu=
ild and actually RUN this version.
=2E..but maybe I also deleted just this kernel-config :-)

---

Thats all I can tell. Hope it helps.


Greetings,

K. Posern


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


On Tue, Aug 29, 2006 at 11:12:01AM -0700, Hans Reiser wrote:
> Thanks.  Did you run an older version of reiser4 before this?  If yes,
> then this may have been fixed but only showed up for you now.  Zam?
>=20
> Hans
>=20
> Posern wrote:
> > Hi.
> >
> > I don't know if this can help you to improve reiser4:
> >
> > On a:
> > Linux jolie 2.6.17.8-reiser4-r3-jolie #1 Tue Aug 15 00:14:45 CEST 2006 =
i686 Intel(R) Pentium(R) 4 CPU 2.53GHz GNU/Linux
> >
> > I was opening a maildir-email-file in mutt via IMAP-SSL running on the =
same machine. The home and root partition on this machine are reiser4.
> >
> > Mutt did NOT open the Email, but told me: "Fetching message... Bus erro=
r" in the status line.
> >
> > The kernel-log from this time told me:
> > Aug 29 09:55:26 [kernel] [17183751.088000] reiser4[mutt(8457)]: present=
_lw_sd (fs/reiser4/plugin/item/static_stat.c:277)[]:
> > Aug 29 09:55:26 [kernel] [17183751.088000] WARNING: partially converted=
 file is encountered
> > Aug 29 09:55:26 [imapd-ssl] Unexpected SSL connection shutdown.
> > Aug 29 09:55:26 [imapd-ssl] DISCONNECTED, user=3Dme, ip=3D[::ffff:127.0=
=2E0.1], headers=3D16823, body=3D254592, time=3D3339, starttls=3D1
> > Aug 29 09:55:26 [kernel] [17183751.132000] reiser4[mutt(8457)]: extent2=
tail (fs/reiser4/plugin/file/tail_conversion.c:714)[nikita-2282]:
> > Aug 29 09:55:26 [kernel] [17183751.132000] WARNING: Partial conversion =
of 2413985: 2 of 3: -22
> > Aug 29 09:55:26 [kernel] [17183751.132000] reiser4[mutt(8457)]: release=
_unix_file (fs/reiser4/plugin/file/file.c:2268)[nikita-3233]:
> > Aug 29 09:55:26 [kernel] [17183751.132000] WARNING: Failed (-22) to con=
vert in release_unix_file (2413985)
> > Aug 29 09:55:29 [imapd-ssl] Connection, ip=3D[::ffff:127.0.0.1]
> > Aug 29 09:55:30 [mutt] unable to dlopen /usr/lib/sasl2/libsql.so: /usr/=
lib/sasl2/libsql.so: cannot open shared object file: No such file or direct=
ory
> > Aug 29 09:55:30 [imapd-ssl] LOGIN, user=3Dme, ip=3D[::ffff:127.0.0.1], =
protocol=3DIMAP
> > Aug 29 09:55:34 [kernel] [17183758.976000] reiser4[mutt(9207)]: extent2=
tail (fs/reiser4/plugin/file/tail_conversion.c:714)[nikita-2282]:
> > Aug 29 09:55:34 [kernel] [17183758.976000] WARNING: Partial conversion =
of 2413985: 2 of 3: -22
> > Aug 29 09:55:34 [kernel] [17183758.976000] reiser4[mutt(9207)]: release=
_unix_file (fs/reiser4/plugin/file/file.c:2268)[nikita-3233]:
> > Aug 29 09:55:34 [kernel] [17183758.976000] WARNING: Failed (-22) to con=
vert in release_unix_file (2413985)
> > Aug 29 09:55:34 [imapd-ssl] Unexpected SSL connection shutdown.
> > Aug 29 09:55:34 [imapd-ssl] DISCONNECTED, user=3Dme, ip=3D[::ffff:127.0=
=2E0.1], headers=3D15902, body=3D3979, time=3D4, starttls=3D1
> > Aug 29 09:58:59 [imapd-ssl] Connection, ip=3D[::ffff:10.10.10.28]
> > Aug 29 09:58:59 [imapd-ssl] LOGIN, user=3Dme, ip=3D[::ffff:10.10.10.28]=
, protocol=3DIMAP
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Even though with thunderbird via IMAP-SSL from another computer I could=
 open this message!
> >
> > After I booted with the www.sysresccd.org v0.2.19 and did a fsck.reiser=
4 on this partition. It said I should run "fsck.reiser4 --build-fs".
> > Unfortunatly I don't have the output of this call (next time :-).
> >
> > Then I booted into my gentoo linux again ... and now the mail opens in =
mutt without error message.
> >
> > Greetings,
> >
> > K. Posern
> >
> >  =20
>=20

--=20
++++++++++++++++++++++++++++++++++++++
MPsoft IT Solutions
Knuth Posern
Weidenhaeuser Str. 26
35037 Marburg
Germany
Tel.  +49 (0) 6421 - 17 68 133
Fax.  +49 (0) 6421 - 17 68 134
Mobil +49 (0) 6421 - 917 963
++++++++++++++++++++++++++++++++++++++


--LTeJQqWS0MN7I/qa
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFE9Iwy3Lt2OxO8u5URAqvVAJ9zNfnGPaQEQwWK6k55IClWb0PGlwCdE7/i
+7LCLVg4yXOjLquaLDSl4HI=
=hiXb
-----END PGP SIGNATURE-----

--LTeJQqWS0MN7I/qa--
