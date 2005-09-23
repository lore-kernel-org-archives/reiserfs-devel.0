From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: Reiser4 hang -- bad sectors on disk
Date: Fri, 23 Sep 2005 09:42:03 +0300
Message-ID: <200509230942.03727.rmeijer@internet.gr>
References: <200509221245.39730.rmeijer@internet.gr> <861194762.20050922121940@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26253-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <861194762.20050922121940@wp.pl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 22 September 2005 13:19, Pysiak Satriani wrote:

> I might be wrong here, but bad blocks are a condition that the kernel
> should handle without barfing oops traces, so there indeed may be
> not enough sanity checks somewhere.

Perhaps...

I can do some more testing, but there are more and more bad sectors...
For now I'll disable DMA and maybe I can salvage my files.


Thanks,

Ray
