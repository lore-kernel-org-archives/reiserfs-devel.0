From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: fsck.reiser4 v. 0.51 problem
Date: Wed, 25 Feb 2004 22:12:21 +0300
Message-ID: <20040225191220.GB1846@backtop.namesys.com>
References: <200402251903.44612.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16936-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200402251903.44612.henning-04@die.informatik.uni-siegen.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Cc: reiserfs-list@namesys.com

On Wed, Feb 25, 2004 at 07:03:44PM +0000, Henning Westerholt wrote:
> Hello all,
> 
> i try the latest snapshot of the reiser4 code with 2.6.3 on my system. I 
> create a new reiser4 partition with mkfs version 0.51.
> 
> After one hour the compilation of xfree on this fs aborts with a linker error. 

what was the error?  does the log contain something looks like reiser4 errors
messages?

> I try to fix the filesystem with fsck, it complains about a fatal corruption 
> and suggested the option "build-fs". 
> 
> Fsck with --build-fs aborts with the following error for me:

Ok. We will concentrate on things which are different in your tests and our.
At least we don't use fsck so often. 

Thanks for the report.
-- 
Alex.
