From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: ReiserFS is not suitable for a root FS.
Date: Sat, 17 May 2003 14:01:00 +0200
Message-ID: <3EC6247C.4030605@gmx.net>
References: <200305172030.58775.russell@coker.com.au> <3EC61987.5000402@gmx.net> <200305172125.59713.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14142-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305172125.59713.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: ReiserFS <reiserfs-list@namesys.com>

Russell Coker wrote:
> On Sat, 17 May 2003 21:14, Carl-Daniel Hailfinger wrote:
> 
>>Russell Coker wrote:
>>
>>>With a ReiserFS file system you can't FSCK a file system that is mounted
>>>read-only.  This means that when a root file system needs to be FSCK'd
>>>you need to boot from installation media (or convert the swap space into
>>>a temporary root file system).
>>
>>I take this as a feature request. Right? It would certainly be nice to
>>have.
> 
> Yes.

Oleg? Given a statically linked reiserfsck binary completely loaded into
memory and an initrd below the reiserfs root filesystem, it should be
possible to completely unmount the root fs because the initrd is still
there and can serve as root fs.
In this situation, reiserfsck sould have no problems anymore because the
partition is not mounted at all.

>>>It seems that the kernel drivers in 2.4.20 have some bugs whereby a
>>>corrupted file system can cause an immediate reboot, a system lock
>>>(caps-lock doesn't change the keyboard led), or a kernel Oops.  Ext2/3
>>>does not appear to have such problems.
>>
>>Could you please provide a metadata dump of the affected filesystem? The
>>behaviour you describe is not supposed to happen. Do you have a decoded
>>Oops for us to see what happened?
> 
> 
> Unfortunately not.  It seems to happen to machines that have important 
> production uses and which have little spare disk space.

A compressed metadata dump uses about 0.1% of your disk space, i.e. ~2MB
for a 2GB partition. I'm sure you have at least 1% spare disk space.
Otherwise you are suffering from horrible performance anyway. There is
no filesystem I'm aware of which performs well with <5% free.
Corrections welcome.


Regards,
Carl-Daniel
-- 
http://www.hailfinger.org/

