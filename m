From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Block corruption
Date: Tue, 08 Jun 2004 18:12:26 +0400
Message-ID: <1086703946.1830.96.camel@tribesman.namesys.com>
References: <s0c5dcfa.013@allshare.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19086-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <s0c5dcfa.013@allshare.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Snare <asnare@allshare.nl>
Cc: reiserfs-list@namesys.com, Paul Wagland <PWagland@allshare.nl>

Hello

On Tue, 2004-06-08 at 17:36, Andrew Snare wrote:
> Hi,
> 
> After a few 2.6.6 oopsen and --rebuild-trees on some filesystems, we've
> still got some bad-block errors that are proving troublesome. In
> particular, we appear to have 3 bad blocks:
> 
> vs-5150: search_by_key: invalid format found in block 5963192. Fsck?
> vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to
> find stat data of [52570 52653 0x0 SD]
> vs-5150: search_by_key: invalid format found in block 5946544. Fsck?
> vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to
> find stat data of [46770 46771 0x0 SD]
> vs-5150: search_by_key: invalid format found in block 10058201. Fsck?
> vs-13070: reiserfs_read_locked_inode: i/o failure occurred trying to
> find stat data of [111684 111687 0x0 SD]
> 
> It's a hardware RAID-5 configuration that has no errors, so we know
> it's not a hardware problem; this points to corruption in one or more of
> our 11 reiserfs filesystems.
> 
> Is it possible to:
> 
> 1) Work out which of the 11 filesystems these errors are referring to?
> Preferably while the system is mounted. I see a block number, but
> several of our filesystems are large enough to have a block number that
> big.

Well, reiserfs needs to include device name into its warnings
Until it is not done you might want to do

find /mountpoint -inum 52653 
for each of your reiserfs filesystem.

> 2) Work out which directory/file is corrupted? In the past whenever we
> did a --rebuild-tree we ended up with quite a lot of stuff in
> lost+found, so we'd like to try and work out where it's coming from if
> possible.
> 

the same find command should find those files.

Even better, find /mountpoint will say "Permission denied" for all files
unreachable on a filesystem

ALso, reiserfs may store more than one file in a node. So, few files may
be unreachable

> Thanks in advance,
> 
>  - Andrew Snare
> 

