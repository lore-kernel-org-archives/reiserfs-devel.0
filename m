From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: How long will a shrinkfs take?
Date: Fri, 11 Jun 2004 00:54:19 +0400
Message-ID: <20040610205419.GQ8091@backtop.namesys.com>
References: <40C8C0EF.7060704@dgreaves.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19138-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40C8C0EF.7060704@dgreaves.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Greaves <david@dgreaves.com>
Cc: reiserfs-list@namesys.com

On Thu, Jun 10, 2004 at 09:13:35PM +0100, David Greaves wrote:
> Hi
> 
> I have a 1Tb reiserfs that I want to shrink to 500Gb
> 400Gb of data is used.
> 
> Any estimates as to how long this will take?
> Sustained I/O is about 33Mb/s at the fs level, 44 Mb/s at the lv level 
> and 65Mb/s at the md0 level.

ReiserFs shrinker reads all tree nodes as fsck does (reiserfsck --check may be
used for rough estimation) plus shrinker writes relocated nodes (this highly
depends on how many nodes are above 500GB boundary).

Anyway running reiserfsck --check before shrinking is a good practice.

> 
> (I didn't expect the fs to be so slow so I'm going to try a few tuning 
> params on the new 500Gb space before copying over the data and growing 
> back to a Tb)
> 
> Is it proportional to the amount of shrinkage (ie 2 hrs to reduce by 
> 50G, 20 hrs to reduce by 500Gb)

> David

-- 
Alex.
