From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: reiserfs logging patches udpated
Date: Wed, 24 Mar 2004 19:56:23 -0800
Message-ID: <40625867.4060800@matchmail.com>
References: <1080149399.14737.77.camel@watt.suse.com> <20040324143516.3162cbfe.akpm@osdl.org> <1080168379.14743.124.camel@watt.suse.com> <200403250147.54246.bernd-schubert@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17457-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403250147.54246.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bernd Schubert <bernd-schubert@web.de>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>, Andrew Morton <akpm@osdl.org>

Bernd Schubert wrote:
> However, besides of the proper discussion about the ide problem, there was a 
> 'sub' thread with about 50 messages about the instability of reiserfs!!!

I wouldn't be surprised, you get this in the debian lists also.

But, the thing is...  I wouldn't trust my data to any filesystem without 
a data=ordered mode.  I've used reiserfs on a few systems and it does 
have a speed increase, but the journaling is like ext2 -- it just 
journals what it has done, there is no ordering performed *at all* (that 
is until Suse's data=X journaling patches for reiser3).

Adding the fact that reiserfsck3 is just recently getting out of beta 
level quality (crashes, livelocks & etc during fsck and etc were common 
until the last few months)

And after having the difference of a block level journal (ext3), instead 
of a "virtual" journal(reiserfs, jfs, xfs) explained to me (check the 
ext3-users archives...) -- and how it can save your ass when there are 
hardware problems.  I was convinced and switched everything back to ext3.

The basic idea of virtual vs block journals, is that instead of using a 
few bytes to describe what you're changing in (for instance) the inode 
table (or equivalent), ext3 copies entire inode table block (usually 
1-4k depending on block size) into the journal.

Where this can save your ass is where some power or other hardware 
problem caused your drive to overwrite one of your inode tables (or 
bitmaps or...).  Well, some of your data will be corrupted, but if that 
inode table was written to relatively recently, it'll be restored from 
the journal during recovery.

Yes, I saw speed increases with reiserfs3, but I *will not* use it with 
critical systems that don't have a power backup and raid system (since 
reiserfs3 really sucks at handling bad blocks).

If I get the time, I'll help test the reiser3 patches in -mm.  Thank you 
  Chris for working on this direly needed patch, I'll feel comfortable 
with my systems running reiser3 once they're running with this patch.

Mike
