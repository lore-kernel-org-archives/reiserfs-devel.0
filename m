From: Ross Vandegrift <ross@willow.seitz.com>
Subject: Re: [reiserfs-dev] [ctgaff@attbi.com: Debian Woody Performance with ReiserFS]
Date: Mon, 11 Nov 2002 17:40:18 -0500
Message-ID: <20021111224018.GA1072@willow.seitz.com>
References: <20021109000211.GA46264@attbi.com> <15823.45478.638434.968665@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11965-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <15823.45478.638434.968665@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@namesys.com>
Cc: "Corey G." <ctgaff@attbi.com>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, ed@debian.org

On Mon, Nov 11, 2002 at 04:33:26PM +0300, Nikita Danilov wrote:
> [Ed Boraas CC-ed, probably this is of interest for Debian people.]
> 
> Corey G. writes:
>  > These settins were NOT on by default with Debian.  The most important
>  > (I know this from testing) is "using_dma".  After turning this on, things
>  > really start to move.

Having worked quite a bit with Debian on decently sized IDE machines, I
can't say I've ever heard of Debian doing anything with hdparm in the
init scripts.  'grep hdparm /etc/init.d/*' returns nothing.

In addition the Debian woody system I had running DMA100 with 7200rpm
drives with Reiserfs burnt from day one (well, there was a cap because
of the pretty ancient other hardware, but it was old enough hardware I
was testing that it made sense that there'd be a hit on disk
performance)

Ed - are you sure the kernel hasn't detected a bad drive/controller
combination and has *intentionally* disable UDMA to prevent data
corruption?  Are you using the Good/Bad Drive Firmware protection?

Something seems odd to me...

-- 
Ross Vandegrift
ross@willow.seitz.com

A Pope has a Water Cannon.				 It is a Water Cannon.
He fires Holy-Water from it.			    It is a Holy-Water Cannon.
He Blesses it.				       It is a Holy Holy-Water Cannon.
He Blesses the Hell out of it.		It is a Wholly Holy Holy-Water Cannon.
He has it pierced.		  It is a Holey Wholly Holy Holy-Water Cannon.
Batman and Robin arrive.				       He shoots them.
