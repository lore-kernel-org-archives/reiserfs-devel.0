From: Hans Reiser <reiser@namesys.com>
Subject: Re: [BUG][trivial] atime not set on directory reads
Date: Fri, 14 Jun 2002 02:45:38 +0400
Message-ID: <3D092092.50500@namesys.com>
References: <20020613213530.GN682@clusterfs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10733-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: reiserfs-list@namesys.com

Andreas Dilger wrote:

>Hello reiserfs folks,
>I'm just in the process of running some POSIX conformance tests on
>Linux (test available at http://www.opengroup.org/testing/lsb-fhs/)
>and reiserfs fails one test where ext2/ext3 are passing.
>
>The test checks whether atime is updated on a directory if you do a
>directory lookup.  I imagine that it is as simple as adding a call
>UPDATE_ATIME(inode) to the reiserfs directory lookup.  This can, of
>course, be turned off at runtime via the "noatime" mount option (I
>think newer kernels also have a newer "nodiratime").
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
I often have thoughts that we should have an atime option, and make 
noatime the default.....

Thanks for finding this, Oleg will respond in the morning...

-- 
Hans



