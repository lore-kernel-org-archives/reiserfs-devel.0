From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: snapshot 2004.03.26 + linux 2.6.5 = build error
Date: Mon, 5 Apr 2004 15:40:58 +0300
Message-ID: <200404051540.58430.rmeijer@internet.gr>
References: <20040404161030.GA21978@raptus.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17714-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040404161030.GA21978@raptus.homelinux.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sunday 04 April 2004 19:10, Domenico Andreoli wrote:

> today i applied latest snapshot to linux kernel 2.6.5 and tried to
> build it.
>
> patch didn't apply cleanly, there were some hunks and a reject on
> arch/sparc/kernel/init_task.c which looked trivial to fix.
>
> problem arrived on reiser4 kernel module (i'm using as module with no
> problems), build error follows:
>
>
>   CC [M]  fs/reiser4/as_ops.o
> fs/reiser4/as_ops.c: In function `move_inode_out_from_sync_inodes_loop':
> fs/reiser4/as_ops.c:570: error: structure has no member named
> `dirtied_when' make[4]: *** [fs/reiser4/as_ops.o] Error 1

Exactly the same error here, compiling it into the kernel.

Any suggestions? On 2.6.4 it patched & compiled pretty much cleanly and worked 
like a charm...


Thanks,

Ray
