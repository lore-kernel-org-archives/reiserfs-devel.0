From: Robert Brockway <robert@timetraveller.org>
Subject: Re: Re[2]: Problem with my HDD
Date: Thu, 30 May 2002 23:59:44 +1000 (EST)
Message-ID: <Pine.LNX.4.44.0205302353340.23828-100000@avon.timetraveller.org>
References: <1022765941.22608.1555.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10456-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1022765941.22608.1555.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On 30 May 2002, Chris Mason wrote:

> > I made an image of the disk. It's 3GB. Can I do anything with this
> > thing now? i.e.: formatting the HDD and putting the image back on it.
> > Then there would be no unreadable blocks anymore.
> 
> I would keep the original disk in its current state until you get all
> the data back you can.  If you think you've got a good copy, take the
> original out of the machine and put it somewhere safe.
> 
> I'd start by running the copy through the latest version of reiserfsck.

This is addresses mainly to the original poster:  One of the great things 
about this approach is that you can mount the image loopback & test your 
progress at recovering data, while not risking further damage to the 
original data source.

Good luck with the recovery & keep us posted.

Btw, at this point I'd like to thank all the reiserfs developers.  It is a 
great filesystem, and I personally believe will end up being the defacto 
standard for Linux within a few years despite all of the competing 
journalling filesystems out there at the moment.  Diversity is great of 
course - keeps everyone on their toes, and there will be room for all of 
the filesystems in the Linux distros of the future.  I was a bit sad when 
xiafs was dropped from the kernel, but I didn't worry too much about the 
passing of extfs :)

Cheers,
	-Rob

-- Robert Brockway B.Sc. email: robert@timetraveller.org  ICQ: 104781119
   Linux counter project ID #16440 (http://counter.li.org)
   blake: up 1 day,  3:50,  4 users,  load average: 0.49, 0.47, 0.61
   "The earth is but one country and mankind its citizens" -Baha'u'llah

