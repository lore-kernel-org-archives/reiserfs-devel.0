From: =?ISO-8859-2?Q?=22Branko_F=2E_Gra=E8nar=22?= <bfg@noviforum.si>
Subject: df -i  reports '-' inodes available on reiser4
Date: Thu, 03 Mar 2005 13:45:52 +0100
Message-ID: <42270700.2010908@noviforum.si>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

We're evaluating reiser4 filesystem for our storage server, which will
run on linux 2.6.x.

However, according to our tests it performs very well. Becouse our
storage server will be responsible to server very *huge* amount of small
files, we need to investigate the following issue:

Command df -i reports '-' as number of used and total inodes available
on filesystem.

Is this a bug, or a feature? Or i missed out some documentation which i
should read before i formatted storage volume?


Best regards,

- --

Branko F. Gracnar
Sistemska administracija / razvoj
Noviforum d.o.o., Stegne 31, SI-1000 Ljubljana
Tel > 00 386 1 500 8528 ,
Fax > 00 386 1 519 73 88
e-mail > bfg@noviforum.si
www.noviforum.si, www.najdi.si

-----BEGIN PGP SIGNATURE-----

iD8DBQFCJwcAN7LHXgqRB4IRAvUXAJ4+JsaB3jvFYhHYngSHR9niSowskQCfRG45
6dnzCV/hfkFhzI39VGpqKro=
=4Dqi
-----END PGP SIGNATURE-----
