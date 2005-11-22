From: Dewey Sasser <dewey@sasser.com>
Subject: Re: Help tracking down files on a bad block:  understanding the output
 of debugreiserfs
Date: Tue, 22 Nov 2005 15:22:13 -0500
Message-ID: <43837DF5.30407@sasser.com>
References: <43835EFD.40906@sasser.com> <43836AE9.5020403@muenning.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27086-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43836AE9.5020403@muenning.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Cc: reiserfs-list@namesys.com

Konstantin M=FCnning wrote:
> Hi!
>
> Unfortunately I can't help you with the debugreiserfs output but maybe
> with another approach for finding the correct blocknum of the bad
> sector(s). Why don't you try
>
> badblocks -b 4096 /dev/hda5
>  =20
Interesting.  When reading the badblocks man page I originally=20
interpreted something it said to mean that it wouldn't run against a=20
mounted partition.  I see now that that is not the case.  It will only=20
refuse to run doing tests which write the partition, which is as it=20
should be.

The partition affected is the root partition of a machine 700 miles from=20
my chair and there is no one near the box that had any kind of Linux=20
knowledge.  I am therefore trying to do this as much "on-line" as=20
possible.  I will run "badblocks" at some point but I'll still need a=20
way of mapping the bad block or sector to the affected files.  (Yes, I=20
do have backups :)
> dd of=3D/dev/null if=3D/dev/hda5 bs=3D4k count=3D1 skip=3Dxxx
>
> with xxx the block number(s) of your calculation or output from
> badblocks. Just to check if the block you've found is really unreadable.
>  =20
That is indeed one of my additional questions -- does the fact that=20
debugreiserfs prints data mean the block (sector, really) is readable? =20
Or does it mean my math is incorrect.  "badblocks" should help me answer=20
that question.
> How to identify the inode number corresponding to that block I can't
> tell but finding the file etc. to the inode may be done with
>
> find /mount-point-of-fs -inum xxx
>  =20
Yep.  That part I can handle.  It's that middle link I'm missing :)

Thanks for your response,

--
Dewey
