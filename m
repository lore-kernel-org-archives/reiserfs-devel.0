From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: Re: Still wrong reported file size after --rebuild-tree
Date: Thu, 31 Oct 2002 10:21:46 +0100
Message-ID: <20021031102146.33112432.philippe.gramoulle@mmania.com>
References: <20021030193045.69179289.philippe.gramoulle@mmania.com>
	<20021031035736.GG14386@mrball.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11854-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021031035736.GG14386@mrball.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Wed, 30 Oct 2002 19:57:36 -0800
Todd Lyons <todd@mrball.net> wrote:

  |  Philippe Gramoull=E9 wanted us to know:
  | =20
  |  >I just wanted to let you know that after rebuilding the tree for a 50=
0Go
  |  >volume, i still have wrong file size reported :
  |  >/dev/sdb1            572418604 174714996 397703608  31% /storage
  | =20
  |  Hmmm, ours showed 96% or something like that.  I'll check to see if it=
's
  |  accurate.

oh, the above figures are correct. I only wanted to report about the bogus =
files sizes
below.

  | =20
  |  >-r-x--x---    1 19415372 19415373 83388383504122186 Aug 13  1970 25s_=
lb.jpg
  |  >-r--rw-rw-    1 19415354 19415355 83388306194710840 Aug 13  1970 25sl=
ight.jpg
  |  >-r---wxrwx    1 19415331 19415332 83388207410463009 Aug 13  1970 25sl=
ight_ln.jpg
  | =20
  |  We had these too.  Humongous uid and gid numbers.

Though we do use 32 bits UIDs & GIDs ( up to 2 Millions or so right now ), =
we don't
have ones up to 19415331 :o) Not yet :o)
  | =20
  |  >I'll make metadata available as soon as debugreiserfs is finised.
  |  >(reiserfsck used was 3.6.4 ( 3.6.4 pre3)
  | =20
  |  I really don't think it's a requirement to see our metadata as our
  |  problems were caused by faulty hardware and not any bugs in the fs
  |  itself.

In my case, i don't think the hardware is broken but there have been some p=
oweroffs that seem
to have damaged the FS somewhat. Raid volumes have been checked, disks are =
ok , logical volume
consistency as well, so it's up to ReiserFS team to say if something's wron=
g with reporting those
file sizes even after a full --rebuild-tree.

Thanks,

Philippe
