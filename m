From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck 3.6.8 + corrupted filesystem
Date: Thu, 3 Jul 2003 15:16:44 +0400
Message-ID: <200307031516.44549.vitaly@namesys.com>
References: <pan.2003.07.02.13.31.41.846811.20132@umail.hungrycats.org> <200307022231.36007.vitaly@namesys.com> <pan.2003.07.02.19.12.09.969889.20132@umail.hungrycats.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14817-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <pan.2003.07.02.19.12.09.969889.20132@umail.hungrycats.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com

On Thursday 03 July 2003 03:12, Zygo Blaxell wrote:
> On Wed, 02 Jul 2003 14:31:36 -0400, Vitaly Fertman wrote:
> > fsck should not abort if in memory data on pass1 (which were built on
> > pass0 of fsck) match what they should be. Otherwise it looks like
> > hardware problem with memory or smth like that.
>
> OK, that clears things up a bit.
>
> Basically something in the output of pass 0 is different from what is
> expected based on in-RAM data in pass 1.  The diagnostic message could be
> (much!) clearer about that, rather than just guessing that I must have "bad
> memory."

Ok, I will try to make it clear and any suggestions are appreciated.

> In a nutshell, either the system RAM is bad, or the disks are mangling
> data without returning errors, or reiserfsck has a bug that causes it to
> expect to find that it has previously written something that it hasn't.

Actually in-memory data only are conserned here, they are not written to disk 
and read again, trey all the time in the memory and just a part of them will be 
written to disk at the end of fscking.

> I'll exercise RAM and disks over the next N days to try to eliminate
> hardware as a possible cause.

-- 
Thanks,
Vitaly Fertman
