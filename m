From: Hans Reiser <reiser@namesys.com>
Subject: Re: Stacked Reiser4 filesystems
Date: Fri, 23 Apr 2004 17:00:00 -0700
Message-ID: <4089AE00.5090406@namesys.com>
References: <40898898.3000907@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18187-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40898898.3000907@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>, Vitaly Fertman <vitaly@namesys.com>

Carl-Daniel Hailfinger wrote:

>Hi,
>
>one of the really bad (read: unecpected) deficiencies of reiserfs is the
>fact that storing the image of another reiserfs filesystem as a file on a
>reiserfs filesystem will confuse reiserfsck --rebuild-tree to no end.
>
>IIRC somebody said this cannot happen with reiser4 anymore. Is this true?
>  
>
Yes, we specifically set out to fix this.

>And what happens if I store an (incomplete) image of a certain reiser4
>partition as a file on the very same partition? Will the metadata from the
>file confuse fsck.reiser4 in rebuild-tree mode?
>  
>
Vitaly will answer this in detail....

>Since reiser4 is now heading for inclusion in mainline, I would like to
>know whether the above flaws in reiserfs are fixed in reiser4.
>
>Regards,
>Carl-Daniel
>  
>

