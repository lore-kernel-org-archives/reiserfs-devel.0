From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Kernel Panic with reiserfs during a rm command; complains about j_len too long during journal_mark_dirty
Date: Tue, 11 Apr 2006 09:44:39 +0400
Message-ID: <200604110944.39591.zam@namesys.com>
References: <4430B34C.9040509@ieee.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28469-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4430B34C.9040509@ieee.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Kelvie Wong <kelvie@ieee.org>

Hi,

On Monday 03 April 2006 09:31, Kelvie Wong wrote:
> Attached is the relevant dmesg output; I have ran rebuild-tree, and
> when I try to rm certain files, I get the same error (a segfault),
> then it hangs.
>
> Tell me if you need more information; I'd really like to know if this
> is a kernel/reiserfs problem, or rather if I need a new hard drive.

It is a reiserfs bug, please use 2.6.17-rc1 which has a fix for it,

or apply
ftp.kernel.org:/pub/linux/kernel/people/akpm/patches/2.6/2.6.16/2.6.16-mm1/broken-out/reiserfs-fix-transaction-overflowing.patch

-- 
Alex.
