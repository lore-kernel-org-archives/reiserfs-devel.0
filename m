From: bscott@ntisys.com
Subject: Re: Promise raid controller writes to disk, anybody know where?
Date: Wed, 16 Apr 2003 14:04:09 -0400 (EDT)
Sender: bscott@ntisys.com
Message-ID: <Pine.LNX.4.44.0304161354460.25258-100000@dragon.inside.ntisys.com>
References: <3E9D8ABC.8050601@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13687-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E9D8ABC.8050601@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Mailing List <Reiserfs-List@namesys.com>

On Wed, 16 Apr 2003, at 8:54pm, reiser@namesys.com wrote:
> It is for my Mom, I want both windows and Linux, and I was hoping the
> whole drive would get mirrored by the hardware.

  Not by hardware, no.  But you could configure a mirror in the Promise 
BIOS, and it would give you an effective mirror of two drives, regardless of 
OS or partitioning.  You would need to have drivers for all your OSes, of 
course.  This isn't "hardware RAID", but it still might be useful.

  That being said, I've also had bad luck with many of these cheap "fake 
RAID controllers" doing things like corrupting the contents of the drive.  
While I'm not saying your particular model of Promise controller will have 
that problem, I've been burned often enough that I won't touch them.

  If you really want a hardware RAID controller for ATA drives, go with a
3Ware Escalade, or an LSI Logic MegaRAID I4.  Both have fully supported, GPL
drivers in the kernel.  I've also heard that the high-end Promise
controllers (the ones that have an actual co-processor onboard) are decent,
although I have no experience with them myself.

> It is okay though, I will have mom use dd once a week to do it, and this
> will protect from viruses better than a synchronous mirror.

  rsync might be better than a simple 'dd'.  Although I don't know if rsync
would get messed up by the semantics of an MS-DOS filesystem.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do  |
| not represent the views or policy of any other person or organization. |
| All information is provided without warranty of any kind.              |

