From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Further work on reiser4: discard support and performance issues
Date: Mon, 11 Mar 2013 16:22:05 +0400
Message-ID: <7451120.XOOv44xHvf@intelfx-laptop>
References: <1856576.kOCPiaH0RB@intelfx-laptop> <1435419.Em4W395xSI@intelfx-laptop> <51322F14.6000405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:user-agent
         :in-reply-to:references:mime-version:content-transfer-encoding
         :content-type;
        bh=oEfbZbbc0JI95uPxS57hK3rOsEh/bTqYKJ3mJtdyYVY=;
        b=eIP6Zdm/v7KzIFN4hzcw7/Ckfh5mYydH5IP7VuhDz2X1yq40bwMhuOCNNLL81puFhk
         U+BpRSQv97K/vPc0MLcC4XOP9AdQLMRa25BsJNnGEd85vLYJixwbLG5WZ6AMiasARY17
         w86lCGep5eWmqzROlZ1VnTsgfRkylWptDZfFFyX6KVEGGEGWwML6dcJ8BIUTxzZumjkD
         ZfXlmyzXlm21Iuh0b7x4LYt/GVHEcFU4WK2hbwSdoW4geqxKB3Z2S4sfooIq4DuDKa4o
         6iLMN5qLnrOwyKcPAj7IYw2uZ2U9D+S+C0s+LxL9lljPBcSO64e4OSvGa2ZUV5+qVdoI
         qGUQ==
In-Reply-To: <51322F14.6000405@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

On 02 March 2013 17:55:48 Edward Shishkin wrote:
> On 02/23/2013 01:21 PM, Ivan Shapovalov wrote:
> [...]
> 
> >>> But here's what I currently think about discard implementation.
> >>> In filesystems like jfs, it is implemented pretty straightforward.
> >>> "Online" discard on block freeing is done through hooking into
> >>> function dbFree(), which marks the blocks as free in the _working_
> >>> allocation map. Batch discard via FITRIM ioctl is done through locking
> >>> the whole allocation group, allocating everything in it, trimming
> >>> these blocks and freeing them again.
> >>> 
> >>> For reiser4, I think it will translate into something like this:
> >>> With "online" discard, it would be better to discard the blocks at
> >>> transaction commit time (the time when working bitmap is copied to the
> >>> persistent one... am I right?)
> >> 
> >> I am sorry, but I still don't know the TRIM/discard background well
> >> enough to make any decisions. I understand that a file system should
> >> issue some commands to "help" the hardware? What those commands will
> >> result in?
> > 
> > ---- tl;dr area begin
> > 
> > The TRIM is a command in the ATA protocol, operating on a sector range.
> > It tells the hardware (storage) that the given sector range is not used
> > anymore and hence data contained in it can be discarded/removed.
> > (Similar commands exist in several other protocols, like SCSI UNMAP and
> > SD ERASE, and the "discard" is an in-kernel abstraction to all such
> > commands.)
> > 
> > The reason why do we need such a command for SSDs is that in flash memory
> > an "overwrite data" operation is actually an "erase + write data" and is
> > much more costly than just a "write data onto free space". Flash memory
> > is organized into pages (usually 4K), which are further grouped into
> > blocks (512K); and while a write is done per-page, an erase is done
> > per-block (so a controller shall read the whole block into cache and then
> > rewrite all pages in it, except the one being updated).
> > 
> > Modern controllers do internal block remapping to achieve some "wear
> > leveling" (i. e. spreading use across all blocks instead of continuously
> > rewriting one block which is updated by the user), but they obviously
> > need a pool of free blocks, and anyway - writes to the locations that the
> > software would consider empty still may trigger a read-erase-write cycle.
> > 
> > So, the TRIM command notifies the controller that the block can be erased
> > and returned to the free pool. There is a restriction on sector ranges
> > given to the command: they should actually represent whole blocks
> > (otherwise they are ignored, AFAIK).
> 
> Hello Ivan.
> 
> Thanks for the background. This is exactly what did I want to see.
> 
> > So, from the software's point of view, an SSD-aware operation looks like
> > 1) putting whatever is likely to be updated simultaneously into the same
> > block (TRIM unit);
> 
> Not sure if I understand the (1). Could you please say more?

I wanted to say that we could tune block allocation algorithms (or whatever is 
responsible for choosing a specific free block from all available ones) so 
that 
the data which is likely to be updated together, e. g. file body and stat-
data,
will be placed in blocks of the same erase unit (== TRIM unit, as reported by 
kernel). It will just make less read-erase-write cycles when the buffers are 
written.
But well, this is no more than just a heuristic. The kernel sometimes just 
fails to provide a sane granularity. (Again, in my case, granularity is 
reported as 1 sector/512 bytes.)

> 
> > 2) delaying writeback in hope that more adjacent data will be written at
> > once;
> Yes. In reiser4 we delay everything what is possible.
> And, I think, discard requests shouldn't be an exception..
> 
> > 3) notify the storage when the blocks are logically freed by issuing a
> > TRIM
> > command.
> > 
> > (1) and (2) are largely my guesses (and anyway out of scope), while
> > (3) is a common practice and is implemented at storage driver, kernel and
> > filesystem layers.
> > 
> > ---- tl;dr area end
> > 
> > So, inside the filesystem we need to notify the kernel about  we need to
> > implement TRIM (more precisely, discard - as we're working with
> > in-kernel abstractions) support in the filesystem
> > 
> > About the implementation:
> > There is an API call, blkdev_issue_discard() [1], which does all the
> > work and is supposed to be called from the filesystem. The discard
> > properties are stored in struct queue_limits.
> > 
> > And for the filesystem itself, there are generally two modes to support
> > discard operations [2].
> > 1) "Realtime" or online discard - the filesystem discards blocks as they
> > are deallocated (files being deleted, tree nodes being cut, etc.).
> 
> There is another source of deallocated blocks in reiser4, that you
> should be aware of. This is the flush procedure. This procedure
> operates on a reiser4 atom and is called every time before its commit
> to complete all delayed actions:
> 
> (1) allocate all extents of the atom (for files manages by
>        unix-file plugin);
> (2) compress data of the atom (for files managed by
>        cryptcompress file plugin);
> (3) balance tree in the atom's locality;
> (4) schedule commit policy for dirty blocks of the atom
>        (relocate, or overwrite).
> 
> (3) - (4) are sources of deallocated blocks: (3) will release blocks
> freed after squeezing an atom. And (4) will be the most active issuer
> of discard requests: at this phase we determine the best allocation
> for the whole group of atom's dirty blocks in accordance with some
> heuristic. And it can happen that a lot of blocks will change their
> on-disk locations (they will be assigned to so-called atom's "relocate
> set"). Other dirty blocks (which won't change their on-disk locations)
> are assigned to atom's "overwrite set".
> 
> Committing an atom in reiser4 looks like this:
> 
> (a) write atom's relocate set (simply write the blocks to their new
>       locations on disk);
> (b) write atom's overwrite set (via journal, aka "wandering logs"),
>       i.e. at first, write the dirty blocks to journal, then overwrite the
>       blocks at their old locations on disk;
> (c) update system records to indicate, that transaction is
>       completed.

And thank _you_ for the reiser4 background. Now its "pipeline" is more clear 
to me...

> 
> I think that in "realtime" mode we should issue all discard requests
> of an atom at the point after (b) and before (c). Indeed, at this point
> all updated bitmaps are successfully committed, so in the worst case
> (power off when issuing a series of discard requests) we'll just loose
> only a part of discard requests (not fatal).

Yes, seems good. BTW - if we implement realtime discard in such way, will we 
automatically get discard at transaction replay? Or is there no such thing as 
"transaction replay" in r4?

> 
> > 2) "Batch" discard - the filesystem discards all free blocks upon a user's
> > request (when mounted).
> > In this "batch" case, the signaling is done through a FITRIM ioctl on any
> > file.
> > 
> > "Batch" mode:
> > Implementing it should be simple enough (if I'm making correct assumptions
> > about how does reiser4 work): we can just lock the bitmap and walk through
> > it, issuing a discard for each long enough free sequence.
> 
> Mmm, I haven't found definition of "free block"..
> 
> For example, we have deleted a file by unlink(2), and the transaction,
> which contains the updated bitmap is not yet committed. And here is
> an interesting question: at this moment blocks of that file are free, or
> busy? ;)

Does reiser4 have a notion of "effective" bitmap? The one which 
represents current on-disk data, without any in-flight transactions.
I've been thinking of this:
- lock transactions from being committed
- get the "effective" bitmap
- directly scan it and issue discard requests
- unlock everything

Is it possible? If not, then actually the algorithm you described in a
follow-up message (separate process) looks viable and optimal.
BTW, that is partially similar to how other filesystems implement batch 
discard - they use existing interfaces to (temporarily) allocate blocks
in a loop and then discard these allocated blocks.

> 
> > "Realtime" mode:
> > It will be more complex given that we have to do the actual work on
> > transaction commit.
> > You are right about the slowness of bitmap comparison (yes, 32K bitops...
> > I
> > haven't thought about it); we'll need to store locations to discard in
> > some
> > per-atom data structure.
> > 
> > Let's define a "minimal discard range" to be a block range,
> > 1) whose begin is properly aligned,
> > 2) whose size is equal to discard granularity.
> > This can be checked using data from struct queue_limits (exact algorithm
> > can be derived from code of blkdev_issue_discard()).
> > 
> > Actually, simply storing each deallocated interval in the atom and then
> > iterating through the list upon commit will be suboptimal.
> > Reasons:
> > - if a single deallocated range is smaller than the discard granularity,
> > then this particular range won't be discarded even if it is surrounded by
> > enough free blocks to make a minimal discard range;
> > - we won't be able to merge small adjacent ranges to form a range that's
> > long enough.
> > 
> > Solution:
> > - record all deallocated ranges verbatim (in a list);
> > 
> > - on commit time, for each recorded range find minimal discard range(s)
> > which encompass the given range and check if all their blocks can be
> > discarded (i. e. are free);
> > 
> > - add each suitable minimal discard range to a locally-allocated tree
> > (while merging the added ranges);
> 
> Why not to just maintain per-atom rb-trees? All deallocated ranges
> will be represented as records (extents) in those trees. It looks more
> simple, no?
> 
> When truncate(2) deallocates a range of blocks, we find a position in
> such "discard tree", and try to merge this range with neighbouring
> extents. If they are not mergeable, then insert one more extent...
> 
> I see the following (hope resolvable) problems here:
> 
> 1. Ranges of blocks freed by truncate(2) can be "spoiled" by
> relocate decisions performed in flush time (action (4) above).
> I mean the situation when the flush procedure borrows block
> numbers for the "best allocation" from... our discard extents.
> 
> In other words, before issuing a discard request, we need to
> check our discard extents for possible "holes". Such check can
> be also implemented by the updated bitmap, which is contained
> in the same atom.
> 
> 2. Another problem is maintenance of the "discard trees" during
> atom's evolution. Sometimes atoms may merge. So their "discard
> trees" should be respectively merged. For the beginning we can
> merge trees for by simply allocating a new empty one and placing
> there all extents from the trees we want to merge (N+M operatioins).
> Later we can implement "rb-trees with fingers", invented for fast
> merge, which will take only log(min{N,M}) operations [1].
> 
> 3. And one more problem: it would be better to not allocate anything
> at flush and commit time: usually flush/commit is a reiser4 respond
> to memory pressure notifications of the operating system. Linux
> doesn't have any reservation mechanisms for subsystems, which
> need memory to free memory.
> 
> At flush time we'll need memory to represent deallocated ranges as
> records in the "discard trees". I think it makes sense to preallocate
> special per-atom pools for those needs. I think 20-40K per atom should
> be enough.

Here's the problem I was going to resolve with my algorithm:
- discard granularity is e. g. 4 blocks
- Initial bitmap: 1001 (1 - busy, 0 - free)
- deallocate first and last blocks, not necessarily in a single transaction
- resulting bitmap: 0000 (discard ranges: 0:1 and 3:1)
- ranges can't be merged since they aren't adjacent (even if in the same 
transaction) and can't be discarded since they all are smaller than the 
granularity, while the whole 4-block range can be discarded easily.

Also, by delaying "range -> TRIM unit" conversion to commit time
we get solution of (1) for granted since we already access bitmap - and such 
accesses also aren't going to be very expensive.
So in atoms we can maintain simple linked lists, and (2) is solved too because 
they can be merged for constant time.

Moreover, I've seen filesystems adding an artificial granularity limit 
(i. e. do not even bother to discard ranges smaller than N sectors) to aid 
performance in case if kernel-reported limits are wrong.
In our case, we can also do that without sacrificing long-term efficiency
(as all freed ranges will be eventually discarded once they become long 
enough).

How does that sound?

Regarding memory - I wonder if multiple atoms can be flushed concurrently.
If no, then preallocated pools for per-atom lists + global (per-mount) pool 
for the resulting discard tree.
BTW, maybe we can infer the per-atom pool size from atom_max_size?

> 
> > - issue discard for all found ranges.
> > 
> > Hope this won't be too slow. BTW, kernel sometimes seems to report wrong
> > granularity. In my case, granularity is reported as 512 bytes.
> 
> So we can make a recap.
> 
> Batched discard:
> 
> Some clarifications are needed to understand if we can implement
> something useful here..
> 
> Realtime discard:
> 
> Now It is more or less clear, how to implement it in reiser4. You will
> want to make a friendship with reiser4 transaction manager. This is
> rather advanced and complicated thing (with this manager reiser4
> has much more capabilities, than any other file system). Start with
> understanding, that every cached block (page) of reiser4 partition is
> contained in some atom: this is captured by reiser4 transaction
> manager (try_capture() and friends). Note, that atom contains not
> only dirty blocks. Clean blocks also participate in relations created by
> transaction manager (see [2] for details). Once in a while (responding
> on memory pressure notification, or because the transaction is too
> large/old) atoms get committed: their subsets of dirty blocks are
> written to disk by steps (a, b, c) above.
> 
> You will encounter specific problems, but experience shows all they
> are resolvable.

Hope they are... So I see following steps:
- Access the atom from bitmap manipulation plugin
- Store freed ranges to the in-atom tree/list
- Traverse through the transaction manager and add code supporting the discard
  lists (merge, etc - if any)
- Patch the flush procedure to perform discard requests after writing blocks

Am I missing something?

Thanks,
Ivan.

> 
> Thanks,
> Edward.
> 
> [1] http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.38.4454
> [2] http://lwn.net/2001/1108/a/reiser4-transaction.php3
> 
> [...]
> 
> >>    by performing a comparison between the
> >>> 
> >>> old (on-disk) and new bitmaps, remembering all changed chunks and
> >>> issuing discard for them.
> >> 
> >> I afraid that comparison the bitmaps is something expensive: it means
> >> 4K*8 = 32K comparisons per bitmap block.. Maybe it makes sense to
> >> accumulate the "difference" in special per-atom data structures
> >> (say, rb-trees)?
> >> 
> >>    Also, the discard granularity can be higher
> >>> 
> >>> than the bitmap granularity. E. g. if we have a bitmap pattern like
> >>> "0010" and it changes to "0000", it would be better to issue a discard
> >>> for 4 blocks instead of just one.
> >>> 
> >>> And with FITRIM, we could just lock the bitmap and walk through it,
> >>> discarding all free chunks. Of course, it can only be done if locking
> >>> policy allows us to "just lock the bitmap"...
> >>> 
> >>> BTW, I'm afraid I don't understand what "a proposal" means. Is it a
> >>> kind of some official document - and if yes, who needs it?
> >> 
> >> Nothing official, this is a usual practice in groups that work
> >> remotely: someone send a kind of roadmap. In the simplest case it
> >> can be a set of links where one can read about TRIM/discard.
> >> Maybe "proposal" sounds too official? :)
> >> 
> >>> For the other things: the freezing issue seems to be related to
> >>> fsync() indeed; the freeze rate decreased substantially when I stopped
> >>> using InnoDB as the MySQL backend. Some of them remained, seemingly
> >>> related to Dropbox (== concurrent reads and writes to the same file).
> >> 
> >> This is a known problem, I'll try to find Reiser's suggestions how to
> >> resolve this..
> > 
> > Due to transactional fs's nature?
> > 
> >>> And yes, I'll try to do the bisection as soon as enough free time
> >>> appears... Will a virtual machine be enough, or it is crucial that the
> >>> tests shall be performed on a real machine?
> >> 
> >> It can be remote, but it should be a real machine. BTW, where are you
> >> territorially?
> > 
> > I'm in Moscow (RU). Actually, I can do that on my primary PC - if those
> > old
> > kernels are able to boot a SandyBridge chipset.
> > 
> > BTW, mirror at mirror.sit.wisc.edu is offline... I'll use
> > mirror.linux.org.au - and hope that patches will apply to any of the
> > intermediate states. What is the first known bad version?
> > 
> > Ivan.
> > 
> >> Edward.
> >> 
> >>> Thanks,
> >>> Ivan.
> >>> 
> >>> 2013/2/10 Edward Shishkin<edward.shishkin@gmail.com>:
> >>>> Hi Ivan,
> >>>> 
> >>>> How our TRIM/dsicard is doing?
> >>>> Any questions, or everything is clear? :)
> >>>> 
> >>>> Edward.
> >>>> 
> >>>> On 01/17/2013 05:39 PM, Edward Shishkin wrote:
> >>>>> On 01/07/2013 02:42 AM, Ivan Shapovalov wrote:
> >>>>>> Hi again Edward,
> >>>>> 
> >>>>> Hello.
> >>>>> 
> >>>>>> Here's what I want to try to do with reiser4 in meantime. I'd
> >>>>>> appreciate some
> >>>>>> hints on that all...
> >>>>>> 
> >>>>>> So, first thing I'd like to implement is TRIM/discard support, both
> >>>>>> online
> >>>>>> (via -o discard) and in a separate FITRIM ioctl().
> >>>>>> That's just because I've got an SSD two days ago and thus now have to
> >>>>>> use in
> >>>>>> rootfs some discard-aware fs like ext4.
> >>>>> 
> >>>>> I think it would be nice for beginning. Moreover, reiser4 still
> >>>>> doesn't
> >>>>> have any setup optimal for SSD.
> >>>>> 
> >>>>> Unfortunately I don't have a ready proposal for TRIM/discard support
> >>>>> in
> >>>>> reiser4.
> >>>>> 
> >>>>> I have ready proposals for the following features (they can be rather
> >>>>> complicated for the beginners though):
> >>>>> 
> >>>>> 1) Repacker (On-line defragmentation);
> >>>>> 2) Support of different transaction models:
> >>>>> a. pure journalling;
> >>>>> b. pure COW (Copy-On-Write);
> >>>>> c. smart (the current "mixed" one);
> >>>>> d. no transaction support (for people with UPSs);
> >>>>> 3) Subvolumes (AKA "chunkfs");
> >>>>> 4) Snapshots.
> >>>>> 
> >>>>>> And then I want to do something with performance: sometimes during
> >>>>>> heavy I/O
> >>>>>> to a slow /home storage (especially when it's multithreaded) many
> >>>>>> processes,
> >>>>>> including the DE, just get stuck in "D" state and sit there for a
> >>>>>> minute or
> >>>>>> two with load average of apx. 5.5 (on a hyperthreaded 2-core CPU).
> >>>>> 
> >>>>> and some process waits for fsync() completion?
> >>>>> 
> >>>>>> For the first, I can look into other filesystems' implementations,
> >>>>>> but
> >>>>>> I'll
> >>>>>> probably be unsure at which layer to put the actual discard call (in
> >>>>>> order not
> >>>>>> to break reiser4's transactional nature).
> >>>>> 
> >>>>> If you decide to proceed with TRIM/discard support, you will need to
> >>>>> prepare the proposal by yourself. Let's start with some background,
> >>>>> that is:
> >>>>> . clarify underlying reasons (specific for SSD geometry?) of
> >>>>> TRIM/discard support: why do we need such support on the file
> >>>>> system layer;
> >>>>> . review of existing hardware and software means for such support;
> >>>>> . etc..
> >>>>> 
> >>>>> And yes, it would be nice to review existing TRIM/discard support
> >>>>> implementations in other file systems (say, ext4).
> >>>>> 
> >>>>> Once we figure out, what bits of reiser4 you should understand
> >>>>> perfectly to implement TRIM/discard support, I'll provide you with
> >>>>> respective hints.
> >>>>> 
> >>>>>> And for the second, I just don't know why does that happen. Can it be
> >>>>>> due to
> >>>>>> some r4-specific things/issues or that's just a horribly slow random
> >>>>>> access
> >>>>>> speed of my hw?
> >>>>> 
> >>>>> Which hw? SSD?
> >>>>> 
> >>>>> I also remember complaints that umount (i.e. the final sync takes 2-3,
> >>>>> or even more minutes). It looks like in some cases reiser4 accumulates
> >>>>> too much dirty stuff..
> >>>>> 
> >>>>> It would be nice to periodically dump some info about atoms (current
> >>>>> number of all atoms, size of each atom, etc) to see the full picture
> >>>>> of
> >>>>> their evolution during such freezing. I think, it makes sense to port
> >>>>> the old reiser4 profiling stuff, and populate it with more info (if
> >>>>> needed).
> >>>>> 
> >>>>> Also there is an oldest issue:
> >>>>> The following (old) benchmarks created with mongo(*) test suit show x2
> >>>>> advantage of reiser4 against reiserfs(v3) on CREATE phase (let's
> >>>>> consider only this phase for simplicity):
> >>>>> 
> >>>>> 
> >>>>> http://web.archive.org/web/20061113154648/http://www.namesys.com/bench
> >>>>> ma
> >>>>> rks.html
> >>>>> 
> >>>>> 
> >>>>> I've made similar benchmarks with latest 2.6 kernels (sorry, lost the
> >>>>> results) and found that the advantage has disappeared (real time in
> >>>>> CREATE phase is the same as of reiserfs, or even worse). It shouldn't
> >>>>> be so: it indicates that something wrong is going on.. I remember
> >>>>> people complained on the performance drop in reiser4 long time ago,
> >>>>> but
> >>>>> didn't have a chance to investigate this.
> >>>>> 
> >>>>> The straightforward way to narrow down the problem changeset is to
> >>>>> bisect starting from 2.6.8-mm2, the archives can be found here:
> >>>>> http://mirror.sit.wisc.edu/pub/linux/kernel/people/akpm/patches/2.6/
> >>>>> http://ftp.icm.edu.pl/packages/linux-reiserfs/reiser4-for-2.6/
> >>>>> 
> >>>>> http://mirror.sit.wisc.edu/pub/linux/kernel/people/edward/reiser4/reis
> >>>>> er
> >>>>> 4-for-2.6/
> >>>>> 
> >>>>> However, it can be rather painful and requires a separate machine.
> >>>>> 
> >>>>> Thanks,
> >>>>> Edward.
> >>>>> 
> >>>>> (*)
> >>>>> 
> >>>>> http://sourceforge.net/projects/reiser4/files/reiser4-utils/bench-stre
> >>>>> ss
> >>>>> -tools/
