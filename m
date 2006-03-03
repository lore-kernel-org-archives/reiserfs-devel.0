From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: [PATCH] reiserfs: reiserfs_file_write will lose error code when
 a 0-length write occurs w/ O_SYNC
Date: Thu, 2 Mar 2006 16:19:54 -0800 (PST)
Message-ID: <Pine.LNX.4.64.0603021618400.22647@g5.osdl.org>
References: <20060302210947.GA16696@locomotive.unixthugs.org>
 <20060302153358.4cace15e.akpm@osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28192-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060302153358.4cace15e.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: Jeff Mahoney <jeffm@suse.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com



On Thu, 2 Mar 2006, Andrew Morton wrote:
>
> reiserfs-fix-unaligned-bitmap-usage.patch

I applied this one already, it seemed obvious.

(And then I've applied the ones you forwarded to me, of course).

		Linus
