From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: Thu, 27 Feb 2003 00:40:22 +0100
Message-ID: <20030227004022.6d95c5dd.philippe.gramoulle@mmania.com>
References: <93F527C91A6ED411AFE10050040665D0049C072B@CORPUSMX1>
	<200302261914.29475.vitaly@namesys.com>
	<20030226122144.U1373@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12947-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030226122144.U1373@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: vitaly@namesys.com, berthiaume_wayne@emc.com, reiserfs-list@namesys.com

Hi,

Well, the first reiserfsck run (with mount/umount done before) took
48sec/49sec , subsequent runs took about 45sec/46sec.

Thanks,

Philippe

On Wed, 26 Feb 2003 12:21:44 -0700
Andreas Dilger <adilger@clusterfs.com> wrote:


  |  I suppose the other way to test it would be to run 2 "reiserfsck -a"
  |   in a row.

--=20

Philippe Gramoull=E9
philippe.gramoulle@mmania.com
Lycos Europe - NOC France

