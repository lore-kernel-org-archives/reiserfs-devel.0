From: <mailinglists@d-g-c.de>
Subject: Re: ReiserFS V4 kernel 2.6.9-rc1 mm4
Date: Wed, 15 Sep 2004 14:29:30 +0200
Message-ID: <003901c49b1f$a792e550$0a00a8c0@splatter>
References: <1095149098.13920.ezmlm@namesys.com> <42492.80.156.40.148.1095149724.squirrel@webmail.d-g-c.de> <1095177597.5478.172.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21754-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi again,

> Hello
>
> On Tue, 2004-09-14 at 12:15, mailinglists@d-g-c.de wrote:
> > Hi,
> > i have got a big problem with my 220GB reiser4 partition. it is mounted
to
> > /home. i want to share it with nfs-server v3. it is mountable by a
foreign
> > client - but i get input/output errors when i try to swith into a
> > subdirectory or a "ls -la". a simple "ls" does work without errors! are
> > there any known nfs/reiser4 problems?
> >
> Please describe configurations of both server and client: hardware and
> software.
> Does ls -la work on local filesystem?
> What does dmesg say when ls -la reports i/o error?

my fstab:
==================================================
/dev/hde1               /boot           ext2            noauto,noatime
1 2
/dev/hde5               /               reiserfs        noatime
0 0
/dev/hde2               none            swap            sw
0 0
/dev/hde6               /usr            reiserfs        noatime
0 0
/dev/hde7               /var            reiserfs        noatime
0 0
/dev/hde8               /opt            reiserfs        noatime
0 0
/dev/hde9               /tmp            reiserfs        noatime
0 0
/dev/hde10              /home           reiser4         noatime
0 0
/dev/cdroms/cdrom0      /mnt/cdrom      iso9660         noauto,ro
0 0
#/dev/fd0               /mnt/floppy     auto            noauto
0 0
none                    /proc           proc            defaults
0 0
none                    /dev/shm        tmpfs           defaults
0 0
capifs                  /dev/capi       capifs          defaults
0 0
==================================================

so my only reiser4 patition is hde10. exporting any other partition (eg.
/tmp) with nfs i do not get any errors!
a local ls -la is working fine! also the samba 3.0.5 server is sharing all
files on /home/samba without any problems.
i also got clamavd running for samba - all working fine. only the nfs
exports make problems...

the client is a 2.4.24 kernel with no nfs v3 support - but mounting /tmp
works fines...

greetz florian engelmann


>
>
> > thx and greetz
> >  florian engelmann
> >
> >
>
>


