From: Andi Kleen <ak@muc.de>
Subject: Re: reiser4 data journalling?
Date: Sat, 30 Aug 2003 20:22:18 +0200
Message-ID: <m3oey7m2ed.fsf@averell.firstfloor.org>
References: <3F4E3AF9.2060100@tupshin.com>
	<16206.16138.72832.920045@laputa.namesys.com>
	<3F4E6AA4.3030900@namesys.com> <20030829001814.GB9019@zero>
	<3F4E9C6D.2080009@namesys.com> <20030829012322.GJ21352@matchmail.com>
	<20030829050857.GA5755@namesys.com> <3F4F91DB.2080900@namesys.com>
	<16207.38985.871686.419166@laputa.namesys.com>
	<3F4FC8FD.1050303@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15501-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F4FC8FD.1050303@namesys.com> (Hans Reiser's message of "Sat,
 30 Aug 2003 01:43:25 +0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hans Reiser <reiser@namesys.com> writes:
>>
> Because atomicity in ext3 basically consists of guaranteeing that the filesystem is consistent, and due to the disk drive implementation 4k blocks are written atomically.  So, if you span more than one block, it is not guaranteed to be atomic.

I was told most modern disks run with 32-64K blocks internally.

4K is very unlikely.

Of course they don't always guarantee that a write of such a block
is atomic, but then they also don't guarantee it for 4K.

The only sure way is to wait for the disk telling you it is finished 
(= use write barriers)  and/or turn the write buffer off.
Even then you have to hope that the disk firmware doesn't lie to you.

-Andi
