From: Hans Reiser <reiser@namesys.com>
Subject: Re: Atomicity with reiser4?
Date: Thu, 03 Feb 2005 12:02:55 -0800
Message-ID: <4202836F.1050800@namesys.com>
References: <CMEFJOIJPCAMFCEKIEOEOEBLCGAA.smallwood@maya.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <CMEFJOIJPCAMFCEKIEOEOEBLCGAA.smallwood@maya.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nicolas Smallwood <smallwood@maya.com>
Cc: reiser <reiserfs-list@namesys.com>, Vladimir Saveliev <vs@namesys.com>

Nicolas Smallwood wrote:

>Its an internally built B Tree database that uses 4k blocksizes.
>Inside, we were loading "u-forms", a concept we use that involves
>having a UUID, and an e-form composed off attribute names and their values.
>Most of these are no more than say 17k.
>
>To ensure that writes do occur, we open transactions for every access to the
>b tree,
>and closing a transaction will call fsync.
>
>My test involved 20,000 u-forms, which would of course call fsync 20,000
>times.
>
>Using another of the filesystems, each is under or around two minutes with
>fsync.
>
>Based upon what you where telling me, is the size of an atom configurable?
>Or what is considered too large?
>
>Thanks,
>
>Nicolas Smallwood
>
>
>
>
>  
>
You might consider creating u-form item plugins and doing it within 
reiser4.....  performance should be drastically improved by that.....
