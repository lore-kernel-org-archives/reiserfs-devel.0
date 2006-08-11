From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: [nikita-3002]: assertion failed: carry_level_invariant(doing, CARRY_DOING)
Date: Fri, 11 Aug 2006 13:15:16 +0400
Message-ID: <200608111315.17116.vs@namesys.com>
References: <200608021749.30205.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608062224.43728.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608101355.29298.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29573-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608101355.29298.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, andrew.j.wade@gmail.com
Cc: Alexander Zarochentsev <zam@namesys.com>

Hello

On Thursday 10 August 2006 21:55, Andrew James Wade wrote:
> Hello,
>
> I've had another panic on a fscked filesystem:
>
> reiser4 panicked cowardly: reiser4[updatedb(3302)]: reiser4_writepage
> (fs/reiser4/page_cache.c:521)[]: assertion failed: can_hit_entd(ctx, s)
> Kernel panic - not syncing: reiser4[updatedb(3302)]: reiser4_writepage
> (fs/reiser4/page_cache.c:521)[]: assertion failed: can_hit_entd(ctx, s)
>

What kernel do you use? Recently we had few fixes of such problem.

> It's getting pretty obvious that there must be something unusual/unique
> in my setup that's giving me grief. My guess would be that data is
> getting corrupted going between the drive and memory. I do have my
> pci bus underclocked to 30 MHz so maybe that's a factor. I have had
> problems with memory corruption in the past (hence the underclocking),
> but I haven't had any of the symptoms of memory corruption
> re-appearing. (Note that /dev/hdb is my /home filesystem only, so
> it's plausible that problems there would mostly tickle reiser4 code).
>
> If that's what is going on, I would expect file contents to also
> corrupt. I'm going to whip up some scripts to exercise the reading
> and writing large amounts of data to the disk and and see if I can
> find corruption of the data. (I hope to be able to use O_DIRECT to
> avoid thrashing).
>
> I suppose another possibility is that there is something strange in
> my filesystem that survives fsck, but causes problems. Given the
> variety of symptoms (and the lack of other reports) I would tend to
> discount that though. For the record this is what fsck keeps telling
> me:
>
> FSCK: Node (33160105), item (0), [29:1(SD):0:2a:0]: the slot (9) contains
> the invalid opset member (compress mode), id (2). FSCK: Node (33160105),
> item (0), [29:1(SD):0:2a:0]: removing broken slots. FSCK: Node (33160105),
> item (0), [29:1(SD):0:2a:0]: item has the wrong length (94). Should be
> (90). Fixed.
>
> I'm going to run fsck twice in a row to verify that fsck fixes the
> problems, but I'm working under the assumption that what fsck is
> finding is unrelated.
>
> I think the ball is in my court: fortunately I now have time to devote
> to investigation. I'll let you know what I find.
>
> Comments?
>
> Andrew Wade
