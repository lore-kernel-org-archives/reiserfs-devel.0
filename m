From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: Reiser4 for 2.6.17 Vanilla?
Date: Thu, 22 Jun 2006 17:06:25 +0300
Message-ID: <200606221706.25775.rmeijer@internet.gr>
References: <200606220955.06975.rmeijer@internet.gr> <200606221641.14242.rmeijer@internet.gr> <b5d90b2a0606220700p3443fb7fxdd8108500cb3331@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28836-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b5d90b2a0606220700p3443fb7fxdd8108500cb3331@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu 22 Jun 2006 17:00, Alexey Polyakov wrote:

> There should be one failed chunk (mm/readahead.c), just ignore it.

Really? It wouldn't compile, so I added to line 567 of mm/readahead.c the 
following:

EXPORT_SYMBOL_GPL(handle_ra_miss);

I got this from a Reject file...

Note: I applied both the 2.6.17-ck1 and reiser4-for-2.6.16-4 patches...


Thanks,

Ray
