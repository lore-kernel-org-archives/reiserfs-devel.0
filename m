From: Bruce Israel <israel@tux.org>
Subject: Re: a hosed reiserfs
Date: Fri, 25 Jun 2004 15:13:04 -0400
Message-ID: <20040625151304.B5159@tux.org>
References: <20040625115258.A27445@tux.org> <200406252006.55426.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19400-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200406252006.55426.vitaly@namesys.com>; from vitaly@namesys.com on Fri, Jun 25, 2004 at 08:06:55PM +0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

On Fri, Jun 25, 2004 at 08:06:55PM +0400, Vitaly Fertman wrote:
> Hello, 
> 
> On Friday 25 June 2004 19:52, Bruce Israel wrote:
> 
> It would be better to use a newer version of reiserfsprogs.

OK, when I get home I'll download and install the latest.  3.6.17?

> > bread: Cannot read the block (4161536): (Input/output error).
> 
> what do you see in the syslog? any related message about IO 
> error or about an access beyond end of the device? It could also 
> be the case that the partition end is beyond the harddrive size. 
> check it please.
> 
> -- 

No, that's not the case.  /dev/hdf8 has the problems, but the partition
right after it, hdf9, is also a reiserfs partion, and it doesn't have any
problems.  The partion table for the disk is below.

I'll check out the logs, though I think I had looked in them at the time
and found nothing informative.

Bruce


root@exsolent / # fdisk /dev/hdf

The number of cylinders for this disk is set to 9729.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)

Command (m for help): p

Disk /dev/hdf: 80.0 GB, 80026361856 bytes
255 heads, 63 sectors/track, 9729 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hdf1               1          13      104391   83  Linux
/dev/hdf2              14          75      498015   82  Linux swap
/dev/hdf3              76        9729    77545755    5  Extended
/dev/hdf5              76        1292     9775521   83  Linux
/dev/hdf6            1293        2509     9775521   83  Linux
/dev/hdf7            2510        3726     9775521   83  Linux
/dev/hdf8            3727        6159    19543041   83  Linux
/dev/hdf9            6160        9729    28675993+  83  Linux
