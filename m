From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: rebuild-trre Fails
Date: Sun, 15 Sep 2002 17:42:32 +0400
Message-ID: <200209151742.32850.vitaly@namesys.com>
References: <004601c25cb9$9ba85280$fe01a8c0@sfhome>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11455-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <004601c25cb9$9ba85280$fe01a8c0@sfhome>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sascha Fleiss <sfleiss@mfsconsulting.de>, reiserfs-list@namesys.com

On Sunday 15 September 2002 17:12, Sascha Fleiss wrote:
> Hi List,
>
> I have a corrupted Reiserfs and trying to fix something using rebuild-tree.
>
> But this fails every time because some blocks can't be read. I think is
> because SCSI-Problems, because it stop's every time on another block.
>
> Is there a way to tell reiserfsck to keep retrying without aborting ?

You should fix your hardware first. Suppose, that while rebuilding 
the reiserfs tree you put a node into some block. Later you cannot 
read that block, so you just lose the whole subtree at that moment.

-- 

Thanks,
Vitaly Fertman

