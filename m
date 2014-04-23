From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 00/29] reiserfs cleanup patchset
Date: Wed, 23 Apr 2014 10:00:33 -0400
Message-ID: <20140423140033.704113918@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Jan Kara <jack@suse.cz>, Dave Jones <davej@redhat.com>

Hi all -

I've had this patchset kicking around for a while. After a
conversation this past week about code that was horrible to read
(using reiserfs's balance_leaf as the primary example) and seeing
that Dave Jones had scratched a bit of an itch, I decided it was time
to resync and push it out so I don't have to update it forever.

BTW, as I'm basically the only person with substantial patches against
reiserfs, I'm 100% ok with disrupting context to this extent. :)

This set consists of 29 patches in a few areas.

1 - Convert the commit workqueue to a per-fs workqueue
2 - Clean up ugly accessor macros to use more readable names
3 - Clean up comments to use the normal kernel style
4 - Remove the unused nblocks argument from journal_end
5 - Remove superblock argument from journal_end (it's in the trans handle)
6 - Remove superblock argument from journal_mark_dirty (see #5)
7 - Remove blocks argument from journal_join (it's always 1)
8 - Remove leading whitespace from labels
9 - Remove unnecessary parents
10 - Clean up dirent creation
11 - Clean up hash detection
12-29 - Clean up balance_leaf - This 2500-line function goes through
        6 easily distinguishable stages, each with several sub-parts. The
	patch set splits up the stages and then reformats them to keep
	the split as obvious as possible. The final result is a whole
	lot easier to follow and easier on the eyes.

-Jeff

