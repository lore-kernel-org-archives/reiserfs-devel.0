From: "Alexander Waller" <a.waller@webpoint.at>
Subject: Lost Files
Date: Wed, 29 Oct 2003 10:06:26 +0100
Message-ID: <200310290906.h9T96nsO020624@mail02.webpoint.co.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15924-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: webmaster@webpoint.at

Hi !
Yesterday it was the third time I lost important files on a
reiserfs-partition.
This time I had a reasonable backup.
So i could minimize the time my server was offline.
I use S.u.S.E 8.2.
The first to times reiserfsck was not able to repair any file. I found =
all
of them in the directory /lost+found, but that was not good for me. ( =
11000
files there )
This time about 5000 files were in /lost+found and the rest in the right
place.

Is this a normal behavior or do you think I have a hardware problem ?
Is the S.u.S.E implementation wrong ?
Shall I change to ext3 ? ( It=B4s slower, I know )

Whats the right strategie to recover a defetive partition ?

Alex.


--=20

WebPoint Internet Solutions
Alexander Waller
Vorarlberger Wirtschaftspark
A-6840 G=F6tzis
=20
www.webpoint.at
tel.  +43 5523 58244
fax.  +43 5523 58255
mobil +43 676 4121128
=20
webmaster-team  : webmaster@webpoint.at
hostmaster-team : hostmaster@webpoint.at

***                                     ***
*       WebPoint Internet Solutions       *
***                                     ***
=20

