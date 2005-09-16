From: Christoph Hellwig <hch@infradead.org>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Fri, 16 Sep 2005 18:15:09 +0100
Message-ID: <20050916171509.GA32545@infradead.org>
References: <432AFB44.9060707@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25998-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <432AFB44.9060707@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, Sep 16, 2005 at 10:05:08AM -0700, Hans Reiser wrote:
> All objections have now been addressed so far as I can discern.
> 
>     The VFS layering issue was addressed after 2 months of recoding.
> 
>     The undesired type safe lists were removed after ~ a man week of coding.
> 
>     Cosmetic issues regarding line length, etc., were addressed.
> 
>     Numerous ~ one line changes were made that I will not address here.
> 
>     The assertions were left in, with akpm's ok.
> 
>     Pseudo files were removed.
> 
>     dependency on !4k stacks was removed and stack usage was fixed.
> 
>     reiser4_drop_inode was removed.
> 
>     our div64_32 was replaced with the linux one

You completely ignore my last review comments.    And that was just the
errors sticking out from an half an error look.  I'll do a deeper review,
but ocfs has a higher priority right now.

