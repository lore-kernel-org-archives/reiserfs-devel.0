From: Andrew James Wade <andrew.j.wade@gmail.com>
Subject: Re: [nikita-3002]: assertion failed: carry_level_invariant(doing, CARRY_DOING)
Date: Thu, 17 Aug 2006 16:34:12 -0400
Message-ID: <200608171634.13172.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
References: <200608021749.30205.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608111315.17116.vs@namesys.com> <5832497.post@talk.nabble.com>
Reply-To: ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29623-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5832497.post@talk.nabble.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Benjamin Vander Jagt <benjamin@winchesterpc.com>

On Wednesday 16 August 2006 09:32, Benjamin Vander Jagt wrote:

> I am having the exact same problems but with one difference.  After
> a while, the drive starts thrashing, and the system becomes totally
> unresponsive. 
     I've been getting occasional short freezes of a couple of minutes.
But that's probably unrelated: as I have debugging turned on and am
deliberately stressing the fs poor performance is not unexpected.

...
> Andrew, may I ask for the contents of your /proc/meminfo file? 

Sure:

MemTotal:       512648 kB
MemFree:         70612 kB
Buffers:          2800 kB
Cached:         105236 kB
SwapCached:      33812 kB
Active:         335988 kB
Inactive:        63028 kB
SwapTotal:     9791608 kB
SwapFree:      9757768 kB
Dirty:              84 kB
Writeback:           0 kB
AnonPages:      267960 kB
Mapped:          52792 kB
Slab:            22760 kB
PageTables:       3148 kB
NFS Unstable:        0 kB
Bounce:              0 kB
CommitLimit:  10047932 kB
Committed_AS:   686084 kB
VmallocTotal:   515796 kB
VmallocUsed:     25572 kB
VmallocChunk:   489680 kB
HugePages_Total:     0
HugePages_Free:      0
HugePages_Rsvd:      0
Hugepagesize:     4096 kB

I am currently trying to distill a test-case for crashing the fs.
It is going slowly, but I have managed to provoke a few panics,
including some new ones:

reiser4 panicked cowardly: reiser4[scatteredwrites(4506)]: reiser4_writepage (fs/reiser4/page_cache.c:522)[]:
assertion failed: can_hit_entd(ctx, s)
Kernel panic - not syncing: reiser4[scatteredwrites(4506)]: reiser4_writepage (fs/reiser4/page_cache.c:522)[]:
assertion failed: can_hit_entd(ctx, s)

reiser4 panicked cowardly: reiser4[tar(4238)]: reiser4_update_extent (fs/reiser4/plugin/item/extent_file_ops.c:807)[]:
assertion failed: reiser4_lock_counters()->d_refs == 0
Kernel panic - not syncing: reiser4[tar(4238)]: reiser4_update_extent (fs/reiser4/plugin/item/extent_file_ops.c:807)[]:
assertion failed: reiser4_lock_counters()->d_refs == 0

reiser4 panicked cowardly: reiser4[patch(9302)]: reiser4_set_page_dirty_internal (fs/reiser4/page_cache.c:475)[]:
assertion failed: JF_ISSET(jprivate(page), JNODE_DIRTY)
Kernel panic - not syncing: reiser4[patch(9302)]: reiser4_set_page_dirty_internal (fs/reiser4/page_cache.c:475)[]:
assertion failed: JF_ISSET(jprivate(page), JNODE_DIRTY)

These are all for 2.6.18-rc4-mm1 + the small patch upthread.

Andrew Wade
