From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Reiser4 bug?  Zeros in files.
Date: Tue, 02 Mar 2004 15:20:37 -0700
Message-ID: <1078266036.12548.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-bW0r/E0gXJSbmX5bqokp"
Return-path: <reiserfs-list-return-17017-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

--=-bW0r/E0gXJSbmX5bqokp
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I'm using Reiser4 on MD RAID 0.  I'm seeing blocks of zeros in files.=20
So far, I've only noticed it happen in .xsession-errors and in my
Evolution local mail file.

It's interesting that it seems to happen on even borders in the files.=20
Here's a sample of what I mean:

# xxd ~/.xsession-errors
[snip stuff]
0003fe0: 2d45 5252 4f52 202a 2a3a 2066 696c 6520  -ERROR **: file
0003ff0: 6361 6d65 6c2d 7061 7274 6974 696f 6e2d  camel-partition-
0004000: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0004010: 0000 0000 0000 0000 0000 0000 0000 0000  ................
[snip more zeros]
0004e40: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0004e50: 0000 0000 0000 0000 0000 0000 0000 5769  ..............Wi
0004e60: 6e64 6f77 206d 616e 6167 6572 2077 6172  ndow manager war
0004e70: 6e69 6e67 3a20 576f 726b 696e 6720 6172  ning: Working ar
[snip stuff]
0004fe0: 7468 2069 6420 6033 3938 3638 270a 0a28  th id `39868'..(
0004ff0: 6576 6f6c 7574 696f 6e3a 3130 3335 3029  evolution:10350)
0005000: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0005010: 0000 0000 0000 0000 0000 0000 0000 0000  ................
[snip more zeros]
0005e20: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0005e30: 0000 0000 0000 0000 0000 000a 2865 766f  ............(evo
0005e40: 6c75 7469 6f6e 3a31 3235 3438 293a 2063  lution:12548): c
0005e50: 616d 656c 2d6c 6f63 616c 2d70 726f 7669  amel-local-provi
[end of file]

# xxd ~/evolution/local/Inbox/mbox
[snip stuff]
01fdfe0: 2031 333a 3438 3a31 3720 2d30 3730 300a   13:48:17 -0700.
01fdff0: 5265 6365 6976 6564 3a20 6672 6f6d 206c  Received: from l
01fe000: 0000 0000 0000 0000 0000 0000 0000 0000  ................
01fe010: 0000 0000 0000 0000 0000 0000 0000 0000  ................
[snip zeros]
01fe540: 0000 0000 0000 0000 0000 0000 0000 0000  ................
01fe550: 0000 0000 0000 0000 0000 0000 0046 726f  .............Fro
01fe560: 6d20 4469 6574 6572 2e4e 7565 747a 656c  m Dieter.Nuetzel
01fe570: 4068 616d 6275 7267 2e64 6520 5475 6520  @hamburg.de Tue
[regular stuff to end of file]

In the .xsession-errors file it happened at offset 0x4000 and 0x5000.=20
In my mbox file it happened at 0x1fe000.

So, any ideas?  Things you'd like to know?  Things you'd like me to try?
--=20
Jonathan Briggs
jbriggs@esoft.com

--=-bW0r/E0gXJSbmX5bqokp
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBARQi0G8fHaOLTWwgRAvDpAJ4rDZKBWO6U872zvzNdturxkqIPUACgogww
aEYJAzzJXItv118Qh5Jg2SM=
=eLCV
-----END PGP SIGNATURE-----

--=-bW0r/E0gXJSbmX5bqokp--

