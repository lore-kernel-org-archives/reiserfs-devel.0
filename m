From: Yury Umanets <umka@namesys.com>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: 25 Jul 2003 18:39:45 +0400
Message-ID: <1059143985.19594.3.camel@haron.namesys.com>
References: <3F1EF7DB.2010805@namesys.com>
	 <1059062380.29238.260.camel@sonja>
	 <16160.4704.102110.352311@laputa.namesys.com>
	 <1059093594.29239.314.camel@sonja>
	 <16161.10863.793737.229170@laputa.namesys.com>
	 <1059142851.6962.18.camel@sonja>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15046-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1059142851.6962.18.camel@sonja>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Egger <degger@fhm.edu>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Hans Reiser <reiser@namesys.com>, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@namesys.com>

On Fri, 2003-07-25 at 18:20, Daniel Egger wrote:
> Am Fre, 2003-07-25 um 15.02 schrieb Nikita Danilov:
> 
> > No special measures are taken to level block allocation. Wandered blocks
> > are allocated to improve packing i.e., place blocks of the same file
> > close to each other. Actually, it tries to place tree nodes in the
> > parent-first order.

> 
> So the new blocks are created as close as possible to the old blocks
> instead of say spreading them as far as possible. This is pretty bad for
> usage in the embedded world but I guess this is not the market you're
> aiming at. :(

Reiser4 has plugin-based architecture. So, anybody is able to write new
block allocator plugin.


Speaking about possible embedded usage... What kind of embedded devices
do you mean. Reiser4 driver is big enough in size for some of them (for
instance, for mine MPIO MP3 player :))
-- 
We're flying high, we're watching the world passes by...

