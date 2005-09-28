From: David Masover <ninja@slaphack.com>
Subject: Re: Full of surprises - A reiser4 story from userland
Date: Wed, 28 Sep 2005 10:57:47 -0500
Message-ID: <433ABD7B.1010903@slaphack.com>
References: <1127914812.12894.96.camel@laptop>	 <200509281825.49873.vitaly@namesys.com> <1127921286.12894.106.camel@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26309-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1127921286.12894.106.camel@laptop>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fionn Behrens <fionn@spamfilter.de>
Cc: reiserfs-list@namesys.com

Fionn Behrens wrote:
> On Mi, 2005-09-28 at 18:25 +0400, Vitaly Fertman wrote:
> 
> 
>>>2.6.11 refused to boot the
>>>root partition, claiming that there were an inconsistency in the FS.
>>
>>the disk format got new parameters and old kernels cannot understand it right.
> 
> 
> Ah, I see. So maybe it would be a good idea if the new fs version would
> put up a big fat warning to syslog when it detects a partition written
> by a previous version, telling the user that he is about to break
> compatibility to his older version (and that the must upgrade userland
> tools, too!)

Yes, it would be nice, and I wish it'd been done that way.  I'm hoping
it will be once it's in the kernel.  I liked how I didn't have to do
anything for the upgrade to happen, but I'd probably like it more if
this was something you had to do with a userland tool or a specific
kernel boot/mount option.

> 1.0.4 . As I am now back on 2.6.11, I guess I should not upgrade to
> 1.0.5 or would that not do harm anyway?

Not sure.  I got 2.6.13 to work without much trouble, but I wasn't using
the full MM patch, just the reiser4-specific parts.

