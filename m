From: Lars Grobe <grobe@gmx.net>
Subject: RE: reiserfs with mosix ?
Date: Mon, 14 Jul 2003 21:08:00 +0200 (MEST)
Message-ID: <3109.1058209680@www61.gmx.net>
References: <08628CA53C6CBA4ABAFB9E808A5214CB0179043E@mercury.infiniconsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14934-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Barry, Christopher" <cbarry@infiniconsys.com>
Cc: reiserfs-list@namesys.com

> Nope. You'll need Sistina's GFS for that. Also, do to locking semantics, =
=20
> I'm unsure of the effectiveness of this arrangement with Samba. You'll =20
> need to verify it with Sistina. Also, the power of MOSIX is in many =20
> small long-duration processes that can be migrated from the initial =20
> starting host to other MOSIX enabled machines. I'm not sure that the =20
> scenario you articulate would be a good fit for this. Possibly LVS or =20
> Heartbeat would be a better fit.=20
=20
Hi!=20
=20
If there is need of a shared fs, the solution is gfs or opengfs (the free=20
one ;-). If it is sufficient to share a fs over the network, mosix brings=20
it's own mfs which provides you with the same representation of your date=20
on all cluster nodes. If it is ok to have volume A served by server A and=20
volume B by server B (if you can divide your data into two sets), reiserfs =

is fine.=20
=20
We are currently evaluating a configuration with two servers (one samba,=20
the other one netatalk and nfs) accessing a shared gfs (sistina) on a=20
fibrechannel storage. If we decide not to choose this, we will divide=20
data in sets and export some volumes from one, other from the second=20
server - this would keep us using reiserfs on the file server ;-)=20
=20
I know that there have been tests with mosix in storage / file server=20
applications, and I have a pdf here, if someone is interested, tell me -=20
I certainly won't post it to the whole list ;-)))=20
=20
One last - reiserfs patches and mosix patches coexist friendly here.=20
=20
CU Lars.=20

--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++

Jetzt ein- oder umsteigen und USB-Speicheruhr als Pr=E4mie sichern!

