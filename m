From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [ext3-users] To compare Linux journalised filesystem, part II.
Date: Thu, 24 Oct 2002 11:08:26 -0600
Sender: linux-xfs-bounce@oss.sgi.com
Message-ID: <20021024170826.GI28822@clusterfs.com>
References: <3DB823AA.6010405@eprocess.fr>
Mime-Version: 1.0
Return-path: <linux-xfs-bounce@oss.sgi.com>
Content-Disposition: inline
In-Reply-To: <3DB823AA.6010405@eprocess.fr>
Errors-to: linux-xfs-bounce@oss.sgi.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabien Combernous <fcombernous@eprocess.fr>
Cc: ext3-users@redhat.com, jfs-discussion <jfs-discussion@www-124.southbury.usf.ibm.com>, reiserfs <reiserfs-list@namesys.com>, linux-xfs@oss.sgi.com

On Oct 24, 2002  18:45 +0200, Fabien Combernous wrote:
> +--------+------------------------------------------------------------------+
> | quotas | Again "Y" is not aqual. ext3 accept quota only on data-journaled |
> |        | filesystems, but all other journaled filesystem don't have data  |
> +--------+------------------------------------------------------------------+

Granted that I have never used quotas, so it is possible that I
am incorrect.  However, my understanding is that yes, you do need
data-journaled quota files to ensure that your quota tables don't miss
some operations after a crash.  However, you can separately select
data journaling for files in ext3 (via chattr), even if the rest of
the filesystem is using data=ordered (the default).

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/


