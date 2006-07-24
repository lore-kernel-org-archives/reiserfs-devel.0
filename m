From: Erik Mouw <erik@harddisk-recovery.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Mon, 24 Jul 2006 14:37:05 +0200
Message-ID: <20060724123705.GA18904@harddisk-recovery.com>
References: <44C12F0A.1010008@namesys.com> <44C4813E.2030907@namesys.com> <20060724102508.GA26553@merlin.emma.line.org> <200607241334.12218.chrivers@iversen-net.dk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932135AbWGXMhK@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200607241334.12218.chrivers@iversen-net.dk>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Iversen <chrivers@iversen-net.dk>
Cc: Hans Reiser <reiser@namesys.com>, lkml@lpbproductions.com, Jeff Garzik <jeff@garzik.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Mon, Jul 24, 2006 at 01:34:11PM +0200, Christian Iversen wrote:
> On Monday 24 July 2006 12:25, Matthias Andree wrote:
> > The bottom line is reiserfs 3.6 imposes practial limits that ext3fs
> > doesn't impose and that's reason enough for an administrator not to
> > install reiserfs 3.6. Sorry.
> 
> And what do you do if you, say, run of of inodes on ext3? Do you think the 
> users will care about that?

From what I've seen from our customers, that never happens. Yes, there
are sometimes people with a million inodes in use, and we've seen four
million once, but that's never been a problem, even not with a huge
mail server with thousands of users having mailboxes in maildir format.

We usually limit our own filesystems to 12 million inodes and it's
never been a problem to store files from our customers.

> Or what if the number of files in your mail queue 
> or proxy cache* become large enough for your fs operations to slow to a 
> crawl?

Not a problem anymore with htree dirextory indexing. If it's not yet
enabled (dumpe2fs the filesystem and look for the "dir_index" feature),
enable it with:

  tune2fs -O dir_index /dev/whatever
    
After the next mount the filesystem will use it for new directories. To
optimize existing directories, run e2fsck -D.


Erik

-- 
+-- Erik Mouw -- www.harddisk-recovery.com -- +31 70 370 12 90 --
| Lab address: Delftechpark 26, 2628 XH, Delft, The Netherlands
