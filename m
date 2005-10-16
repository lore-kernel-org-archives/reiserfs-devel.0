From: evilninja <evilninja@gmx.net>
Subject: Re: Reiserfsck can't fix FS
Date: Mon, 17 Oct 2005 01:37:29 +0200
Message-ID: <4352E439.8030402@gmx.net>
References: <1129303303.3370.4.camel@desktop>	 <200510142008.42253.vitaly@namesys.com> <1129484435.16949.1.camel@desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26544-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1129484435.16949.1.camel@desktop>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Thomas Raschbacher <lordvan@lordvan.com>

Thomas Raschbacher schrieb:
> 
> as you see it produced no errors at all so the HDD can be read fine. any
> idea what could cause the problem?

looking once more on your logfiles:

 > Pass 1 (will try to insert 16439 leaves):
 > Looking for allocable blocks .. finished
 > 0%....20%....40%....60%....80%.                             left 1982,
 > 176 /sec
 > The problem has occurred looks like a hardware problem (perhaps
 > memory). Send us the bug report only if the second run dies at
 > the same place with the same block number.
 >
 > build_the_tree: Nothing but leaves are expected. Block 10059767 -
 > unknown

the block number is indeed the same on every (?) reiserfsck-run. so maybe 
you can put your disk into another machine and/or free your usb-disk from 
usb and use it via (S)ATA? (if possible, to rule out hw-problems).

and:

 > I had to run reiserfsck on my usb hdd because there were some problems.

your reiserfs seems to be heavily damaged. can you tell us more about 
these "problems"?

thanks,
Christian.
-- 
BOFH excuse #76:

Unoptimized hard drive
