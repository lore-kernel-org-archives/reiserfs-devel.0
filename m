From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Sun, 13 Oct 2002 17:48:03 +0400
Message-ID: <3DA97993.4090403@namesys.com>
References: <Pine.LNX.4.33L2.0210100853240.1670-100000@localhost.localdomain> <200210121052.22603.bofh@coker.com.au> <20021012150028.G14731@vestdata.no> <200210121600.39712.bofh@coker.com.au> <3DA89A37.2070801@namesys.com> <20021012222950.GK3045@clusterfs.com> <3DA8CAF5.7050203@namesys.com> <20021013063809.GL3045@clusterfs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11674-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Russell Coker <bofh@coker.com.au>, Ragnar ? <reiserfs@ragnark.vestdata.no>, reiserfs-list@namesys.com

Andreas Dilger wrote:

>On Oct 13, 2002  05:23 +0400, Hans Reiser wrote:
>  
>
>>Andreas Dilger wrote:
>>    
>>
>>>On Oct 13, 2002  01:55 +0400, Hans Reiser wrote:
>>>      
>>>
>>>>Someday not too long from now, it will look like one filesystem even 
>>>>though it is in multiple cases.  Whether that is in reiser5 or reiser6 
>>>>depends on what sponsors fund first.
>>>>        
>>>>
>>>you should take a look at Lustre - www.lustre.org.  We are basically
>>>already developing what you are suggesting - a distributed filesystem
>>>which is built atop two or more local filesystems.  The aggregate
>>>throughput of N lustre storage servers is basically N times the
>>>throughput of a single server (clients communicate directly with the
>>>storage targets, so the cross-sectional bandwidth in perfectly
>>>scalable on a switched network).
>>>
>>>Like Intermezzo, Lustre can be stacked on top of journaling local
>>>filesystems, so it would be possible to use reiserfs for both the
>>>metadata and storage targets.
>>>
>>>We are deploying on a 1000-node cluster early next year, and expect
>>>total throughput around 4GB/s (we have already made a limited test
>>>at 1.4GB/s) with 90TB of storage - on a 2.4 kernel.  Because we are
>>>using multiple separate filesystems, we are not hampered by the
>>>2TB block device limit, and we get all sorts of parallelisms that
>>>are not possible with a single large server.
>>>      
>>>
>>I really don't understand what is the advantage of object based disk 
>>storage.  It seems like its main effect is to prevent people from coming 
>>up with optimizations the drive manufacturer did not think of.  I don't 
>>at all understand these supposed metadata advantages.  We are lucky that 
>>we don't have in disk drives the sort of innovation inhibiting 
>>separation of compilers and CPUs that our compatriots in the language 
>>design business suffer from.  The more smarts that go into the drive, 
>>the more our field will ossify, unless they work closely with FS authors.
>>    
>>
>
>While it is _possible_ that you have object based storage on a drive,
>the reality is that the object storage targets (OSTs henceforth) are
>in practise really large storage systems, like a IBM Shark, or a Linux
>box with a few TB of disk and RAID and LVM, and most importantly have a
>regular filesystem like ext3 or reiserfs on top of all that storage to
>do all of the real storage management.
>
>The benefit of an object based netowrk protocol like Lustre is that the
>client is free from all of the details of file and block allocation, and
>the OST filesystem can do all of this.  Since each OST has an independent
>filesystem, it can handle all of the locking/threading for block and
>inode allocation locally.  It can also do this in any way it sees fit,
>so it actually allows for MORE innovation at the OST filesystem level
>than other distributed filesystems.
>
>The Lustre network protocol could be considered akin to a network
>version of the Linux VFS - the Lustre client (like a Linux process)
>is doing I/O on a file, but the Lustre OST (like a Linux filesystem)
>is free to implement the details of storing data within that file as
>it sees fit.  Similarly, the metadata server (MDS) is free to store
>filenames, EA data, etc however it wants.
>
>Lustre, like the VFS, needs locking to ensure multiple processes do
>not do conflicting things.  The Lustre locking code actually is only
>doing per-node locking, and trusts the Linux VFS to do the right thing
>internally, so we leverage as much of Al Viro's work in this complex
>area as we possibly can ;-).
>
>Cheers, Andreas
>--
>Andreas Dilger
>http://www-mddsp.enel.ucalgary.ca/People/adilger/
>http://sourceforge.net/projects/ext2resize/
>
>
>
>  
>
Ok, this makes some sense.  How does Seagate feel about that view, I am 
curious?

Hans


