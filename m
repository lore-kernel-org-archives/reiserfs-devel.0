From: Simon Raffeiner <sturmflut@lieberbiber.de>
Subject: Re: Severe problem with fsck.reiser4 1.0.3
Date: Sat, 15 Jan 2005 00:15:03 +0100
Message-ID: <1105744503.41e85277c61f6@www.hosting-agency.de>
References: <1105475609.41e4381953cbe@www.hosting-agency.de> <200501141726.53425.vitaly@namesys.com> <1105737328.41e836703c607@www.hosting-agency.de> <200501150108.25073.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-23148-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200501150108.25073.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Zitat von Vitaly Fertman <vitaly@namesys.com>:


> > ATM fsck.reiser4 is still running --build-fs and does the storage tree
> > cleanup, lots of nodes got zeroed, does this mean data has been lost? I
>
> if I recall correctly the fsck log, some data blocks were pointed more then
> once from different places. in such a case only 1 of these pointers is left,
> other are zeroed. but fsck does not know exactly which is the correct one.
> so it could lead to file data corruptions. although chances that buggy
> pointers were zeroes are pretty high.

In fact the data loss is 100%, the only thing left after fsck.reiser4 --build-fs
is the "lost+found" folder. I'll take this as a chance to reinstall my Gentoo
from scratch and create separate partitions for / and /home this time with /
being ReiserFS as long as Reiser4 doesn't _really_ get stable. This strange
behaviour has somewhat changed my confidence in Reiser4.

> > have got recent backups so it's no problem, but do you have some idea where
> > this corruption came from? Doesn't look like hard drive failure, maybe an
>
> the most strange corruption was that 2 leaves in the tree had pointers
> to themselves. this happens extremely rare, I even do not remember
> if I have seen a such before.
>
> > unclean shutdown or some issues with Kernel 2.6.10-mm1.
>
> shutdown should not be a problem, if it is this is a problem with reiser4
> journalling which is quite stable now. but 2.6.10-mm1 is not the most stable
> thing in the world. I am afraid only some tests will reveal the truth to you.

I'll stay with 2.6.9-mm1 which has run stable for over a month with Reiser4,
there's no real reason for me to switch  to a newer kernel except for some
security updates.

Regards,

Simon Raffeiner
