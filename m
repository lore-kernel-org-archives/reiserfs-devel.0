From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS problems
Date: Wed, 06 Aug 2003 20:43:38 +0400
Message-ID: <3F31303A.6020408@namesys.com>
References: <20030806182055.A28562@bitwizard.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15177-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030806182055.A28562@bitwizard.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Cc: reiserfs-list@namesys.com, copy@harddisk-recovery.nl, Jeff Mahoney <jeffm@suse.com>

Vitaly, when --rebuild-tree is used, warn the user "rebuilding tree, 
once this is started it must be finished or the filesystem will be 
unusable.  If you kill it or the machine crashes before it finishes, run 
it again.".

Also explain this in the doc for --rebuiild-tree.

Hans

>
>
>Question: If it is reading all datablocks, I'm guessing that it is
>looking for the magics that build up the filesystem.
>
not sure what a magic is.  Perhaps you mean formatted nodes.

> We're a
>datarecovery company. We probably don't have any current
>datarecoveries of people with Reiserfs on their disk. But if we had a
>disk-image with a valid (or not) Reiserfs on it, would it link that
>into our filesytem? to 
>
If you store a copy of reiserfs on reiserfs, it totally screws fsck for 
V3.  V4 has some features added to the node format specifically to avoid 
that.

>
>We've noticed horrible slowdowns when the filesystem is > 90% full. It
>turns out that when a block group is more than 90% full reiserfs will
>prefer a different block group. i.e. it is ALWAYS switching block
>groups when the whole disk is > 90% full. Something like that. When we
>report something like that it's always: Ah, yes, that's an old bug
>we've fixed it. Use patch.....
>
I don't think you reported that to me.....

Jeff, give me an opinion on this....

For V4 we have a repacker.

-- 
Hans


