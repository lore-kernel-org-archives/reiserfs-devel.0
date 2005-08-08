From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 performance
Date: Mon, 08 Aug 2005 14:56:36 -0500
Message-ID: <42F7B8F4.80101@slaphack.com>
References: <dd7cbn$kbg$1@sea.gmane.org> <200508081409.03814.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25352-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200508081409.03814.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Raymond A. Meijer" <rmeijer@internet.gr>
Cc: reiserfs-list@namesys.com

Raymond A. Meijer wrote:
> On Monday 8 August 2005 13:32, Hemiplegic Menehune wrote:
> 
> 
>>Its already as stable as any other fs on my systems and recovers
>>better than most when my battery runs out. Any idea when it will make
>>it into the stable 2.6 kernel?
> 
> 
> If only it had a resizer :(

Resizer isn't such a big deal.  I can usually find enough backup for 
enough of what I want, and I usually get sizes right the first time.

What I want is the repacker, beacuse performance does steadily degrade 
on my Reiser4 systems, eventually getting worse than Reiser3, but not 
worse than VFAT -- probably because my old FAT partitions are on old, 
virus-ridden systems.

I will stick with Reiser4 for now, and hope the repacker comes soon.  I 
don't resize that often, but I'd like to repack every couple weeks or 
so, and it's not worth it to find that much backup (DVDs) that often.

