From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] finally... data logging for 2.4.20-pre10
Date: 24 Oct 2002 09:12:50 -0400
Message-ID: <1035465170.30133.95.camel@tiny>
References: <1034709883.5053.920.camel@tiny> <3DB6F20F.3060500@ysu.edu>
	<3DB71BB6.9060700@mb.tu-ilmenau.de>  <3DB7ECDB.5070905@ysu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11752-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DB7ECDB.5070905@ysu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Dalbec <jpdalbec@ysu.edu>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Thu, 2002-10-24 at 08:51, John Dalbec wrote:
> Manuel Krause wrote:
> > On 10/23/2002 09:01 PM, John Dalbec wrote:
> > 
> >> Chris Mason wrote:
> >>
> >>> Hello all,
> >>>
> >>> I've uploaded new data logging code against 2.4.20-pre10 to
> >>> ftp.suse.com/pub/people/mason/patches/data-logging/2.4.20
> 
> Does anyone know what kernel was used for the patches in 
> ftp.suse.com/pub/people/mason/patches/data-logging ?  Are they against 
> 2.4.19?  The README doesn't say.

They are against 2.4.19, but it is a slightly older set of patches. 
They are good for benchmarking, but I would suggest using the 2.4.20-pre
patches for serious testing.

I'll try and upload the latest stuff against 2.4.19 today, this is what
the current suse kernel is based on, so it is by far the best tested of
the data logging series.

-chris


