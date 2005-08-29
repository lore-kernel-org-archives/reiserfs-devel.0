From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: fs_mark benchmark - update
Date: Mon, 29 Aug 2005 09:57:43 -0400
Message-ID: <1125323863.5544.34.camel@localhost.localdomain>
References: <3257ddd0050825050117ead2ba@mail.gmail.com>
	 <430DC64D.9010205@namesys.com> <4313006C.9040502@emc.com>
	 <Pine.LNX.4.63.0508291436100.29195@alpha.polcom.net>
	 <1125319246.5544.19.camel@localhost.localdomain>  <43130DC1.20105@emc.com>
	 <1125322484.5544.23.camel@localhost.localdomain> <431311A1.8030906@emc.com>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25691-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431311A1.8030906@emc.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ric Wheeler <ric@emc.com>
Cc: Grzegorz Kulewski <kangur@polcom.net>, "Vladimir V. Saveliev" <vs@namesys.com>, Sandeep Tyagi <sandeepktyagi@gmail.com>, okuyamak@dd.iij4u.or.jp, reiserfs <reiserfs-list@namesys.com>

On Mon, 2005-08-29 at 09:46 -0400, Ric Wheeler wrote:
> I use it to benchmark (mostly) synchronous file writing.
> 
> For example, a typical run might be to completely fill a file system 
> with 50k files using the default (write one file, fsync one file) method 
> and then compare that run to one which uses a varying number of 
> concurrent threads.
> 
> Data journal mode is slightly faster for small files, but is twice as 
> slow for large files (as expected).
> 
> We have observed the best results in 2.6 reiserfs3 when running 4-8 
> threads per disk, using multiple subdirectories.  In 2.4, using a single 
> subdirectory on reiser was better than using multiple subdirectories.
> 
> The validation of the write barrier case test is a simple one - if you 
> write single threaded, then a properly configured file system with write 
> barrier enabled should be some reasonable match to the speed of the 
> disk.  For us, that is typically around 40 50k files/sec with S-ATA 
> drives or P-ATA drives.
> 
> It is also interesting to compare reiserfs vs ext3 when writing single 
> threaded across the life span of a file system - reiserfs typically 
> beats ext3 for most cases, but ext3 eventually catches up as the 
> percentage used grows.
> 

this is interesting. looks like a file system aging problem. does this
because of the fragmentation?

> I hope to rerun on reiserfs4 and the new ext3 in the next few weeks,
> 

looking forward to seeing.

what u mean new ext3?

thanks!

ming


> Regards,
> 
> Ric
> 
> 
> Ming Zhang wrote:
> 
> >have a quick check on u site and it is interesting.
> >
> >but this is more like a validation tool instead of performance benchmark
> >tool. or your code will report how many sync IOPS it gets and then we
> >validate with our own HW spec.
> >
> >i should ask this after running the code i guess. :) but eager to know
> >answer.
> >
> >ming
> >
> >
> >
> >  
> >
> >

