From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: rebuildfs
Date: Tue, 5 Aug 2003 22:12:59 +0400
Message-ID: <200308052212.59461.vitaly@namesys.com>
References: <E5A63F34D141D111A6F4080009D70ACA346D64@imkedv_pdc> <200308051951.38602.vitaly@namesys.com> <20030805114701.W4479@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15159-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030805114701.W4479@schatzie.adilger.int>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Thorsten Mauch <mauch@imkenberg.de>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

> > If dd without conv=noerror fails for you -- you have problems with
> > reading some blocks -- you should use dd_rescue instead as dd
> > forgets to create holes in the target image when cannot read some
> > block. This explains garbage in files in your case.
>
> This same effect is available with normal dd via "conv=sync,noerror".

I suggested dd_rescue as some our tests with dd showed that it does 
not create the hole in the target when fails to read some block. Although 
I am not sure about "sync" option. Do you mean that we could just miss 
"sync" option and got wrong result? I will test it again.

-- 
Thanks,
Vitaly Fertman
