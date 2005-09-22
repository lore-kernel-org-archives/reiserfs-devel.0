From: Valdis.Kletnieks@vt.edu
Subject: Re: Will I need to re-format my partition for using the compression plugin?
Date: Thu, 22 Sep 2005 16:38:31 -0400
Message-ID: <200509222038.j8MKcVFQ011764@turing-police.cc.vt.edu>
References: <194f625505092006316ad200b5@mail.gmail.com> <2f4958ff05092208244a0496fc@mail.gmail.com> <4332DE9F.8010808@namesys.com> <200509221951.38302.namesys.Sch@ttgen.net>
            <43330E14.9050209@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1127421511_2709P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26242-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 23 Sep 2005 00:03:32 +0400."
             <43330E14.9050209@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>
Cc: Fred Schaettgen <namesys.Sch@ttgen.net>, reiserfs-list@namesys.com

--==_Exmh_1127421511_2709P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Sep 2005 00:03:32 +0400, Edward Shishkin said:

> Checksuming means a low
> performance: in order to read some bytes of such file you will need=20
> first to read the whole file
> to check a checksum (isnt it?).

No.  Almost all modern networking gear is *perfectly* able to do incremen=
tal
updates of the checksum.  See this RFC:

1141 Incremental updating of the Internet checksum. T. Mallory, A.
     Kullberg. Jan-01-1990. (Format: TXT=3D3587 bytes) (Updates RFC1071)
     (Updated by RFC1624) (Status: INFORMATIONAL)
http://www.ietf.org/rfc/rfc1141.txt

The method is trivially extensible to other CRC schemes - and in fact, th=
e
triviality is the entire reason why cryptographically strong hashes like =
MD5 or
the SHA family are interesting at all.  (I've seen more than one definiti=
on of
=22cryptographically strong hash=22 as being basically a CRC function tha=
t does
*not* permit incremental updating....)


--==_Exmh_1127421511_2709P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFDMxZHcC3lWbTT17ARAoq/AJ99PD2ODDrkJqnh/3t1k5gIkyIAbACgwgQJ
Im1JcsV1d1KCgeECBt+xbXg=
=8rO7
-----END PGP SIGNATURE-----

--==_Exmh_1127421511_2709P--
