From: Andreas <IOBuf@gmx.de>
Subject: Re: fsck.reiser4 problem (was: reiser4 corruption problem)
Date: Tue, 31 Aug 2004 16:03:56 +0200
Message-ID: <200408311603.56537.IOBuf@gmx.de>
References: <20040831012446.631CB15E2E@mail03.powweb.com> <200408311209.43653.IOBuf@gmx.de> <1093955415.2716.476.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21157-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093955415.2716.476.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: reiserfs-list@namesys.com

Hello,

> Would you, please, provide exact sequences of operations which confuses
> reiser4?

mkfs.reiser4 /dev/discs/disc0/part2
mount /dev/discs/disc0/part2 /mnt/d0p2
touch /mnt/d0p2/abcdefghijklmnopq=E4=F6=FC=DF=DF=DF=DF
umount /mnt/d0p2
fsck.reiser4 /dev/discs/disc0/part2


And as I now realize "fsck.reiser4 --build-fs" produces always a segmentati=
on=20
fault here, even on a newly created Reiser4 filesystem.

Bye
 Andreas
