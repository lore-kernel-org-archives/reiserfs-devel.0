From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Unaligned Accesses in reiserfsck
Date: Fri, 21 May 2004 13:38:04 +0400
Message-ID: <200405211338.04152.vitaly@namesys.com>
References: <40AD57A5.8000705@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18797-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40AD57A5.8000705@suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

On Friday 21 May 2004 05:13, Jeff Mahoney wrote:
> Hey all -
>
> I caught a bug report that users were seeing unaligned accesses using
> reiserfsck on ia64. As expected, the cause of these was directly
> accessing the unformatted node block pointers. These were cleaned up in
> the kernel ages ago, so I took the time to fix reiserfsprogs as well.
>
> I also noticed a couple of places where CPU-ordered block numbers were
> being copied into disk-order buffers and fixed those when I saw them. I
> have not done an endian safeness audit on the reiserfsprogs code in
> quite some time.
>
> debugreiserfs/{un,}pack.c may also need a look.
>
> Attached is the patch.

Thanks for the patch Jeff, I will check unaligned accesses & endian 
safeness in progs.

-- 
Thanks,
Vitaly Fertman

