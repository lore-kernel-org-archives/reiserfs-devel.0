From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: tests to see how ext3 reiserfs 3.6 and jfs survive disk errors.
Date: Wed, 31 Mar 2004 16:00:03 +0400
Message-ID: <1080734403.16245.159.camel@tribesman.namesys.com>
References: <32823.193.110.218.57.1080733440.squirrel@mail.vamo.bg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17619-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <32823.193.110.218.57.1080733440.squirrel@mail.vamo.bg>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Ivanov <ivandi@vamo.bg>
Cc: ext3-users@redhat.com, reiserfs-list@namesys.com

Hello

On Wed, 2004-03-31 at 15:44, Ivan Ivanov wrote:
> I made some tests to see how ext3 reiserfs 3.6 and jfs survive disk
> errors.
> 
> The test is simple:
> format a partition, copy the kernel source, unmount and and do ?dd
> if=/dev/zero of=/dev/hdd bs=512 count=100000 seek=30000? to simulate a
> disk surface damage and then run fsck.
> 
> seek=30000 ? this must be the second half of journal in reiserfs and
> ext3, for jfs I don't know
> 

Well, not that I defend reiserfs's i/o error handling

But I do not think that your test is a fare one. You overwrote area
where reiserfs stored metadata for data you copied into it. (not sure
about jfs, it probably has the same problem). Do you want to try to
overwrite ext3's inode tables?

> Result:
> 
> jfs:
> ----
> total data loss, can't mount, fsck didn't helps
> 
> reiserfs:
> ---------
> doing ?reiserfsck ?rebuild-tree? moves all recovered data in lost+found,
> but information is almost unusable
> 
> ext3:
> -----
> after ?fsck.ext3 -f -y? almost everything was usable, directory
> structure was untouched, some files was moved in lost+found, but in
> general
> everything was usable.
> 
> My opinion:
> I can't use anything but ext2/3 in a system where there is no RAID ? 99%
> of desktops and most of web and mail servers.
> 
> Cheers
> Ivan
> 
> 
> 
> 
> 

