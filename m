From: Sebastian Kanthak <sebastian.kanthak@muehlheim.de>
Subject: Re: vs-3050: wait_buffer_until_released
Date: Wed, 19 Feb 2003 14:26:22 +0100
Message-ID: <200302191426.22177.sebastian.kanthak@muehlheim.de>
References: <200302181840.47996.sebastian.kanthak@muehlheim.de> <20030219112233.A10215@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12835-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030219112233.A10215@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hi Oleg,

thanks for your fast response.

On Wednesday 19 February 2003 09:22, Oleg Drokin wrote:
> On Tue, Feb 18, 2003 at 06:40:47PM +0100, Sebastian Kanthak wrote:
> > I'm using a  vanilla 2.4.20 kernel with reiserfs on lvm. I can
> > reproducably crash the system by accessing the reiserfs-partition via
> > samba. If I do this, the following message appears in the kernel log and
> > repeats every 5 or 10 seconds.
> > Feb 18 11:11:10 manticore kernel: vs-3050: wait_buffer_until_released:
> > nobody releases buffer (dev 3a:01, size 4096, blocknr 128036, count 2,
> > list 0, state 0x10019, page c1108284, (UPTODATE, CLEAN, UNLOCKED)). Still
> > waiting (60000000)  JDIRTY !JWAIT
> > I've dumped the mentioned block via debugreiserfs and attached it to this
> > email.
>
> Aha. More info for you.
> If you mean the above message as the "crash", then there is different
> scenario, that might be taking place.

Yes, that was what I called a "crash". It's not a kernel panic, so crash was 
misleading indeed.

I haven't fixed the bitmap inconsistency yet, because I thought, you might 
want some other info. In the meantime, the filesystem was not used very much 
(only some simple cron-jobs or so), but I got new errors in my kernel log. 
Output from dmesg is:

vs-4080: reiserfs_free_block: free_block (3a01:482474)[dev:blocknr]: bit 
already cleared
vs-4080: reiserfs_free_block: free_block (3a01:482473)[dev:blocknr]: bit 
already cleared
vs-4080: reiserfs_free_block: free_block (3a01:482472)[dev:blocknr]: bit 
already cleared
vs-4080: reiserfs_free_block: free_block (3a01:482471)[dev:blocknr]: bit 
already cleared
vs-4080: reiserfs_free_block: free_block (3a01:322183)[dev:blocknr]: bit 
already cleared
vs-4080: reiserfs_free_block: free_block (3a01:322180)[dev:blocknr]: bit 
already cleared

and a lot of similar lines. If I do a reiserfsck now, I get more errors than 
the first time:

###########
reiserfsck --check started at Wed Feb 19 14:03:17 2003
###########
Replaying journal..
0 transactions replayed
Checking internal tree../  1 (of   2)/ 61 (of  86)/ 81 (of  
86)bad_indirect_item: block 315773: The item (46710 50807 0x1 IND (1), len 8, 
location 1516 entry count 0, fsck need 0, format new) has the bad pointer (0) 
to the block (315774), which is in tree already
bad_indirect_item: block 315773: The item (46710 50807 0x1 IND (1), len 8, 
location 1516 entry count 0, fsck need 0, format new) has the bad pointer (1) 
to the block (315775), which is in tree already
finished
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
Checking Semantic tree:
finished
4 found corruptions can be fixed with --fix-fixable
###########
reiserfsck finished at Wed Feb 19 14:20:09 2003
###########

Now, I'm wondering where these new errors came from. Are they a result of the 
first error, or do they indicate a real problem? I will fix the above 
problems with reiserfsck, but I'm afraid it will happen again, as I'm using 
reiserfs on this machine for three days now. So I better find the reasons for 
the problems. Do you have an idea, where my problems come from? I know now, 
that threads are waiting for a in-tree buffer marked as free, but what's the 
cause for this inconsistency? What's going on here? Can I provide you with 
additional (useful) data somehow?

As reiserfs certainly does not contain so many bugs I'm starting to suspect my 
hardware (I've read your FAQ about reiserfs running hotter). Memory seems to 
be ok, though. Do you know a good tool to stress test the hard-disk and 
report errors? I'll certainly need a way to reproduce the error in order to 
locate it...

Thanks for your help so far.

Sebastian


