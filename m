From: rudekjan@freenet.de
Subject: Re: 2.6.15.1+reiser4 Kernel Panic
Date: Tue, 31 Jan 2006 01:49:38 +0100
Message-ID: <E1F3jiE-0006ZP-Cq@www7.emo.freenet-rz.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27941-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,
i have the same Problem witch 2.6.16-rc1 with the reiser4 Patch from ftp.na=
mesys.com.
Same error and the System is frozen to. But I wanted to copy data from Part=
ition A (Reiser3) to Partition B (Reiser4).

greets

Jan

From: "Vladimir V. Saveliev" <vs@namesys.com>
        To: Ps <Ps_Mail@freenet.de>
        Date: Mon, 30 Jan 2006 11:29:18 +0300
        Subject: Re: 2.6.15.1+reiser4 Kernel Panic
        Hello
       =20
        On Sun, 2006-01-29 at 11:44 +0100, Ps wrote:
        > Hi,
        >
        > i've got a kernel panic with kernel 2.6.15.1 + reiser4 patch from
        > ftp.namesys.com, when writing data to a usb harddisk.
        >
        > kernel output:
        > loop4: loop_end_io_transfer err=3D-95 bi_rw=3D0x5=20
        > reiser4 panicked cowardly: reiser4[pdflush(6748)]: commit_current=
_atom
        > (fs/reiser4/txnmgr.c:1130)[zam-597]
        > write log failed (-5)
        >
        > reiser4 panicked cowardly: reiser4[pdflush(6748)]: commit_current=
_atom=20
        > (fs/reiser4/txnmgr.c:1130)[zam-597]
        > write log failed (-5)
        >
        > and the machine is *frozen*
        >
        > the harddisk is encrypted via loop-aes v3.1c (loop4). i think it'=
s a
        > reiser4 or kernel 2.6.15 bug, because loop-aes with kernel <2.6.1=
5 is
        > running quite perfekt. fsck.reiser4 1.0.5 says the filesystem is =
clear.
        >
       =20
        can you reproduce the problem?
       =20
        > Best Regards,
        > Patrick=20
        >
        >
        =0A=0A=0A=0A"Jetzt Handykosten senken mit klarmobil - 14 Ct./Min.! =
Hier klicken"=0Awww.klarmobil.de/index.html?pid=3D73025=0A
