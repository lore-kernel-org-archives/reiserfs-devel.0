From: Oleg Drokin <green@namesys.com>
Subject: Re: vs-5150: search_by_key: invalid format found in block 30690. Fsck?
Date: Mon, 18 Aug 2003 10:08:52 +0400
Message-ID: <20030818060852.GB16183@namesys.com>
References: <200308151939.03324.vadim_t@teleline.es>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15354-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200308151939.03324.vadim_t@teleline.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vadim <vadim_t@teleline.es>
Cc: reiserfs mailing list <reiserfs-list@namesys.com>

Hello!

On Fri, Aug 15, 2003 at 07:39:02PM +0200, Vadim wrote:
> I just noticed quite a lot of those:
> vs-5150: search_by_key: invalid format found in block 9170. Fsck?
> vs-13070: reiserfs_read_inode2: i/o failure occurred trying to 
> find stat data of [3614 3618 0x0 SD]
> is_tree_node: node level 65448 does not match to the expected one 
> 1
> vs-5150: search_by_key: invalid format found in block 14568. 
> Fsck?

Some of the blocks are got filled with garbage for some (unknown) reason.

> The disk seems to be good, no errors, kernel is 2.4.21 with LVM 
> 1.0.7.
> Why does this error happen? Is it a bug fixed in a later version?

Well, I am not sure there is a bug.
What was happenning before you started to get those messsages? Were there any
unexpected shutdowns and you do not have write cache disabled in your harddrives
or something like that?

> BTW, it'd be nice if it told me what partition it happened on.

We merged a patch that does just this in 2.4.22-pre3

Bye,
    Oleg
