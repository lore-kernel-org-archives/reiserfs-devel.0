From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: 2.6.0-test6 crash while reading files in /proc/fs/reiserfs/sda1
Date: Wed, 1 Oct 2003 21:15:16 +0400
Message-ID: <200310012115.16760.vitaly@namesys.com>
References: <1064936688.4222.14.camel@localhost.localdomain> <200309302006.32584.vitaly@namesys.com> <1065019441.4226.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15758-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1065019441.4226.1.camel@localhost.localdomain>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zan Lynx <zlynx@acm.org>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

> The kernel is 2.6.0-test6 from kernel.org.  No other patches.
>
> Okay, I did cat file > /dev/null on each one.  It looks like the problem
> is with oidmap.  The other files do not crash.

we found a bug in the kernel 2.6.0-test6 and working on the fix.

-- 
Thanks,
Vitaly Fertman
