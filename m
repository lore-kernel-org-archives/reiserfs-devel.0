From: Chris Mason <mason@suse.com>
Subject: Re: non volatile ram devices
Date: 05 Dec 2002 08:23:59 -0500
Message-ID: <1039094639.8199.119.camel@tiny>
References: <200212042059.35300.russell@coker.com.au>
	<20021204212447.C20004@vestdata.no> 
	<200212051000.32340.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12118-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200212051000.32340.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: Ragnar =?ISO-8859-1?Q?Kj=F8rstad?= <linux-ide-arrays@ragnark.vestdata.no>, ReiserFS <reiserfs-list@namesys.com>, Mike Jadon <mikej@umem.com>

On Thu, 2002-12-05 at 04:00, Russell Coker wrote:

> In this case the machines each have 4G of RAM.  The total RAM for the mail 
> cluster is four times what was used for the Solaris cluster, and Intel X86 
> architecture uses less RAM than SPARC (32bit CISC vs 64bit RISC) and I 
> suspect that the software we're now using (Qmail and Courier) is more memory 
> efficient than Netscape too.  Overall we have heaps more cache memory than 
> before, I'm seeing 20 reads per second and 160 writes per second at times of 
> peak load.

Have you benchmarked these machines to determine the max write load
capacity on reiserfs?  Are you using a vanilla kernel or one with
patches applied?

I've done a few of my own benchmarks of the data logging patches, but it
would be great to see some independent verification of the speedups in a
real mail server workload.

-chris


