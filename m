From: Philipp =?iso-8859-1?q?G=FChring?= <p.guehring@futureware.at>
Subject: Re: what do you do that stresses your filesystem?
Date: Sun, 5 Jan 2003 16:01:20 +0100
Message-ID: <200301051514.h05FE0X02349@linux1.futureware.at>
References: <3E06F360.7000708@namesys.com>
Reply-To: p.guehring@futureware.at
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12266-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E06F360.7000708@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>, ReiserFS <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

> Booting the machine seems like one activity that many users end up
> waiting on the FS for.  Yes?

Yes, I think this is the "Linux factor". Seeing how long booting needs.=20
(Although I think that timeouts like the SCSI initialisation or non-existin=
g=20
DHCP servers need far more time than optimizing the filesystem could ever=20
give)

> Starting up complex and big applications like xemacs and mozilla would
> be another.  Yes?

Yes, especially have a look at KDE.=20
(They have a longstanding performance discussion with all the shared=20
libraries, ...)

> Others?

I am currently thinking about multi-dimensional region search=20
(Sedgewick, "Algorithms in C", chapter 26 in the german edition), and how=20
something similar could be implemented on ReiserFS.
I am currently developing a Location-Based-Service application on top of my=
=20
IVI::DB (XML-ReiserFS database), and having 3-dimensional region searches i=
s=20
the primary service, my application has to provide.

At first, I wanted to implement Sedgewick's algorithm completely in RAM, bu=
t=20
now the requirements changed, and I have to do it in the filesystem, and I =

calculate with 30000 queries per minute.

Many greetings,
- --=20
~ Philipp G=FChring              p.guehring@futureware.at
~ http://www.livingxml.net/       ICQ UIN: 6588261
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+GEjRlqQ+F+0wB3oRApf/AJ4g2pnacYjVfkv0tROaM8gOn5UWIgCfevfI
uvOuZSRMt3lrv7wj8x2MIAU=3D
=3DlY5a
-----END PGP SIGNATURE-----
