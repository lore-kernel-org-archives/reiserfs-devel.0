From: Mariusz Mazur <mmazur@kernel.pl>
Subject: Invalid use of asm/unaligned.h
Date: Wed, 11 Aug 2004 21:48:42 +0200
Message-ID: <200408112148.42125.mmazur@kernel.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20211-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I'm the linux-libc-headers* maintainer and after the release of version 
reiserfsprogs 3.6.18 I was informed that they don't build correctly against 
llh. A couple of months ago a patch was added to reiserfsprogs that fixed 
access to unaligned memory on ia64. Fact of the matter is that 
asm/unaligned.h is *not* a userland header (and as such was removed from llh) 
and you can call good luck the fact that it's userland friendly on ia64. On 
most archs that it's needed on (those that do not support unaligned memory 
access) the header will either not work cause it requires some kernel 
internal stuff, or will not work cause it's plain marked as kernel only 
(ifdefed __KERNEL__ as on arch-ppc).

Now the nice thing to do would be to switch to some more userland friendly way 
of accessing unaligned memory, since using kernel headers for such things is 
not a good idea. I don't have too much options for making those headers 
userland friendly and adding them to llh, since I can't call any external 
functions (like memcpy) from llh and I don't believe adding lots of asm code 
by coding my own functions for that is a good idea (neither have I the 
expertise nor the resources to do it correctly).
So - what will it be? :)

Oh, and please do cc me with any replies since I'm not subscribed to this 
list.

* http://ep09.pld-linux.org/~mmazur/linux-libc-headers


-- 
In the year eighty five ten
God is gonna shake his mighty head
He'll either say,
"I'm pleased where man has been"
Or tear it down, and start again
