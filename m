From: Chris Mason <mason@suse.com>
Subject: Re: 2.4.19-pre7 / corruption on unwanted reboot
Date: 06 May 2002 08:54:02 -0400
Message-ID: <1020689642.1511.2100.camel@tiny>
References: <20020504211147.GA20092@matrix.wg>
	<1020564448.3946.609.camel@tiny>  <20020506123638.GA15023@matrix.wg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10256-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020506123638.GA15023@matrix.wg>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Mueller <dmuell@gmx.net>
Cc: reiserfs-list@namesys.com, axboe@suse.de

On Mon, 2002-05-06 at 08:36, Dirk Mueller wrote:
> On Sam, 04 Mai 2002, Chris Mason wrote:

[ reiserfs corruption after a crash, 2.4.19pre7 ]

> 
> > Hmmm, not good at all.  Are these 3 systems IDE or scsi?  Do they run
> > additional patches on top of pre7?  What kernels < pre7 have you tried
> > that didn't show this problem?
> 
> All IDE. The kernel that didn't show this problem was 2.4.16 (plain). No 
> additional patches on 2.4.19-pre7. 

Please tell us everything about your IDE config.  Jens and I are already
trying to track down some odd reiserfs + ide problems on 2.4.19pre7, but
so far that was only with our barrier write patches applied.

-chris

