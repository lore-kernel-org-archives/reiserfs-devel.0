From: Linus Torvalds <torvalds@osdl.org>
Subject: Re:   reiser4 plugins (was: silent semantic changes with reiser4)
Date: Sat, 28 Aug 2004 12:26:39 -0700 (PDT)
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0408281223390.2295@ppc970.osdl.org>
References: <412D9FE6.9050307@namesys.com> <20040826014542.4bfe7cc3.akpm@osdl.org>
 <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de>
 <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de>
 <1093526273.11694.8.camel@leto.cs.pocnet.net> <20040826132439.GA1188@lst.de>
 <20040828105929.GB6746@alias> <Pine.LNX.4.58.0408281011280.2295@ppc970.osdl.org>
 <20040828190350.GA14152@alias>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040828190350.GA14152@alias>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Lyamin <flx@msu.ru>
Cc: Christoph Hellwig <hch@lst.de>, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Sat, 28 Aug 2004, Alexander Lyamin wrote:
> 
> Considering "amazing PR skills" of Hans Reiser it was the only viable way
> to get this changes in VFS. Cause, ironically, mr. Hellwig that currently
> demand it to be scrapped out or go in VFS would instakill Hans Reiser
> (i know many people would:) if he only touched holy cow of VFS for any
> reiser4 purpose.

Hey, you don't have to try to convince me - I haven't been arguing against 
the reiser4 approach. I think it's a prototyping scheme, and quite frankly 
I don't think you _can_ get the name lookup right without real VFS support 
(races, namespaces etc are just not something you can solve in the 
filesystem). 

But the fact that name lookup does seriously need VFS support means that I 
don't think we want to merge reiser4 as-is. No way. That doesn't mean that 
I think reiser4 was _wrong_.

And I certainly agree that there are personality issues, and they are not 
all just Hans' ;)

			Linus
