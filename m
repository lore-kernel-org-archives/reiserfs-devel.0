From: "Matthias Urlichs" <smurf@noris.de>
Subject: Re: "reiserfsck --rebuild-tree" fails
Date: Wed, 25 Sep 2002 13:36:19 +0200
Message-ID: <20020925133619.Q32363@noris.de>
References: <Pine.LNX.4.33L2.0209251208570.1154-100000@mailbackup.pi.dk> <1032953396.27530.21.camel@riggs>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11527-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1032953396.27530.21.camel@riggs>; from dirk.meul@epost.de on Wed, Sep 25, 2002 at 01:29:19PM +0200
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Meul <dirk.meul@epost.de>
Cc: reiserfs-list@namesys.com

Hi,

Dirk Meul:
> Thank you for your answer. Will "reiserfsck --rebuid-tree" succeed after
> badblock running? I think 85%-90% of the data will be ok and this
> badblocks contain a file which should be deleted.
> 
Very likely. I had a big RAID5 the other day where one disk too many died
and I had to reconstruct from two current disks and one that was a month
out of date.

I now have 35000 files (mostly junk, year-old deleted files and all that)
in my /lost+found file system, but that's a minor problem. The major Good
Thing which happened is that every file which hasn't been touched during
the last month is perfectly OK.

One of these days I'll check whether ext2fs would survive that kind of
abuse, but I seriously doubt it...

-- 
Matthias Urlichs     |     noris network AG     |     http://smurf.noris.de/
