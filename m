From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: [PATCH/URL] reiserfs: reformat code with Lindent
Date: Tue, 12 Jul 2005 15:49:10 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0507121546160.17536@g5.osdl.org>
References: <20050712194220.GA28973@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25109-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050712194220.GA28973@locomotive.unixthugs.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>



On Tue, 12 Jul 2005, Jeff Mahoney wrote:
> 
>  This patch contains the result of running scripts/Lindent against
>  fs/reiserfs/*.c and include/linux/reiserfs_*.h.

That can't be true. It isn't actually following the Lindent rules. It has 
that braindamaged "put the type on a separate line" thing for function 
declarations, making a "grep" not show the type. That's very much against 
the Linux coding style.

So either your "indent" is broken, or you've used something else than 
Lindent.

Also, if it's a pure indentation change with no other changes, I'd almost 
prefer it as a script, not a patch.  That way it's obvious to everybody 
that it's just doing indentation.

		Linus
