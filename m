From: Chris Mason <mason@suse.com>
Subject: Re: 2.4.19-pre7 / corruption on unwanted reboot
Date: 06 May 2002 10:26:00 -0400
Message-ID: <1020695160.3946.2155.camel@tiny>
References: <20020504211147.GA20092@matrix.wg>
	<1020564448.3946.609.camel@tiny> <20020506123638.GA15023@matrix.wg>
	<1020689642.1511.2100.camel@tiny>  <20020506135941.GA16598@matrix.wg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10261-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020506135941.GA16598@matrix.wg>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Mueller <dmuell@gmx.net>
Cc: reiserfs-list@namesys.com

On Mon, 2002-05-06 at 09:59, Dirk Mueller wrote:
> On Mon, 06 Mai 2002, Chris Mason wrote:
> 
> > Please tell us everything about your IDE config.  Jens and I are already
> > trying to track down some odd reiserfs + ide problems on 2.4.19pre7, but
> > so far that was only with our barrier write patches applied.
> 
> There is not much common. two of them are VIA 686 southbridge (KT133A, 
> KT333), one is something older, a Pentium chipset. 
> 
> DMA 100 and DMA 66. We all use those Maxtor 80GB EIDE disks. 

Any suggestions on how I might reproduce locally?

-chris


