From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: --rebuild-tree, out of disk
Date: Sun, 11 Jan 2004 15:34:07 +0300
Message-ID: <200401111534.07660.vitaly@namesys.com>
References: <40006BFF.2060502@computer-critters.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16442-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40006BFF.2060502@computer-critters.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David D. Huff Jr." <David.Huff@computer-critters.com>, reiserfs-list@namesys.com

On Sunday 11 January 2004 00:17, David D. Huff Jr. wrote:
> I've used cfdisk to change change the size of the partition but
> resize_resierfs fails even when -f is used.
>
> Any suggestions on how to minimize space usage?

Did you want to shrink the partition? Looks like resize_reiserfs failed
because you run it after the fdisk, it should be run before at shrinking.

> I'd rather mark the partition clean, then run resize_reiserfs followed
> by reiserfsck --rebuild-tree but I don't know how.

I do not undestand you, have you run reiserfsck --rebuild-tree?
What were your steps in the chronological order?

-- 
Thanks,
Vitaly Fertman
