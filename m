From: Sander <sander@humilis.net>
Subject: Re: status of reiser4
Date: Mon, 27 Dec 2004 13:38:34 +0100
Message-ID: <20041227123834.GB7388@favonius>
References: <41C322ED.4000807@namesys.com> <1103309648.8570.28.camel@localhost>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22909-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1103309648.8570.28.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: Hans Reiser <reiser@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Jake Maciejewski wrote (ao):
> Have there been any reports other than Isaac's of reiser4 working on
> AMD64? It still doesn't work for me, and I'd like to know if I'm the
> only one having problems.

It sort of works for me on a dual opteron on top of raid10 on top op
scsi. This is 64bit and kernel 2.6.10-rc3-mm1. It survives bonnie++ but
I re-installed one of the two identical servers with reiser3 because I
got fs corruption (for whatever reason) which fsck could not fix. It
said the fs was just fine after several fsck runs with different
parameters (which it told me to run with), but at least several libs
were corrupted.

I'm sorry I don't have more info on this.
