From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: unmountable partition
Date: Thu, 30 Jun 2005 20:47:32 +0400
Message-ID: <1120150050.7866.93.camel@tribesman.namesys.com>
References: <64769d96050630090276093f40@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24846-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <64769d96050630090276093f40@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ch4os <chaosworldwide@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2005-06-30 at 20:02, ch4os wrote:
> Greetings, 
> 
> Had a Mirrored Drive slightly unclipped for a few days. SLES 9 AMD64
> It blew the controller, and syncronized the bad blocks... the sda2
> partition became unmountable.
> 
> I have tried all of the reiserfsck options, with no luck. even the
> badblocks file.
> Always failing on 8210... 
> 
> I have dd_rhelp the partition to an external usb partition.
> and have dd the partition of a another (sdc2) for diagnostics.

To copy partition containing bad blocks
you have to use dd_rescue, or dd with conv=noerror,sync.

> debugreiserfs -B bb.txt /dev/sdc2
> states no bad blocks in the copy of the partition
> but that is also unmountable and the reiserfsck --rebuild-tree says:
> bread: End of file, cannot read the block (17384335).
> 
Please provide information about /dev/sda2 and /dev/sdc2 sizes. I would
guess that sdc2 is smaller.

> I believe that the partition is unrecognized as a reiserfs.
> 
> How do I recreate the header to specify the filesystem type?
> 
> >felix:/mnt # dd if=/mnt/disk.dump of=tempfile bs=1024 count=1
> >felix:/mnt # mount -t reiserfs -o loop tempfile /mnt/recover
> >mount: wrong fs type, bad option, bad superblock on /dev/loop0,
> >       or too many mounted file systems
> >       (could this be the IDE device where you in fact use
> >       ide-scsi so that sr0 or sda or so is needed?)
> 
> I'd compiling the Coroners Toolkit now...
> 
> Thanks
> 

