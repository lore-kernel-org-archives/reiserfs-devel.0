From: Chris Mason <mason@suse.com>
Subject: Re: reiser limits
Date: Fri, 16 Apr 2004 13:19:40 -0400
Message-ID: <1082135980.27614.1436.camel@watt.suse.com>
References: <001d01c422e2$9f7e14d0$3f32a8c0@ds.ig.com.br>
	 <1082034018.27614.145.camel@watt.suse.com>  <c5om4s$rvd$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18001-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <c5om4s$rvd$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Matteo <kundor@member.fsf.org>
Cc: reiserfs-list@namesys.com

On Fri, 2004-04-16 at 09:19, Nick Matteo wrote:
> Chris Mason wrote:
> 
> > On Thu, 2004-04-15 at 08:10, Fabiano Reis wrote:
> >> Hi list,
> >>  
> >> Someone knows how many directory can I create inside a single
> >> directory?
> > 
> > Both 2.4.x and 2.6.x v3 have no additional limits on subdirs, it's the
> > same as the number of files you can put on the FS (~2^32).
> > 
> > v4 might be higher, not sure.
> > 
> > -chris
> 
> Can 64-bit platforms have 2^64 files?

Sorry, not in v3, it is regulated by the disk format, not the cpu.

-chris


