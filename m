From: Robert Brockway <robert@timetraveller.org>
Subject: Re: [PATCH CFT] tons of logging patches
Date: Wed, 5 Jun 2002 10:16:21 +1000 (EST)
Message-ID: <Pine.LNX.4.44.0206051002040.10399-100000@avon.timetraveller.org>
References: <3CFD2F32.7070701@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10510-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CFD2F32.7070701@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list <reiserfs-list@namesys.com>

On Wed, 5 Jun 2002, Hans Reiser wrote:
> You will see substantial performance increases in 2.4.20
> 
> Oleg is doing a complete rewrite of our write function, and is seeing 
> large file performance increases of 25%.

This is very impressive.  Particularly considering I did some performance 
tests on reiserfs vs ext3 vs xfs last night & Reiserfs beat the pants off 
the other two for large file creation.  This was on a 2.4.18 kernel & the 
xfs used was the new version 1.1.

In order to eliminate other variables, I was using the same partition for 
all tests (just remade it over & over), same kernel, same system load, 
etc.

I'm going to develop a script which will go through & do some formal
testing on the different filesystems.  Last night was just a play to see
how it all went.  The proper testing will be done in single user mode.

I also intend to patch for jfs if it will play nicely with the others.  

I'm happy to post my results to the list when I finish if you like.  
Cheers,
	-Rob

-- Robert Brockway B.Sc. email: robert@timetraveller.org  ICQ: 104781119
   Linux counter project ID #16440 (http://counter.li.org)
   "The earth is but one country and mankind its citizens" -Baha'u'llah

