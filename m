From: <doiggl@velocitynet.com.au>
Subject: reiserfs cleanup patchset
Date: Thu, 05 Feb 2015 20:54:11 +1100
Message-ID: <8c0c2a800dee38ccbf2849fd6e9c37aa@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jeffm@suse.com
Cc: reiserfs-devel@vger.kernel.org

Hello Jeff,
Is there a .patch file available which covers the 1 to 29 reiserfs
patchset

-Does it apply to
https://build.opensuse.org/package/show/openSUSE:Factory/reiserfs or
upstream code ?

Just asking.
I use reiserfs on a partition.
No problems encountered with 3.6.24-x

Other details:
# rpm -qa |grep -i reiserfs |sort
libreiserfs-0_3-0-0.3.0.5-164.1.2.x86_64
libreiserfscore0-3.6.24-2.2.1.x86_64
reiserfs-3.6.24-2.2.1.x86_64

debugreiserfs-fix-use-after-free-while-closing-log 	1.18 KB
reiserfs.changes 	16.3 KB
reiserfs.spec 	2.96 KB
reiserfsprogs-3.6.24-22-g57eac84.tar.bz2 	221 KB
silent-rules.patch 	845 Bytes 

--Glenn

from http://www.spinics.net/lists/reiserfs-devel/msg03814.html

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

