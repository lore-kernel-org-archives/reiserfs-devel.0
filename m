From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Still wrong reported file size after --rebuild-tree
Date: Thu, 31 Oct 2002 12:45:17 +0300
Message-ID: <15808.64429.674075.310428@laputa.namesys.com>
References: <20021030193045.69179289.philippe.gramoulle@mmania.com>
	<20021031035736.GG14386@mrball.net>
	<20021031102146.33112432.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11855-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021031102146.33112432.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

Philippe Gramoull=E9 writes:
 > On Wed, 30 Oct 2002 19:57:36 -0800
 > Todd Lyons <todd@mrball.net> wrote:
 >=20
 >   |  Philippe Gramoull=E9 wanted us to know:
 >   | =20
 >   |  >I just wanted to let you know that after rebuilding the tree for a=
 500Go
 >   |  >volume, i still have wrong file size reported :
 >   |  >/dev/sdb1            572418604 174714996 397703608  31% /storage
 >   | =20
 >   |  Hmmm, ours showed 96% or something like that.  I'll check to see if=
 it's
 >   |  accurate.
 >=20
 > oh, the above figures are correct. I only wanted to report about the bog=
us files sizes
 > below.
 >=20
 >   | =20
 >   |  >-r-x--x---    1 19415372 19415373 83388383504122186 Aug 13  1970 2=
5s_lb.jpg
 >   |  >-r--rw-rw-    1 19415354 19415355 83388306194710840 Aug 13  1970 2=
5slight.jpg
 >   |  >-r---wxrwx    1 19415331 19415332 83388207410463009 Aug 13  1970 2=
5slight_ln.jpg
 >   | =20
 >   |  We had these too.  Humongous uid and gid numbers.

They are also -consequent-, and Oleg found that they look conspicuous
when printed in hex (with file sizes).

 >=20
 > Though we do use 32 bits UIDs & GIDs ( up to 2 Millions or so right now =
), we don't
 > have ones up to 19415331 :o) Not yet :o)
 >   | =20
 >   |  >I'll make metadata available as soon as debugreiserfs is finised.
 >   |  >(reiserfsck used was 3.6.4 ( 3.6.4 pre3)
 >   | =20
 >   |  I really don't think it's a requirement to see our metadata as our
 >   |  problems were caused by faulty hardware and not any bugs in the fs
 >   |  itself.
 >=20
 > In my case, i don't think the hardware is broken but there have been som=
e poweroffs that seem
 > to have damaged the FS somewhat. Raid volumes have been checked, disks a=
re ok , logical volume
 > consistency as well, so it's up to ReiserFS team to say if something's w=
rong with reporting those
 > file sizes even after a full --rebuild-tree.
 >=20
 > Thanks,
 >=20
 > Philippe

Nikita.
