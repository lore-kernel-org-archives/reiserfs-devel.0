From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@o2.pl>
Subject: Re: problem with reiser4
Date: Wed, 23 Mar 2005 15:57:29 +0100
Message-ID: <opsn3ih3nst3f2uk@localhost>
References: <4224BA6B.7040402@iparadigms.com> <opsnkzb7igt3f2uk@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <opsnkzb7igt3f2uk@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Sun, 13 Mar 2005 15:46:45 +0100, =A3ukasz Mierzwa <prymitive@o2.pl> na=
pisa=B3:

> Dnia Tue, 01 Mar 2005 10:54:35 -0800, fitzboy <fitzboy@iparadigms.com> na=
pisa=B3:
>
>> Hello all,
>> I'm just switching from 2.4/reiser3 to 2.6/reiser4 on the first batch of
>> machines. We are running a bunch of apple xRAIDs connected to Dell
>> servers running Debian. we have the 2.6.10-mm kernel and we can make the
>> reiser4 partitions, but there is a lot of lost space somewhere. If I
>> create a reiser3 or xfs partition, I get 1.1T, but with reiser4 I can't
>> get above 984GB. That is too much of a jump to be explained by overhead,
>> so something is wrong... any thoughts?
>

It's still present in reiser4-for-2.6.11-1 patch:

gremlin prymitive # mkfs.reiserfs /dev/hda6
mkfs.reiserfs 3.6.19 (2003 www.namesys.com)

A pair of credits:
Lycos Europe  (www.lycos-europe.com)  had  a  support  contract  with  us  =
that
consistently came in just when we would otherwise have missed payroll, and =
that
they kept doubling every year. Much thanks to them.

Chris Mason wrote the journaling code for V3,  which was enormously more us=
eful
to users than just waiting until  we could create a wandering log filesyste=
m as
Hans would have unwisely done without him.
Jeff Mahoney optimized the bitmap  scanning code for V3,  and performed the=
 big
endian cleanups.


Guessing about desired format.. Kernel 2.6.11-gentoo-r4 is running.
Format 3.6 with standard journal
Count of blocks on the device: 2522192
Number of blocks consumed by mkreiserfs formatting process: 8288
Blocksize: 4096
Hash function used to sort names: "r5"
Journal Size 8193 blocks (first block 18)
Journal Max transaction length 1024
inode generation number: 0
UUID: 5f7b9070-0f62-496c-b288-308663df7689
ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
         ALL DATA WILL BE LOST ON '/dev/hda6'!
Continue (y/n):y
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..ok

Tell your friends to use a kernel based on 2.4.18 or later, and especially =
not a
kernel based on 2.4.9, when you use reiserFS. Have fun.

ReiserFS is successfully created on /dev/hda6.
gremlin prymitive # mount -t reiserfs /dev/hda6 /mnt/cdrw/
df
gremlin prymitive # df
System plik=F3w      bl. 1MB B        u=BFyte dost=EApne %u=BF. zamont. na
/dev/hda1               9731MB    5882MB    3849MB  61% /
/dev/hda5              60997MB   32990MB   28008MB  55% /home
none                     262MB       0MB     262MB   0% /dev/shm
/dev/hda6              10331MB      34MB   10297MB   1% /mnt/cdrw
gremlin prymitive # umount /mnt/cdrw
gremlin prymitive # mkfs.reiser4 /dev/hda6
mkfs.reiser4 1.0.4
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by =
reiser4progs/COPYING.

Block size 4096 will be used.
Linux 2.6.11-gentoo-r4 is detected.
Uuid dfe381a5-0eca-4844-9502-6576da0abc3f will be used.
Reiser4 is going to be created on /dev/hda6.
(Yes/No): Yes
Creating reiser4 on /dev/hda6 ... done
gremlin prymitive # mount -t reiser4 /dev/hda6 /mnt/cdrw/
gremlin prymitive # df
System plik=F3w      bl. 1MB B        u=BFyte dost=EApne %u=BF. zamont. na
/dev/hda1               9731MB    5882MB    3849MB  61% /
/dev/hda5              60997MB   32990MB   28008MB  55% /home
none                     262MB       0MB     262MB   0% /dev/shm
/dev/hda6               9817MB       1MB    9816MB   1% /mnt/cdrw

10331MB on reiserfs 3.6 vs 9817MB on reiser4
this was run under amd64 gentoo box
reiser4progs and libaal 1.0.4 were used
kernel was 2.6.11 patched with reiser4-for-2.6.11-1 pulled from namesys ser=
ver

Can someone help with this bug?

=A3ukasz Mierzwa
