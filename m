From: michael chang <thenewme91@gmail.com>
Subject: Re: Reiser4 file recovery
Date: Mon, 10 Oct 2005 11:06:20 -0400
Message-ID: <b14e81f00510100806p7a337ebemec0d193dee57df52@mail.gmail.com>
References: <434A633C.6030507@darthvader.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26448-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <434A633C.6030507@darthvader.us>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yiannis Mavroukakis <jander@darthvader.us>
Cc: reiserfs-list@namesys.com

On 10/10/05, Yiannis Mavroukakis <jander@darthvader.us> wrote:
> Hello :-)
>
> I had an LVM setup of three disks, and one of them went belly
> up..Obvious thought is, use some
> distro like R.I.P to reduce the volume to two disks and try and salvage
> what I could ..unfortunately reiser4 fsck could not find a superblock
> (surprise surprise the disk that died had it) nor could it build the FS
> because it cannot find the metadata..Under normal circumstances, I would
> not bother but my wife's mp3's are in those disks and she will have my
> head if I don't figure out some way to restore them :) Any suggestions?

Maybe you want to use RAID 5 or something instead of LVM, because of
parity, in the future.

I suggest you run Spinrite (grc.com, ~$50 IIRC) on the bad disk from a
floppy or CD-ROM in DOS (the program makes images for you in Windows,
if you have a working partition, or you can get images from the site
IIRC once you've bought a copy) and see how much is recovered
(assuming it's just bad sectors or something).  Re-add it to the LVM,
recover to a seperate media, and then convert the whole thing to a
RAID (maybe via tar?).  I know it's not a free solution, but data
recovery is nearly impossible w/o paying in one way, shape, or form.=20
It's easier to have backups.

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
