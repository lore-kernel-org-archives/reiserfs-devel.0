From: Benjamin Vander Jagt <benjamin@winchesterpc.com>
Subject: Re: [nikita-3002]: assertion failed: carry_level_invariant(doing,
 CARRY_DOING)
Date: Fri, 18 Aug 2006 18:39:59 -0700 (PDT)
Message-ID: <5880857.post@talk.nabble.com>
References: <200608021749.30205.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608030851.30457.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608031928.25155.zam@namesys.com> <200608062224.43728.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608101355.29298.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608111315.17116.vs@namesys.com> <5832497.post@talk.nabble.com> <200608171634.13172.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29630-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608171634.13172.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com




Andrew James Wade-3 wrote:
> 
>      I've been getting occasional short freezes of a couple of minutes.
> But that's probably unrelated: as I have debugging turned on and am
> deliberately stressing the fs poor performance is not unexpected.
> ...
>> Andrew, may I ask for the contents of your /proc/meminfo file? 
> 
> Sure:
> 
> MemTotal:       512648 kB
> MemFree:         70612 kB
> Buffers:          2800 kB
> Cached:         105236 kB
> SwapCached:      33812 kB
> Active:         335988 kB
> Inactive:        63028 kB
> SwapTotal:     9791608 kB
> SwapFree:      9757768 kB
> Dirty:              84 kB
> Writeback:           0 kB
> AnonPages:      267960 kB
> Mapped:          52792 kB
> Slab:            22760 kB
> PageTables:       3148 kB
> NFS Unstable:        0 kB
> Bounce:              0 kB
> CommitLimit:  10047932 kB
> Committed_AS:   686084 kB
> VmallocTotal:   515796 kB
> VmallocUsed:     25572 kB
> VmallocChunk:   489680 kB
> HugePages_Total:     0
> HugePages_Free:      0
> HugePages_Rsvd:      0
> Hugepagesize:     4096 kB
> 
> I am currently trying to distill a test-case for crashing the fs.
> It is going slowly, but I have managed to provoke a few panics,
> including some new ones:
> 
> reiser4 panicked cowardly: reiser4[scatteredwrites(4506)]:
> reiser4_writepage (fs/reiser4/page_cache.c:522)[]:
> assertion failed: can_hit_entd(ctx, s)
> Kernel panic - not syncing: reiser4[scatteredwrites(4506)]:
> reiser4_writepage (fs/reiser4/page_cache.c:522)[]:
> assertion failed: can_hit_entd(ctx, s)
> 
> reiser4 panicked cowardly: reiser4[tar(4238)]: reiser4_update_extent
> (fs/reiser4/plugin/item/extent_file_ops.c:807)[]:
> assertion failed: reiser4_lock_counters()->d_refs == 0
> Kernel panic - not syncing: reiser4[tar(4238)]: reiser4_update_extent
> (fs/reiser4/plugin/item/extent_file_ops.c:807)[]:
> assertion failed: reiser4_lock_counters()->d_refs == 0
> 
> reiser4 panicked cowardly: reiser4[patch(9302)]:
> reiser4_set_page_dirty_internal (fs/reiser4/page_cache.c:475)[]:
> assertion failed: JF_ISSET(jprivate(page), JNODE_DIRTY)
> Kernel panic - not syncing: reiser4[patch(9302)]:
> reiser4_set_page_dirty_internal (fs/reiser4/page_cache.c:475)[]:
> assertion failed: JF_ISSET(jprivate(page), JNODE_DIRTY)
> 
> These are all for 2.6.18-rc4-mm1 + the small patch upthread.
> 
> Andrew Wade
> 

I will watch for your results.  Turning on the swap *blush* seems to have
eliminated all dmesg warnings and errors, but I'm still hanging at shutdown
time.  It now sounds like we have two different circumstances that resulted
in the same error, so I'll just watch the results of your testing. 
Meanwhile, I'll run the same kernel + patch you're running on another
computer and watch.

-Benjamin Vander Jagt
-- 
View this message in context: http://www.nabble.com/-nikita-3002-%3A-assertion-failed%3A-carry_level_invariant%28doing%2C-CARRY_DOING%29-tf2042550.html#a5880857
Sent from the ReiserFS - General forum at Nabble.com.

