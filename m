From: bscott@ntisys.com
Subject: Re: NFS setup for a reiserfs-based /home
Date: Wed, 25 Sep 2002 11:48:49 -0400 (EDT)
Sender: bscott@ntisys.com
Message-ID: <Pine.LNX.4.44.0209251137370.3685-100000@dragon.inside.ntisys.com>
References: <20020925175128.A3477@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11537-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020925175128.A3477@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list <reiserfs-list@namesys.com>

On Wed, 25 Sep 2002, at 5:37pm, green@namesys.com wrote:
> RAID5 is CPU hungry on writes, also writes are slower compared to RAID1.

  With RAID controllers that include dedicated hardware for the XOR
computations available for less than $300 US, the performance difference
usually does not matter.  About the only time performance matters is for
things like transaction journals on large databases, which are pretty much
write-only and very often a bottleneck.

On Wed, 25 Sep 2002, at 5:51pm, green@namesys.com wrote:
> On the third hand, in RAID1 setup with N disks I won't mind failure of N-1
> disks. ;)

  You can have hot spares or N+2 redundancy for other RAID levels as well.

>> Anyway, reasonably fast hardware RAID controllers do exist, so this
>> isn't necessarily a problem.
> 
> This is just matter of truest, if you trust the binary closed source
> firmware from such a device, that it will handle failures and this kind of
> stuff correctly, go for it.

  On the other hand, software RAID is pretty weak in comparison to hardware
RAID.  You spend host resources (CPU, memory, bus bandwidth) doing RAID
stuff that is better done on a separate controller.  Some kinds of device
failures tend to bring down the entire system.  And you have to worry about
boot-time, before the kernel RAID is active.

  With a good hardware RAID controller, the OS just sees a big disk.  INT13
support is available, so GRUB and LILO don't care, either.  You free up CPU,
RAM, and bus bandwidth.  You can isolate device and bus failures from the
host.  You can have dedicated, battery-backed, write-back cache RAM on the
controller, which greatly improves performance.

  If you can afford it, hardware is *definitely* the way to go.

  Of course, a lot of Linux users are also looking to do things on the
cheap.  You cannot beat software RAID and a bunch of IDE disks for cheap
storage.  :-)

> With Linux' softraid paranoid people can verify their own worst
> assumptions by just reading source code ;)

  Verify, yes.  Fix?  Well, I looked at the 2.2 SCSI layer once.  I still
have nightmares about it.  :-)

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |

