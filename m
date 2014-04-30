From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard support
Date: Wed, 30 Apr 2014 16:11:35 +0200
Message-ID: <53610497.4060101@gmail.com>
References: <1496741.djsd6PJ1Ae@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=a16KTObnpX73BAuLfQK3/zvsOQwziIR/j2LYctrtNHY=;
        b=YLQoEMUgvYWNZMJWdR8JyTXdrd0fB7vMoK0LUozJYq0nG68VnaAKe5Fo68jI2RNEZ3
         zHxSpbu56jh9ggIQh/iCwvwGJx9ure2KCfe/r9CqJKnTuF2SZa9p/my/akZ7fSL3u4ow
         i/RrMq1RL++IGLMP5mMrm4P5bed8HUGjmt1yq5FDPRmilBXRr4Ui1+zU9K+NeD1brEpN
         CPk158TTQB5iIN4ZcPWGaUledEStN7s8EoLh/zFBT5CU/d+rRBTuaxMpfKBZL8KMMc7e
         qxbyxsHDoTSP+D3pCGZB448Tuear4N3TeEdCoAhT/ij7Ct0ovqAEPmZQRtoOpzHmuvY4
         YhYw==
In-Reply-To: <1496741.djsd6PJ1Ae@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 04/30/2014 09:43 AM, Ivan Shapovalov wrote:
> Hi Edward,

Hello Ivan.

>
> So I bit the bullet, ditched all tasks for the upcoming holidays and gave
> another try to the discard support in reiser4. Since my last status update,
> I've lost the local kernel tree due to bad scripting (decided to TRIM free
> space between partitions... and TRIM'ed everything that is NOT free space), so
> I had to start from scratch.

Once in a while I send key patches to my gmail mailbox configured with 
IMAP..

>
> I decided to go with following algorithm:
>
> During the transaction deallocated ranges are logged as-is to a list or array
> (let's call it "the delete log").

"Log" is a busy term. It is already used for journal blocks.
Let's use "discard set" instead?

> On atom commit we will generate a minimal
> superset of the delete log, comprised only of whole erase units ("the discard
> set").
> So, at commit time the following actions take place:
> - elements of the delete log are sorted;
> - the delete log is iterated, merging any adjacent ranges;
> - for each resulting range in the delete log its start is rounded down to the
>    closest erase unit boundary, and, starting from this block, extents of erase
>    unit length are created until whole range is covered;
> - for each such new extent it is checked whether does it contain allocated
>    blocks. If no (i. e. the range is completely deallocated), the range is
>    added to the discard set.
>
> Complexity of logging is thus O(n), added complexity of atom joining is O(1)
> and added complexity of atom commit is O(n*log(n) + n).
>
> The first question is how to store the delete log.
> - blocknr_set isn't ordered per se, so adjacent entries can't be easily merged
> - simple linked list (extent per node) seems like too big overhead
> - kmalloc()'ed arrays can't be joined in O(1) and they are static (imposes a
> hard limit on log size)
> - kmem_cache... feels like using a sledge-hammer.

Why not to maintain discard set as extents in a special per-atom tree?
When adding an extent, try to merge it with the neighbors (if any), so
that everything is prepared for discard at any moment. Just walk through
the tree from left to right and discard all suitable extents?

There is a ready implementation of rb-trees in the kernel (see 
./lib/rbtree.c,
./lib/rbtree_test.c). Could you please take a look at this?

>
> And oh, where in commit_current_atom() should these things be done? I guess
> right after the reiser4_write_logs(), under the tmgr mutex,

You are right.
Insert the function issue_discard_requests() right after the
reiser4_invalidate_list(ATOM_OVRWR_LIST(*atom)); and before
mutex_unlock(&sbinfo->tmgr.commit_mutex);

>   but I can't really
> explain why I think so.

reiser4_write_logs() commits the atom's overwrite set, which includes
all system blocks, including bitmap blocks.
If you issue discard requests before reiser4_write_logs(), then it
can happen that the system crashes after issue_discard_requests(),
but before reiser4_write_logs(). So, we'll have that the blocks have
been discarded, while the file system still refers to them (as bitmap
eventually hasn't been updated). Welcome to data corruption..

Thanks,
Edward.
P.S.: You'll need to set up a debugging environment. Take a look at this:
http://bipinkunal.blogspot.cz/2012/05/kgdb-tutorial.html
Do you have a second machine with a serial port?
