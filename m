From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: tests to see how ext3 reiserfs 3.6 and jfs survive disk errors.
Date: Wed, 31 Mar 2004 09:28:14 -0700
Sender: ext3-users-bounces@redhat.com
Message-ID: <20040331162814.GP1177@schnapps.adilger.int>
References: <32823.193.110.218.57.1080733440.squirrel@mail.vamo.bg>
	<1080734403.16245.159.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <ext3-users-bounces@redhat.com>
Content-Disposition: inline
In-Reply-To: <1080734403.16245.159.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/ext3-users>,
	<mailto:ext3-users-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/ext3-users>
List-Post: <mailto:ext3-users@redhat.com>
List-Help: <mailto:ext3-users-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/ext3-users>,
	<mailto:ext3-users-request@redhat.com?subject=subscribe>
Errors-To: ext3-users-bounces@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com, Ivan Ivanov <ivandi@vamo.bg>, ext3-users@redhat.com

On Mar 31, 2004  16:00 +0400, Vladimir Saveliev wrote:
> On Wed, 2004-03-31 at 15:44, Ivan Ivanov wrote:
> > I made some tests to see how ext3 reiserfs 3.6 and jfs survive disk
> > errors.
> > 
> > The test is simple:
> > format a partition, copy the kernel source, unmount and and do ?dd
> > if=/dev/zero of=/dev/hdd bs=512 count=100000 seek=30000? to simulate a
> > disk surface damage and then run fsck.
> > 
> > seek=30000 ? this must be the second half of journal in reiserfs and
> > ext3, for jfs I don't know
> > 
> 
> Well, not that I defend reiserfs's i/o error handling
> 
> But I do not think that your test is a fair one. You overwrote area
> where reiserfs stored metadata for data you copied into it. (not sure
> about jfs, it probably has the same problem). Do you want to try to
> overwrite ext3's inode tables?

Actually, with a 51MB write it is guaranteed to overwrite at least one
inode table somewhere in the filesystem (one inode table per 32MB of disk).
One of the reasons that ext2/ext3 can survive such actions is that the
location of the metadata is in a fixed location so even if everything is
overwritten it knows what is inode table, what is data blocks, etc.  This
makes ext3 less flexible (i.e. no dynamic inode allocation) but also more
robust.

> > jfs:
> > ----
> > total data loss, can't mount, fsck didn't helps
> > 
> > reiserfs:
> > ---------
> > doing ?reiserfsck ?rebuild-tree? moves all recovered data in lost+found,
> > but information is almost unusable
> > 
> > ext3:
> > -----
> > after ?fsck.ext3 -f -y? almost everything was usable, directory
> > structure was untouched, some files was moved in lost+found, but in
> > general
> > everything was usable.
> > 
> > My opinion:
> > I can't use anything but ext2/3 in a system where there is no RAID ? 99%
> > of desktops and most of web and mail servers.

If you have time, you may want to try overwriting some other parts of the
filesystem, just to see if the results change.  I don't think it will make
a huge difference in the end, but it might.  Note that 51MB is a large
fraction of the size of a Linux kernel so you might end up overwriting 1/4
of all the data.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
