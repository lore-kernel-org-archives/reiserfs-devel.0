From: Vijayan Prabhakaran <pvijayan@gmail.com>
Subject: Bug in writeback mode
Date: Wed, 18 Aug 2004 14:28:59 -0500
Message-ID: <d68fdf7d040818122869621552@mail.gmail.com>
Reply-To: Vijayan Prabhakaran <pvijayan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20384-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: vijayan@cs.wisc.edu

Hi,

I'm testing the different journaling modes of Reiserfs and I came
across the following bug in writeback mode.

When a file block is overwritten synchronously, two blocks should get written:

1. The file block itself.
2. The file's stat info block - the one which contains the modification time.

Since the block is overwritten no other attributes (like size) of the
file changes. Only the time stamps have to be updated.

The problem is that the stat block is not getting written in writeback
mode - even after a fsync!

In ordered mode, everything works properly. That is, when I issue
fsync the following happens in ordered mode:

1. user process issues fsync
2. file block written to its fixed location
3. journal descriptor block is written to the journal
4. file's stat block is written to the journal
5. journal commit block is written to the journal
6. user process returns from fsync

In writeback mode, the stat block gets written only in the first
fsync. For later fsyncs, the following events happen:

1. user process issues fsync
2. file block written to its fixed location
3. user process returns from fsync

That is, in writeback mode, the file's stat data is not updated.

I also verified this by running a small workload that did:

1. write to a file synchronously
2. cause a file system failure
3. remount the file system

After the file system remount I noticed that the modification time of
the file was not updated in writeback mode.

Note that this does not affect the consistency of the file system as
all the data are still accessible correctly. But, some applications
like 'make', which depends on the modification time stamp will fail.

I'm using reiserfs from linux 2.4.25 with data journaling patch.

Can someone please take a look at this and see if this bug really exists ?

I appreciate any help regarding this.

thanks,
Vijayan
