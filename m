From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: rebuildfs
Date: Tue, 5 Aug 2003 11:47:01 -0600
Message-ID: <20030805114701.W4479@schatzie.adilger.int>
References: <E5A63F34D141D111A6F4080009D70ACA346D64@imkedv_pdc> <200308051951.38602.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15157-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200308051951.38602.vitaly@namesys.com>; from vitaly@namesys.com on Tue, Aug 05, 2003 at 07:51:38PM +0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Thorsten Mauch <mauch@imkenberg.de>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

On Aug 05, 2003  19:51 +0400, Vitaly Fertman wrote:
> On Tuesday 05 August 2003 19:30, Thorsten Mauch wrote:
> > Now i finised with the version 2.6.11.
> > I find now files that have exectly the creation time of thoose files i
> > seek. And at least
> > in one case the size is aslo resonalble. But the content is not like
> > expectet.
> > Is there a way to controll how the files are rebuild ? or is there
> > something that i
> > could do better ?
> 
> If dd without conv=noerror fails for you -- you have problems with 
> reading some blocks -- you should use dd_rescue instead as dd 
> forgets to create holes in the target image when cannot read some 
> block. This explains garbage in files in your case.

This same effect is available with normal dd via "conv=sync,noerror".

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

