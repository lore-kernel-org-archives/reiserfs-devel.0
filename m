From: David Masover <ninja@slaphack.com>
Subject: Re: Resize of a reiser4 filesystem?
Date: Sun, 17 Jul 2005 12:13:45 -0500
Message-ID: <42DA91C9.40205@slaphack.com>
References: <42DA6EBE.7020100@mid.alexander.skwar.name> <op.st2cqe1kth1vuj@localhost> <42DA780D.1070101@mid.alexander.skwar.name> <op.st2djmj7th1vuj@localhost> <42DA82F4.6080102@mid.alexander.skwar.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25155-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42DA82F4.6080102@mid.alexander.skwar.name>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com


Alexander Skwar wrote:
[...]
> Has resizefs.reiser4 been removed from 1.0.4?

I think that resizefs.reiser4, even when it was in 1.0.3, was a stub.  I 
don't think it even grew the FS.

As far as shrinking goes, forget it.  Shrinking will need a repacker, 
and Namesys wants to do an online repacker, which is great.  They want 
to be paid to do it, which is not great, because no one's currently 
paying them.

I offered to write one, but of course, this is one of the things that 
Hans would rather I not write so that he can have someone pay Namesys to 
write.

So, sometime after all the getting-into-the-vanilla-kernel fluff is 
done, we may get a resizefs.reiser4 that resizes online, growing or 
shrinking.  Maybe it'll even be able to do that from both ends, but I 
hardly dare hope.

For now, your best bet is to make sure you can do a full backup of 
anything you put on a Reiser4 filesystem, and do that backup with tar.



-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.323 / Virus Database: 267.9.0/50 - Release Date: 7/16/2005

