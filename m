From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: ReiserFS and Reiser4 on AMD64?
Date: Wed, 18 Aug 2004 11:47:55 -0400
Message-ID: <41237A2B.4080607@suse.com>
References: <20040818152342.4be1c0ef.lists@mjh.name>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20380-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040818152342.4be1c0ef.lists@mjh.name>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Milan_Holz=E4pfel?= <lists@mjh.name>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Milan Holz=E4pfel wrote:
| Hello,
|
| I would like know whether you can tell me some state of ReiserFS and
| Reiser4 on AMD64.  I'm asking the the former because the gentoo docs say
| that ReiserFS on AMD64 is not really stable so far ([1]) and the latter
| because I have no idea of Reiser4's state on AMD64.  (but given that
| there was some guy experimenting with Reiser4 on some Sparc 64 Bit
| system and AMD64 is still a little endian system (isn't it?) I'd guess
| that the chance of at least getting it to work would be rather good...)
|
| I'm asking because my new AMD64 hardware will shipped the next days and
| I plan mainly using gentoo Linux in 64-Bit mode with ReiserFS (for a
| "backup" system install) and Reiser4 (for the rest except backups and
| personal data) as far as possible and advisable.
|
| Any hints are appreciated.
| Thanks,
| Milan
|
| [1]:
<URL:http://www.gentoo.org/proj/en/base/amd64/technotes.xml?part=3D2&chap=
=3D3#doc_chap3>
|

I'm not sure what "problems" gentoo users are seeing because they've
never been reported to this list, but I have several AMD64 systems and I
haven't seen any problems on them. Outside of the nebulous Gentoo
"reiserfs is unstable on amd64" comments, I haven't heard of any
problems either.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBI3orLPWxlyuTD7IRAi+9AJ0cdmf7owmHetwgMZ1NuGUsvIO0kwCeOWmI
kGY2A1I9Trphr+EEvc/6Ylg=3D
=3DLrYI
-----END PGP SIGNATURE-----
