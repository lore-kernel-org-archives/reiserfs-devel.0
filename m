From: "Masthan, Dudekula (STSD)" <dudekula.masthan@hp.com>
Subject: Problem with mkreiserfs
Date: Mon, 3 Jul 2006 10:30:28 +0530
Message-ID: <4EEB5A4713E61F49A759A504BECCBC0A028D2112@bgeexc01.asiapacific.cpqcorp.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28898-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com



Hi Folks,

I have a device of size 5219263 blocks (each of size of 4096, Actually
it has 41754107 blocks each of size 512 bytes. I just converted it into
4k blcok). When I try to create reiserfs file system on this device it
reporting ERROR message that there are no enough blocks on the device.

I tried the following command=20
#mkfs -t reiserfs  -b 4096 /dev/sda1 5219263


On the same device I am able to Ext2/Ext3 file system with out any
problem

#mkfs -t ext3 -b 4096 /dev/sda1 5219263 // this command running with out
any problem.

Why I am getting problem with reiserfs file system

Your help is appreciated.

Thanks in advance=20

Regards
Masthan
