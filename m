From: Vitold Kapshitzer <vitold@vitou.com>
Subject: Re: Re: reiserfsck --rebuild-tree all-in-one problem.
Date: Wed, 29 Mar 2006 22:00:49 +0200
Message-ID: <1143662449-e0bd7a21af9c42cec0979c806ebe6936@vitou.com>
References: <1143548397.23834.124.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28404-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1143548397.23834.124.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Hello,

Fantastic, after one day of scan, reiserfsck-3.6.20 did it ! My lvm array is=
=20now back online.

Many thanks for your help

Vitold



----- Message d'origine -----
De: "Vladimir V. Saveliev" <vs@namesys.com>
Date: Tue, 28 Mar 2006 16:19:57 +0400
Sujet: Re: reiserfsck --rebuild-tree all-in-one problem.
=C0: Vitold Kapshitzer <vitold@vitou.com>
Cc: reiserfs-list@namesys.com

>Hello
>
>On Tue, 2006-03-28 at 13:48 +0200, Vitold Kapshitzer wrote:
>> Hello,
>>=20
>> I'm trying to do a rebuild-tree for days now, it seams that I've got the s=
ame probleme above. The server didn't hang when the error accured. I've turne=
d on the monitor on the morning and have seen that the disk got full (was abo=
ut 120Go free, 650Go total), the root disk is also reiserfs but is ok, reiser=
fsck(3.6.19) told me that I need to run reiserfsck with the rebuild-tree opti=
on but it never ended. Only my LVM logical disk is now unmountable.
>>=20
>> I am using gentoo, and I've already tried to recompile reiserfsprogs,  but=
 unfortunatly, same result.
>>=20
>
>I am told that this problem might be fixed already. Would you try
>ftp://ftp.namesys.com/pub/tmp/reiserfsprogs-3.6.20.tar.gz, please?
>
>> Thanks
>>=20
>> Vitold
>>=20
>> on Sunday 02 February 2003 21:33, Brian Chu wrote:
>> > Hello.
>> >
>> >     Last friday when I went to upgrade my server, I noticed that there h=
ad
>> > been a lot of kernel messages on my server that were saying that one
>> > partition was spewing this:
>> >
>> > Jan  5 13:48:14 simmy kernel: hde: dma_intr: status=3D0x51 { DriveReady
>> > SeekComplete Error }
>> > Jan  5 13:48:14 simmy kernel: hde: dma_intr: error=3D0x40 {
>> > UncorrectableError }, LBAsect=3D91887, high=3D0, low=3D91887, sector=3D9=
1824
>> > Jan  5 13:48:14 simmy kernel: end_request: I/O error, dev 21:01 (hde),
>> > sector 91824
>> > Jan  5 13:48:14 simmy kernel: vs-13070: reiserfs_read_inode2: i/o failur=
e
>> > occurred trying to find stat data of [7495 7710 0x0 SD]
>> >
>> >     I gave up that night, because running dd once took 7 hours and
>> > reiserfsck twice took 2 hours each, so the whole day was wasted.  I had
>> > read on the first time I ran --rebuild-tree that a "dd_rescue" was
>> > suggested, so I downloaded it, installed it, and ran it again (since I h=
ad
>> > used just plain dd the first time). I'm not sure if that made a differen=
ce
>> > or not.
>>=20
>> Right, dd seems to produce an output with just skipped bad blocks not writ=
ing=20
>> anything into the output.
>>=20
>> >     Today I started again, assuming that with dd_rescue, I would have a
>> > greater chance of getting the filesystem recovered, but --check told me=
=20I
>> > had to run --rebuild-tree, and this time I just did --logfile /dev/null,=

>> > because screen dumps during the run would make it impossible to see what=
's
>> > going on. But again, it stopped again at the same place- Pass 2. Since t=
he
>> > logfiles spit so much STUFF out, I have none at the moment (I can remake=

>> > them if needed).
>> >
>> > Screen dump:
>> >
>> > Pass 2:
>> > 0%....20%....40%..                                              left 36,=
 0
>> > /sec
>> >
>> >     And it stops there. top indicates reiserfsck is using all of the cpu=

>> > cycles, even after it seemingly freezes.
>>=20
>> Looks like you built the reiserfsck on another mashine. Could you rebuild=
=20it=20
>> on the same mashine you run it. It is possible to suppress the logfile wit=
h=20
>> -n option, but I think the logfile was so big due to this endless loop.
>>=20
>
>
