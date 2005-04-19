From: Danny Sauer <reiserfs@danny.teleologic.net>
Subject: Re: problem with reiser3/2.4 on 3Ware RAID10
Date: Tue, 19 Apr 2005 08:16:47 -0500
Message-ID: <200504190816.47480.reiserfs@danny.teleologic.net>
References: <20050405155413.GB22228@teleologic.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23898-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050405155413.GB22228@teleologic.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 05 April 2005 10:54 am, Danny Sauer wrote:
> I'm having a hard time finding a solution to this, and therefore I'm
> hoping someone this this list might have an idea of what's going on.

I'm having a similar problem with xfs on the same partition under the same 
kernel (but xfs doesn't hang and block the drive :)).  Maybe it's a 
hardware/driver problem.  I can't reproduce the problem with ext2/3, 
though, and I don't want to use either of those filesystems to hold 50 
people's IMAP-based Maildirs.  That's a lot of files, and extfs just won't 
cut it.

I don't suppose anyone has any idea what might be set up wrong on the 3Ware 
controller?  I just built the in-kernel (2.4.29) driver and plugged stuff 
in, though I used a non-typical (256K, which is larger than the 64K 
default) stripe size.  Maybe I should try rebuilding the RAID-10 with the 
default stripe size?

--Danny
