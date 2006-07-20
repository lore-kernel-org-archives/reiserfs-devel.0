From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: create very large file system
Date: Thu, 20 Jul 2006 02:26:46 -0400
Message-ID: <20060720062646.GA6174@schatzie.adilger.int>
References: <e9l7bh$134$1@sea.gmane.org> <200607191657.38644.zam@namesys.com>
Mime-Version: 1.0
Return-path: <ext3-users-bounces@redhat.com>
Content-Disposition: inline
In-Reply-To: <200607191657.38644.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/ext3-users>,
	<mailto:ext3-users-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/ext3-users>
List-Post: <mailto:ext3-users@redhat.com>
List-Help: <mailto:ext3-users-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/ext3-users>,
	<mailto:ext3-users-request@redhat.com?subject=subscribe>
Sender: ext3-users-bounces@redhat.com
Errors-To: ext3-users-bounces@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com, Mark F <mfaine@knology.net>, Ext3-users@redhat.com

On Jul 19, 2006  16:57 +0400, Alexander Zarochentsev wrote:
> On Wednesday 19 July 2006 16:10, Mark F wrote:
> > I've tried to create a large 5TB file system using both reiserfs and
> > ext3 and both have failed.
> 
> you might need to convert the partition table to GPT format for 
> supporting 2TB+ partitions.  it can be done by the gnu parted tool.

Or, for that matter, don't use a partition table at all, since this
adds an unhelpful offset to all the filesystem structures and can
hurt performance on RAID where the filesystem is trying to align IO
to RAID stripe boundaries.

Cheers, Andreas
--
Andreas Dilger
Principal Software Engineer
Cluster File Systems, Inc.
