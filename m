From: <doiggl@velocitynet.com.au>
Subject: patchset query re 01-29
Date: Wed, 21 Jan 2015 19:34:58 +1100
Message-ID: <b29977898271586de152261a8905ef39@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jeffm@suse.com
Cc: reiserfs-devel@vger.kernel.org

Hello,
Is this patch available to use [1]
Does the patch apply to
https://build.opensuse.org/package/show/openSUSE:13.2/reiserfs
Just Asking.
Cheers Glenn


[1]details
http://www.spinics.net/lists/reiserfs-devel/msg03814.html

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
