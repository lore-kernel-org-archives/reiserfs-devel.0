From: Oleg Drokin <green@namesys.com>
Subject: Re: vs-3050: wait_buffer_until_released
Date: Wed, 19 Feb 2003 09:41:25 +0300
Message-ID: <20030219094125.C24598@namesys.com>
References: <200302181840.47996.sebastian.kanthak@muehlheim.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12833-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302181840.47996.sebastian.kanthak@muehlheim.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Kanthak <sebastian.kanthak@muehlheim.de>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Feb 18, 2003 at 06:40:47PM +0100, Sebastian Kanthak wrote:

> I'm using a  vanilla 2.4.20 kernel with reiserfs on lvm. I can reproducably 
> crash the system by accessing the reiserfs-partition via samba. If I do this, 

Can you make the crash info available (oops or whatever you define as "crash").

> the following message appears in the kernel log and repeats every 5 or 10 
> seconds.
> Feb 18 11:11:10 manticore kernel: vs-3050: wait_buffer_until_released: nobody 
> releases buffer (dev 3a:01, size 4096, blocknr 128036, count 2, list 0, state 
> 0x10019, page c1108284, (UPTODATE, CLEAN, UNLOCKED)). Still waiting 
> (60000000)  JDIRTY !JWAIT

Sure, if one of the threads crashed holding a buffer, other threads waiting for the
buffer would never succeed.

> The only way to stop the machine is to hit the reset button, as every process 
> that accesses the reiserfs-partition freezes and cannot be killed, including 
> shutdown.

This is kind of "that's how it works in linux if kernel crashed"

> ###########
> reiserfsck --check started at Tue Feb 18 18:09:32 2003
> ###########
> Replaying journal..
> 0 transactions replayed
> Checking internal tree..finished
> Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
> Checking Semantic tree:
> finished
> 1 found corruptions can be fixed with --fix-fixable
> ###########
> reiserfsck finished at Tue Feb 18 18:26:47 2003
> ###########
> Should I fix the bitmap thing? Is it the reason or the consequence from the 

You may or may not. If you won't, there will be some "lost" space on the filesystem.

> above problem. We've changed to reiserfs one day ago, so I'm afraid that the 
> problem will reappear, even if I fix it with reiserfsck.

Sure, that's why we are interested in crash information, so that we can understand
it's source and fix the problem if it is reiserfs fault, or if it is the problem
that lies elsewhere, we will ping whoever is the responsible party.

> I've searched the mailing list archives and found others with the same 
> problem, however, no solution yet. Do you know the reason for the problem?

Yes. The problem is that reiserfs is waiting on the buffer that is never released.
It is supposedly never released because you had a crash that killed the thread that
acquired the buffer, but have not released it yet.

Thank you.

Bye,
    Oleg
