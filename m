From: Asheesh Laroia <asheesh@asheesh.org>
Subject: Failed conversion -> undelete loopback file?
Date: Wed, 14 Apr 2004 08:04:19 -0400 (EDT)
Message-ID: <Pine.LNX.4.58.0404140752140.32161@renaissance.laroia.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17925-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I used the convertfs toolkit from http://tzukanov.narod.ru/convertfs/ to
convert my reiserfs filesystem to ext3.  I wanted to do this because the
kernel I had installed doesn't support reiserfs.

So I booted of the MEPIS Live CD to do the conversion.

So the first time I tried, it created an ext3 filesystem full of errors,
but since the process died early, it didn't delete any source files.  I
deleted the loopback file it created and ran reiserfsck 3.6.14, which told
to me rebuld-tree, so I did.

I then tried again.  I got an error on unmount, but the process seemed to
have finished.  So I rebooted back into MEPIS.

Now on mount, my reiserfs partition said:

Using r5 hash to sort names
Removing [2 11 0x0 SD]...done
There were 1 uncompleted unlinks/truncates. Completed.

That deletion took a long time, so it probably just deleted the loopback
ext3 filesystem.  The reiserfs partition now contains no directories or
files.  The partition shows 33MB used (out of 50GB).

But a quick look inside ("less -f /dev/hdb6") shows my data are still
around somewhere.

Is it possible to undo that deletion of [2 11 0x0 SD]?  What should I
consider?

Thanks all.  This is extremly distressing.

-- Asheesh.
