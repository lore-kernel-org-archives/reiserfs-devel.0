From: Posern <foo@posern.org>
Subject: mutt tells me: "Fetching message... Bus error"
Date: Tue, 29 Aug 2006 11:37:56 +0200
Message-ID: <20060829093756.GA9135@jolie.SPINNEN-NET>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Return-path: <reiserfs-list-return-29726-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment
Content-Transfer-Encoding: quoted-printable


Hi.

I don't know if this can help you to improve reiser4:

On a:
Linux jolie 2.6.17.8-reiser4-r3-jolie #1 Tue Aug 15 00:14:45 CEST 2006 i686=
 Intel(R) Pentium(R) 4 CPU 2.53GHz GNU/Linux

I was opening a maildir-email-file in mutt via IMAP-SSL running on the same=
 machine. The home and root partition on this machine are reiser4.

Mutt did NOT open the Email, but told me: "Fetching message... Bus error" i=
n the status line.

The kernel-log from this time told me:
Aug 29 09:55:26 [kernel] [17183751.088000] reiser4[mutt(8457)]: present_lw_=
sd (fs/reiser4/plugin/item/static_stat.c:277)[]:
Aug 29 09:55:26 [kernel] [17183751.088000] WARNING: partially converted fil=
e is encountered
Aug 29 09:55:26 [imapd-ssl] Unexpected SSL connection shutdown.
Aug 29 09:55:26 [imapd-ssl] DISCONNECTED, user=3Dme, ip=3D[::ffff:127.0.0.1=
], headers=3D16823, body=3D254592, time=3D3339, starttls=3D1
Aug 29 09:55:26 [kernel] [17183751.132000] reiser4[mutt(8457)]: extent2tail=
 (fs/reiser4/plugin/file/tail_conversion.c:714)[nikita-2282]:
Aug 29 09:55:26 [kernel] [17183751.132000] WARNING: Partial conversion of 2=
413985: 2 of 3: -22
Aug 29 09:55:26 [kernel] [17183751.132000] reiser4[mutt(8457)]: release_uni=
x_file (fs/reiser4/plugin/file/file.c:2268)[nikita-3233]:
Aug 29 09:55:26 [kernel] [17183751.132000] WARNING: Failed (-22) to convert=
 in release_unix_file (2413985)
Aug 29 09:55:29 [imapd-ssl] Connection, ip=3D[::ffff:127.0.0.1]
Aug 29 09:55:30 [mutt] unable to dlopen /usr/lib/sasl2/libsql.so: /usr/lib/=
sasl2/libsql.so: cannot open shared object file: No such file or directory
Aug 29 09:55:30 [imapd-ssl] LOGIN, user=3Dme, ip=3D[::ffff:127.0.0.1], prot=
ocol=3DIMAP
Aug 29 09:55:34 [kernel] [17183758.976000] reiser4[mutt(9207)]: extent2tail=
 (fs/reiser4/plugin/file/tail_conversion.c:714)[nikita-2282]:
Aug 29 09:55:34 [kernel] [17183758.976000] WARNING: Partial conversion of 2=
413985: 2 of 3: -22
Aug 29 09:55:34 [kernel] [17183758.976000] reiser4[mutt(9207)]: release_uni=
x_file (fs/reiser4/plugin/file/file.c:2268)[nikita-3233]:
Aug 29 09:55:34 [kernel] [17183758.976000] WARNING: Failed (-22) to convert=
 in release_unix_file (2413985)
Aug 29 09:55:34 [imapd-ssl] Unexpected SSL connection shutdown.
Aug 29 09:55:34 [imapd-ssl] DISCONNECTED, user=3Dme, ip=3D[::ffff:127.0.0.1=
], headers=3D15902, body=3D3979, time=3D4, starttls=3D1
Aug 29 09:58:59 [imapd-ssl] Connection, ip=3D[::ffff:10.10.10.28]
Aug 29 09:58:59 [imapd-ssl] LOGIN, user=3Dme, ip=3D[::ffff:10.10.10.28], pr=
otocol=3DIMAP
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Even though with thunderbird via IMAP-SSL from another computer I could ope=
n this message!

After I booted with the www.sysresccd.org v0.2.19 and did a fsck.reiser4 on=
 this partition. It said I should run "fsck.reiser4 --build-fs".
Unfortunatly I don't have the output of this call (next time :-).

Then I booted into my gentoo linux again ... and now the mail opens in mutt=
 without error message.

Greetings,

K. Posern

--=20
+-------------------------------------------------------------+
   K. Posern
   voicebox & phone  +49 (0)6421 - 13 5 75
   mobile phone      +49 (0)6421 - 917 963
+-------------------------------------------------------------+

Ich bin eine Fusszeile. Wenn ich gross bin, moechte ich ein Roman werden.


--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFE9Ar03Lt2OxO8u5URAi9lAJ9j0fyOlsPo5m5dJhGK/F1p4fxwWACfVdBP
0KTHq26V6Znoc2643nGAHtA=
=FJbS
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
