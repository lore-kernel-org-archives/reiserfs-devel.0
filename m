From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Wed, 3 Mar 2004 11:49:48 +0100
Message-ID: <200403031149.48474.christian.mayrhuber@gmx.net>
References: <4044119D.6050502@andrew.cmu.edu> <200403031059.26483.robin.rosenberg.lists@dewire.com> <1078309141.863.3.camel@teapot.felipe-alfaro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17041-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1078309141.863.3.camel@teapot.felipe-alfaro.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wednesday 03 March 2004 11:19, Felipe Alfaro Solana wrote:

> It's not a matter of working: it's a matter of recovering. A bad disk
> block could potentially destroy a file or a directory, but shouldn't
> make a filesystem not mountable nor recoverable.
>

Something similar happened to a server of mine 2 years ago.
I never ever touched xfs since.

On the other hand I had a defective raid controller which did not
detect 2 failed disks on raid5 and reiserfs + data logging on it.
Reiserfsck was able to recover around 50% of the data, but lost
the filesystem meta information. Still enough to recover some
critical files not on a backup.

I had Ext3 eat a /var filesystem once after it ran out of space.
This happened with kernel 2.4.20.

I'll stick with reiserfs + data logging for sure.

- 
lg, Chris

