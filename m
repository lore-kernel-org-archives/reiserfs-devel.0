From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Calling stat with millions of files
Date: Tue, 08 Jun 2004 14:03:16 +0400
Message-ID: <1086688996.1829.79.camel@tribesman.namesys.com>
References: <Pine.LNX.4.58.0406071735290.30177@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19080-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0406071735290.30177@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ross Skaliotis <mross@rs-net.org>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2004-06-08 at 01:54, Ross Skaliotis wrote:
> We have a backup system (backupPC) that is responsible for backing up
> millions of files and holding over 2 TB of data. The backup system saves
> space by creating hard links where it can. This actually reduces the total
> size down to 200 GB, however there are still millions of files/hard links.
> 
> What does this have to do with reiserfs? Well, the partition runs reiserfs
> 3.6. Over the course of a few months (and the addition of millions more
> files/hard links) the performance of the filesystem has become painfully
> slow.
> 
> In a directory of ~1000 files, running 'ls -l' or 'stat *' takes 45
> seconds to complete (assuming nothing is previously cached). We are using
> the r5 hash, and mount the filesystem with noatime. No one directory has
> (or will ever have) more than about 2000 files and hard links inside.

The problem is probably that reiserfs allocates on-disk inodes (reiserfs
calls it stat data) dynamically, so they get spread all over whole
filesystem. 

> Is this performance decrease when calling stat to be expected with
> increasing millions of files/hard links? Would XFS or another filesystem
> get around this somehow? 

I guess that filesystem which stores on-disk inodes groupped together
would perform better for this kind of workload.

> I'd rather not use reiserfs4, as this is a
> production backup server and needs to be as stable as possible.
> 
> Thanks very much for your help,
> 
> -Ross Skaliotis
> 

