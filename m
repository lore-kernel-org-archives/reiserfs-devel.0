From: Dirk Mueller <dmuell@gmx.net>
Subject: Re: 2.4.19-pre7 / corruption on unwanted reboot
Date: Mon, 6 May 2002 15:59:42 +0200
Message-ID: <20020506135941.GA16598@matrix.wg>
References: <20020504211147.GA20092@matrix.wg> <1020564448.3946.609.camel@tiny> <20020506123638.GA15023@matrix.wg> <1020689642.1511.2100.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10260-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1020689642.1511.2100.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, 06 Mai 2002, Chris Mason wrote:

> Please tell us everything about your IDE config.  Jens and I are already
> trying to track down some odd reiserfs + ide problems on 2.4.19pre7, but
> so far that was only with our barrier write patches applied.

There is not much common. two of them are VIA 686 southbridge (KT133A, 
KT333), one is something older, a Pentium chipset. 

DMA 100 and DMA 66. We all use those Maxtor 80GB EIDE disks. 


Dirk
