From: bscott@ntisys.com
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 11:22:22 -0500 (EST)
Sender: bscott@ntisys.com
Message-ID: <Pine.LNX.4.44.0302121117080.20977-100000@dragon.inside.ntisys.com>
References: <46110589437.20030212162613@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12718-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <46110589437.20030212162613@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Mailing List <reiserfs-list@namesys.com>
Cc: Anders Widman <andewid@tnonline.net>

On Wed, 12 Feb 2003, at 4:26pm, andewid@tnonline.net wrote:
> They use single drives, but still they need to be able to rely on the
> filesystem to protect their data and not stop working if the drive has a
> few bad blocks.

  Question: What should the filesystem software do?

  The filesystem stores data in blocks on disk.  It expects to be able read
and write to them to do its job.  When you take that away, you take away a
fundamental.

> Not all users has spare drives, nor can find a replacement right away so
> they have to be able to use their computers even though there are bad
> blocks.

  "Not all users have UPSes (battery backups), nor can they find a UPS right
away, so they have to be able to use their computers even though the power
is out."

> The only way I see that happen is if Linux starts to get more userfriendly
> and safe.

  A bad disk drive isn't a Linux issue.  It's a hardware issue.  Windows
and/or MacOS cannot magically make a bad disk into a good disk, either.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do  |
| not represent the views or policy of any other person or organization. |
| All information is provided without warranty of any kind.              |


