From: berthiaume_wayne@emc.com
Subject: RE: reiserfsprogs 3.6.5-pre2 release.
Date: Wed, 26 Feb 2003 10:12:41 -0500
Message-ID: <93F527C91A6ED411AFE10050040665D0049C072B@CORPUSMX1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12936-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: philippe.gramoulle@mmania.com
Cc: reiserfs-list@namesys.com

	Philippe, how many files were on the partition?
Regards,
Wayne.

-----Original Message-----
From: Philippe Gramoull=E9 [mailto:philippe.gramoulle@mmania.com]
Sent: Tuesday, February 25, 2003 7:55 PM
To: reiserfs-list@namesys.com
Subject: Re: reiserfsprogs 3.6.5-pre2 release.



Hi Vitaly,

here is an output of reiserfsck -a on a ~550 Gb Raid5 array filled =
about
60%.

# df /dev/sdb1
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sdb1            572418604 335826568 236592036  59% /prod


#  reiserfsck -V

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.5-pre2


# time reiserfsck -a /dev/sdb1
Reiserfs super block in block 16 on 0x811 of format 3.6 with standard
journal
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


  |  Also, it would be interesting to know how much time does =
reiserfsck -a
take
  |   on big arrays. So if you have a such, try it also please. I mean, =
on
consistent
  |   filsystems, otherwise reiserfsck will switch to the fix-fixable =
mode.

--=20

Philippe Gramoull=E9
philippe.gramoulle@mmania.com
Lycos Europe - NOC France
