From: Oleg Drokin <green@namesys.com>
Subject: Re: [BUG][trivial] atime not set on directory reads
Date: Fri, 14 Jun 2002 09:05:38 +0400
Message-ID: <20020614090538.A22474@namesys.com>
References: <20020613213530.GN682@clusterfs.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10735-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020613213530.GN682@clusterfs.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: adilger@clusterfs.com

Hello!

   Can you please state kernel version? Bugreports are very useful
   when combined with version of kernel used.

   Anyway problem looking like exactly what you describe was fixed in
   2.4.19-pre3 or thereabout, so can you please also test with
   some recent 2.4.19-pre kernel?

   Thank you for the report.

Bye,
    Oleg
On Thu, Jun 13, 2002 at 03:35:30PM -0600, Andreas Dilger wrote:
> Hello reiserfs folks,
> I'm just in the process of running some POSIX conformance tests on
> Linux (test available at http://www.opengroup.org/testing/lsb-fhs/)
> and reiserfs fails one test where ext2/ext3 are passing.
> 
> The test checks whether atime is updated on a directory if you do a
> directory lookup.  I imagine that it is as simple as adding a call
> UPDATE_ATIME(inode) to the reiserfs directory lookup.  This can, of
> course, be turned off at runtime via the "noatime" mount option (I
> think newer kernels also have a newer "nodiratime").
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> http://sourceforge.net/projects/ext2resize/
> 
