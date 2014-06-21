From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv5 0/4] reiser4: discard support: initial implementation,
 refactored.
Date: Sat, 21 Jun 2014 19:07:49 +0200
Message-ID: <53A5BBE5.50307@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=nEANRtu2GfCNJ8IWx15gGjeYm0TnrMJXRNml2UV37F8=;
        b=UQVqqbFVEgqEm2q5vd+gwzlbbWq7Hj2dYPyb1x/ejFxR1iG/PkUIUmn3LOOoLKw7sr
         O2G9YFg+S7Uy86taOxfsM8U6hHxEI5bgU1hN1PVm92KqNnM8L5QNQpuHriHxQYvKvkmK
         OToGthlJ4JCcrstP0eOAtsl7MM+CwIgp8GsRXAr+1N3XQKUMLhh7p4+Y93CiYoFWB7MF
         lqA5mprTFNIOj4IRzUgXPD5hRS+5NU/fx7aScgvKfgFkncyfr9dQQcNNz8RctodLjpcW
         4ZrImbdsPuOSIaOWWL1TgH32j9jmlEL11bOMHjzZl7mhjau49118kCwcsezKn4NjRHqV
         h0jg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

On 06/21/2014 01:52 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
 >
 > How much trouble would be to merge neighbouring discardable ranges o=
f=20
data in one large request by relocating small (size or relative size=20
defined as mount argument) nondiscardable chunk of data between them?=20
That way we would make less fragmentation (on ssd you say?


This will increase number of issued IOs, whereas we put a lot of effort=
s to
reduce it.. Indeed, such merge means that we relocate a part of blocks =
of
a discard unit to another one.


 > Well it kils us at deletion time as you have to make a lot of slow=20
requests instead of few large ones).


This is resolved by the feature fs-block-size =3D discard-unit-size.
I'll say straight: it is hard.

Edward.


 > On Jun 21, 2014 1:21 PM, "Edward Shishkin"=20
<edward.shishkin@gmail.com> wrote:
 >
 > On 06/21/2014 12:35 AM, Ivan Shapovalov wrote:
 >
 > On Saturday 21 June 2014 at 00:39:54, Ivan Shapovalov wrote:
 >
 > v1: - initial implementation (patches 1, 2)
 >
 > v2: - cleanup, fixes discovered in debug mode
 > - saner logging
 > - assertions
 > - enablement of discard through mount option
 >
 > v3: - fixed the extent merge loop in discard_atom()
 >
 > v4: - squashed fix-ups into the main patch (with exception of=20
reiser4_debug())
 > - fixed bug in usage of division ops discovered while building on AR=
M
 >
 > v5: - squashed mount option into the main patch
 > - refactor based on discussion (see commit msg)
 > - splitted off blocknr_list code
 > - replaced ->discard_set with ->delete_set and ->aux_delete_set
 >
 > Ivan Shapovalov (4):
 > reiser4: make space_allocator's check_blocks() reusable.
 > reiser4: add an implementation of "block lists", splitted off the=20
discard code.
 > reiser4: add reiser4_debug(): a conditional equivalent of reiser4_lo=
g().
 > reiser4: discard support: initial implementation using linked lists.
 >
 > fs/reiser4/Makefile | 2 +
 > fs/reiser4/block_alloc.c | 49 ++---
 > fs/reiser4/block_alloc.h | 14 +-
 > fs/reiser4/blocknrlist.c | 315 ++++++++++++++++++++++++++++++
 > fs/reiser4/debug.h | 4 +
 > fs/reiser4/dformat.h | 2 +
 > fs/reiser4/discard.c | 247 +++++++++++++++++++++++
 > fs/reiser4/discard.h | 31 +++
 > fs/reiser4/forward.h | 1 +
 > fs/reiser4/init_super.c | 2 +
 > fs/reiser4/plugin/space/bitmap.c | 84 +++++---
 > fs/reiser4/plugin/space/bitmap.h | 2 +-
 > fs/reiser4/plugin/space/space_allocator.h | 4 +-
 > fs/reiser4/super.h | 4 +-
 > fs/reiser4/txnmgr.c | 125 +++++++++++-
 > fs/reiser4/txnmgr.h | 63 +++++-
 > fs/reiser4/znode.c | 9 +-
 > 17 files changed, 884 insertions(+), 74 deletions(-)
 > create mode 100644 fs/reiser4/blocknrlist.c
 > create mode 100644 fs/reiser4/discard.c
 > create mode 100644 fs/reiser4/discard.h
 >
 > Also I would like if this code could be given a review. :)
 >
 >
 > Great! Looks nice for me, thanks!
 > There are 2 issues, though...
 >
 > 1) kmalloc/kfree a huge number of 32-byte chunks (blocknr_list=20
entries) is
 > suboptimal. There is a special low-level memory allocator for such=20
purposes.
 > Take a look how we initialize so-called "slab cache" for jnodes=20
(_jnode_slab),
 > atoms (_atom_slab), etc, and allocate memory for them=20
(kmem_cache_alloc()).
 >
 > 2) A lot of blocknr_list entries are allocated at flush time, when=20
the high-level
 > allocator (txmod.c) makes "relocation decisions" (especially when=20
txmod=3Dwa).
 > The problem is that the flush (with the following commit) usually is=
=20
the file system
 > response to memory pressure notifications, when additional memory=20
allocation
 > is not desirable.
 >
 > I think that with the fixed (1) we'll include the discard support (i=
f=20
everything will
 > be OK in the next 1-2 weeks).
 >
 > As to (2): that is a common problem of all Linux subsystems which=20
want memory
 > to free memory. It is unresolvable, however, we can improve the=20
situation. It
 > would be nice to implement a per-atom pool of memory (as a list of=20
kmalloc-ed
 > buffers with "cursors") with an optional possibility to pre-allocate=
=20
1-2 such buffers
 > at atom initialization time. But this is for the future...
 >
 > I don't see other urgent improvements. Yes, overall scalability of=20
rb-trees is better,
 > as we found, however, merging rb-trees is more expensive, plus atom'=
s=20
fusion
 > is not a background process, so it can lead to performance drop.=20
There are
 > rb-trees with fingers, however I haven't seen their implementation o=
n=20
C language
 > (it can be not so simple).
 >
 > Thanks!
 > Edward.
 >
 > --
 > To unsubscribe from this list: send the line "unsubscribe=20
reiserfs-devel" in
 > the body of a message to majordomo@vger.kernel.org
 > More majordomo info at http://vger.kernel.org/majordomo-info.html
 >

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
