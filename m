From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Wed, 26 Feb 2003 01:54:48 +0100
Message-ID: <20030226015448.1efac468.philippe.gramoulle@mmania.com>
References: <200302251650.22469.vitaly@namesys.com>
	<200302251712.45985.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12926-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302251712.45985.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com


Hi Vitaly,

here is an output of reiserfsck -a on a ~550 Gb Raid5 array filled about 60=
%.

# df /dev/sdb1
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sdb1            572418604 335826568 236592036  59% /prod


#  reiserfsck -V

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.5-pre2


# time reiserfsck -a /dev/sdb1
Reiserfs super block in block 16 on 0x811 of format 3.6 with standard journ=
al
Blocks (total/free): 143109020/59148009 by 4096 bytes
Filesystem is cleanly umounted
Replaying journal..
0 transactions replayed
Checking internal tree..finished                 =20

real    0m47.890s
user    0m6.668s
sys     0m0.732s

Hope that helps.

Thanks,

Philippe


On Tue, 25 Feb 2003 17:12:45 +0300
Vitaly Fertman <vitaly@namesys.com> wrote:


  |  Also, it would be interesting to know how much time does reiserfsck -a=
 take
  |   on big arrays. So if you have a such, try it also please. I mean, on =
consistent
  |   filsystems, otherwise reiserfsck will switch to the fix-fixable mode.

--=20

Philippe Gramoull=E9
philippe.gramoulle@mmania.com
Lycos Europe - NOC France

