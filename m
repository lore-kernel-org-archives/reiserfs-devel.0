From: <doiggl@velocitynet.com.au>
Subject: Re: [patch 00/29] reiserfs cleanup patchset
Date: Tue, 27 May 2014 19:23:33 +1000
Message-ID: <c71b9e18a0a450c18283867ed8d2663e@mail.velocitynet.com.au>
References: <20140423140033.704113918@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20140423140033.704113918@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

On Wed, 23 Apr 2014 10:00:33 -0400, Jeff Mahoney <jeffm@suse.com> wrote:
> Hi all -
> 
> I've had this patchset kicking around for a while. After a
> conversation this past week about code that was horrible to read
> (using reiserfs's balance_leaf as the primary example) and seeing
> that Dave Jones had scratched a bit of an itch, I decided it was time
> to resync and push it out so I don't have to update it forever.
> 
> BTW, as I'm basically the only person with substantial patches against
> reiserfs, I'm 100% ok with disrupting context to this extent. :)
> 
> This set consists of 29 patches in a few areas.
> 
> 1 - Convert the commit workqueue to a per-fs workqueue
> 2 - Clean up ugly accessor macros to use more readable names
> 3 - Clean up comments to use the normal kernel style
> 4 - Remove the unused nblocks argument from journal_end
> 5 - Remove superblock argument from journal_end (it's in the trans
handle)
> 6 - Remove superblock argument from journal_mark_dirty (see #5)
> 7 - Remove blocks argument from journal_join (it's always 1)
> 8 - Remove leading whitespace from labels
> 9 - Remove unnecessary parents
> 10 - Clean up dirent creation
> 11 - Clean up hash detection
> 12-29 - Clean up balance_leaf - This 2500-line function goes through
>         6 easily distinguishable stages, each with several sub-parts.
The
> 	patch set splits up the stages and then reformats them to keep
> 	the split as obvious as possible. The final result is a whole
> 	lot easier to follow and easier on the eyes.
> 
> -Jeff
> 
Hello Jeff,
I do not see a patch 03/29 in the list.
Is this correct ?
--Glenn

I see:
[patch 01/29] reiserfs: use per-fs commit workqueues, Jeff Mahoney
[patch 02/29] reiserfs: cleanup, rename key and item accessors to more
friendly names, Jeff Mahoney
[patch 04/29] reiserfs: cleanup, remove nblocks argument from journal_end,
Jeff Mahoney
[patch 05/29] reiserfs: cleanup, remove sb argument from journal_end, Jeff
Mahoney
[patch 06/29] reiserfs: cleanup, remove sb argument from
journal_mark_dirty, Jeff Mahoney
[patch 07/29] reiserfs: cleanup, remove blocks arg from journal_join, Jeff
Mahoney
[patch 08/29] reiserfs: cleanup, remove leading whitespace from labels,
Jeff Mahoney
[patch 09/29] reiserfs: cleanup, remove unnecessary parens, Jeff Mahoney
[patch 10/29] reiserfs: cleanup, remove unnecessary parens in dirent
creation, Jeff Mahoney
[patch 11/29] reiserfs: cleanup, make hash detection saner, Jeff Mahoney
[patch 12/29] reiserfs: balance_leaf refactor, reformat balance_leaf
comments, Jeff Mahoney
[patch 13/29] reiserfs: balance_leaf refactor, move state variables into
tree_balance, Jeff Mahoney
[patch 14/29] reiserfs: balance_leaf refactor, pull out
balance_leaf_insert_left, Jeff Mahoney
[patch 15/29] reiserfs: balance_leaf refactor, pull out
balance_leaf_paste_left, Jeff Mahoney
[patch 16/29] reiserfs: balance_leaf refactor, pull out
balance_leaf_insert_right, Jeff Mahoney
[patch 17/29] reiserfs: balance_leaf refactor, pull out
balance_leaf_paste_right, Jeff Mahoney
[patch 18/29] reiserfs: balance_leaf refactor, pull out
balance_leaf_new_nodes_insert, Jeff Mahoney
[patch 19/29] reiserfs: balance_leaf refactor, pull out
balance_leaf_new_nodes_paste, Jeff Mahoney
[patch 20/29] reiserfs: balance_leaf refactor pull out
balance_leaf_finish_node_insert, Jeff Mahoney
[patch 21/29] reiserfs: balance_leaf refactor, pull out
balance_leaf_finish_node_paste, Jeff Mahoney
[patch 22/29] reiserfs: balance_leaf refactor, pull out balance_leaf{left,
right, new_nodes, finish_node}, Jeff Mahoney
[patch 23/29] reiserfs: balance_leaf refactor, format
balance_leaf_insert_left, Jeff Mahoney
[patch 24/29] reiserfs: balance_leaf refactor, format
balance_leaf_paste_left, Jeff Mahoney
[patch 25/29] reiserfs: balance_leaf refactor, format
balance_leaf_insert_right, Jeff Mahoney
[patch 26/29] reiserfs: balance_leaf refactor, format
balance_leaf_paste_right, Jeff Mahoney
[patch 27/29] reiserfs: balance_leaf refactor, format
balance_leaf_new_nodes_paste, Jeff Mahoney
[patch 28/29] reiserfs: balance_leaf refactor, format
balance_leaf_finish_node, Jeff Mahoney
[patch 29/29] reiserfs: balance_leaf refactor, split up
balance_leaf_when_delete, Jeff Mahoney

#Reference: http://www.spinics.net/lists/reiserfs-devel/
