From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Sun, 13 Oct 2002 09:46:45 -0600
Message-ID: <20021013154645.GM3045@clusterfs.com>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain> <200210121052.22603.bofh@coker.com.au> <20021012150028.G14731@vestdata.no> <200210121600.39712.bofh@coker.com.au> <3DA89A37.2070801@namesys.com> <20021012222950.GK3045@clusterfs.com> <3DA8CAF5.7050203@namesys.com> <20021013063809.GL3045@clusterfs.com> <3DA97993.4090403@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11675-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DA97993.4090403@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Russell Coker <bofh@coker.com.au>, Ragnar ? <reiserfs@ragnark.vestdata.no>, reiserfs-list@namesys.com

On Oct 13, 2002  17:48 +0400, Hans Reiser wrote:
> Andreas Dilger wrote:
> >While it is _possible_ that you have object based storage on a drive,
> >the reality is that the object storage targets (OSTs henceforth) are
> >in practise really large storage systems, like a IBM Shark, or a Linux
> >box with a few TB of disk and RAID and LVM, and most importantly have a
> >regular filesystem like ext3 or reiserfs on top of all that storage to
> >do all of the real storage management.
> >
> >The benefit of an object based netowrk protocol like Lustre is that the
> >client is free from all of the details of file and block allocation, and
> >the OST filesystem can do all of this.  Since each OST has an independent
> >filesystem, it can handle all of the locking/threading for block and
> >inode allocation locally.  It can also do this in any way it sees fit,
> >so it actually allows for MORE innovation at the OST filesystem level
> >than other distributed filesystems.
> >
> >The Lustre network protocol could be considered akin to a network
> >version of the Linux VFS - the Lustre client (like a Linux process)
> >is doing I/O on a file, but the Lustre OST (like a Linux filesystem)
> >is free to implement the details of storing data within that file as
> >it sees fit.  Similarly, the metadata server (MDS) is free to store
> >filenames, EA data, etc however it wants.
> >
> >Lustre, like the VFS, needs locking to ensure multiple processes do
> >not do conflicting things.  The Lustre locking code actually is only
> >doing per-node locking, and trusts the Linux VFS to do the right thing
> >internally, so we leverage as much of Al Viro's work in this complex
> >area as we possibly can ;-).
>
> Ok, this makes some sense.  How does Seagate feel about that view, I am 
> curious?

It is irrelevant how they feel, since they stopped funding our project
in 2000 after we had barely completed the initial prototype.  Even so,
(back when we were looking at "smart" individual disks that presented
an OBD interface over ethernet), the disks themselves would have been
running Linux internally, with the block and inode allocation half of
the filesystem running there.

Since it was a lot of additional effort to maintain the split filesystem
code ourselves, and also less flexible, we implemented an "obdfilter"
OBD driver, which stack on top of a regular Linux filesystem at the VFS
layer, and basically replaces the file I/O syscall interface with a
network RPC layer.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

