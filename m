From: Steve Lord <lord@sgi.com>
Subject: Re: [reiserfs-list] Re: [ext3-users] To compare Linux journalised
	filesystem, part II.
Date: 24 Oct 2002 12:33:11 -0500
Sender: linux-xfs-bounce@oss.sgi.com
Message-ID: <1035480791.30513.5.camel@jen.americas.sgi.com>
References: <3DB823AA.6010405@eprocess.fr> 
	<20021024170826.GI28822@clusterfs.com>  <1035480451.30133.192.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-xfs-bounce@oss.sgi.com>
In-Reply-To: <1035480451.30133.192.camel@tiny>
Errors-to: linux-xfs-bounce@oss.sgi.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabien Combernous <fcombernous@eprocess.fr>
Cc: Chris Mason <mason@suse.com>, Andreas Dilger <adilger@clusterfs.com>, Fabien Combernous <fcombernous@eprocess.fr>, ext3-users@redhat.com, jfs-discussion <jfs-discussion@www-124.southbury.usf.ibm.com>, reiserfs <reiserfs-list@namesys.com>, linux-xfs@oss.sgi.com

On Thu, 2002-10-24 at 12:27, Chris Mason wrote:
> On Thu, 2002-10-24 at 13:08, Andreas Dilger wrote:
> > On Oct 24, 2002  18:45 +0200, Fabien Combernous wrote:
> > > +--------+------------------------------------------------------------------+
> > > | quotas | Again "Y" is not aqual. ext3 accept quota only on data-journaled |
> > > |        | filesystems, but all other journaled filesystem don't have data  |
> > > +--------+------------------------------------------------------------------+
> > 
> > Granted that I have never used quotas, so it is possible that I
> > am incorrect.  However, my understanding is that yes, you do need
> > data-journaled quota files to ensure that your quota tables don't miss
> > some operations after a crash.  However, you can separately select
> > data journaling for files in ext3 (via chattr), even if the rest of
> > the filesystem is using data=ordered (the default).
> 
> data journaling on the quota files is better.  Some quota updates (dqput
> calling commit_dquot) are done only by clear_inode(), which should
> happen outside the transaction and won't be grouped with the actual
> metadata change.
> 

XFS quota file updates are transactional with the original metadata
change which allocated or freed space. So while we do not have data
journalling, quota updates are journalled.

Steve

-- 

Steve Lord                                      voice: +1-651-683-3511
Principal Engineer, Filesystem Software         email: lord@sgi.com


