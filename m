From: Laurent CARON <lcaron@lncsa.com>
Subject: Re: Filesystem corruption
Date: Mon, 28 May 2007 20:16:48 +0200
Message-ID: <465B1C90.6040009@lncsa.com>
References: <46598532.5060505@lncsa.com> <Pine.LNX.4.64.0705280025570.10429@sheep.housecafe.de> <Pine.LNX.4.64.0705281829510.6275@sheep.housecafe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-30662-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.64.0705281829510.6275@sheep.housecafe.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com

Christian Kujau a =E9crit :
>> Please try to check the fs with a current version of reiserfsprogs=20
>> first. As the manpage advises, try --check first and use=20
>> --rebuild-tree only if you know what you're doing, IOW: have a current=20
>> backup.

Over the past few years, i experienced a few reiser corruption on=20
various hardware (dell, hp, asus, sata, scsi, ide...) with the same=20
symptoms (unredable file/dir).
Always ran check which told me to run fix-fixable or rebuild-tree, which=20
I did after ensuring of backup reliability, and the error was corrected=20
(after eventually losing a few files i fortunately had in the backups).

>>
>> Also, which kernel/machine is this running on? Do you know *why* this=20
>> corruption may have occured? Any recent hardware issues? Is ther=20
>> anything in the logs regarding fs/device errors?

Kernel is 2.6.19.
The machine does not seem to have any HW issue, nothing strange in the=20
logs..... :$
This is just a plain Dell 2650 server with a bunch of SCSI HDD, software=20
raid5 array, reiserfs on top of it.

Laurent

