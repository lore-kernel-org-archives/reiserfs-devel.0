From: "Jake Hawkes" <jake@infinitylimited.net>
Subject: Re: shrink reiserfs
Date: Sun, 23 Jan 2005 14:53:19 -0700 (MST)
Message-ID: <18958.62.135.89.53.1106517199.squirrel@mail.infinitylimited.net>
References: <17956.62.135.89.53.1106495294.squirrel@mail.infinitylimited.net>
    <20050123171105.GG10921@backtop.namesys.com>
    <18298.62.135.89.53.1106502596.squirrel@mail.infinitylimited.net>
    <20050123190735.GH10921@backtop.namesys.com>
    <18682.62.135.89.53.1106507496.squirrel@mail.infinitylimited.net>
    <20050123194918.GI10921@backtop.namesys.com>
    <20050123212315.GK10921@backtop.namesys.com>
Reply-To: jake@infinitylimited.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-23198-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050123212315.GK10921@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Alex Zarochentsev said:

> oops, i can't reproduce the bug anymore, seems i forgot '-' in
> "-s -1G" option in my first resize attempt.  3.6.19, 3.6.18 work well
> for me.


well - I upgraded and set an exact size to reize to, and it worked fine,
so I can only assume that I messed up the command line args somehow.

My next question, can I grow a reiserfs filesystem backwards in the
partition?

I have resized my filesystem, and deleted and re-created my partition
accordingly.

Disk /dev/hda: 60.0 GB, 60011642880 bytes
255 heads, 63 sectors/track, 7296 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1               1           6       48163+   6  FAT16
/dev/hda2   *           7        2074    16611210    7  HPFS/NTFS
/dev/hda3            2437        2439       24097+  83  Linux [boot-ext3]
/dev/hda4            2440        4398    15735667+  83  Linux [ reiser ]


I'd like to delete partition 3 & 4, and create a new partition from 2437
to 4398, and then grow the reiserfs filesystem to fill it, only, its going
to be lower/before the filesystem.

I thought there might be a vagur chance the reiser being advanced enough
might be able to handle this.

If not, then I'm kinda stuck with a spotty partition table and I'g going
to have pull the drive and start hauling around disk images and stuff,
which I'd like to avoid.

Here's hoping.

-Jake


p.s. thanks heaps for your responses mate =)
