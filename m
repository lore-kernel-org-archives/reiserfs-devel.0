From: sankarshana rao <san_wipro@yahoo.com>
Subject: Re: reiserfs_create: no enough blocks on device
Date: Mon, 2 Aug 2004 15:07:00 -0700 (PDT)
Message-ID: <20040802220700.68291.qmail@web50906.mail.yahoo.com>
References: <20040802215322.GB1912@schnapps.adilger.int>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19925-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040802215322.GB1912@schnapps.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@clusterfs.com>
Cc: reiserfs-list@namesys.com

I tried now with block count of 50000 (50 MB)..Still I
get the same error.
The machine is a mips running timesys linux..

Any clues??

Thx

--- Andreas Dilger <adilger@clusterfs.com> wrote:

> On Aug 02, 2004  14:23 -0700, sankarshana rao wrote:
> > I am trying to create a reiserfs filesystem using
> the
> > command 
> > 'mkreiserfs  /dev/loop/0 100'.
> > It always gives me the error 
> > "reiserfs_create: no enough blocks on device".
> > 
> > I tried altering the block size, but it would not
> > help..
> 
> You can't make a reiserfs filesystem smaller than
> about 40MB.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://members.shaw.ca/adilger/            
> http://members.shaw.ca/golinux/
> 
> 

> ATTACHMENT part 2 application/pgp-signature 




		
_______________________________
Do you Yahoo!?
Express yourself with Y! Messenger! Free. Download now. 
http://messenger.yahoo.com
