From: Chris Dukes <pakrat@www.uk.linux.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 23:32:03 +0100
Sender: <pakrat@ftp.linux.org.uk>
Message-ID: <20040826223203.GD32697@ZenIV.linux.org.uk>
References: <Pine.LNX.4.44.0408261152340.27909-100000@chimarrao.boston.redhat.com> <1093536282.5482.6.camel@leto.cs.pocnet.net> <Pine.LNX.4.60.0408261348370.27825@dlang.diginsite.com> <200408270030.20647.lkml@felipe-alfaro.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20832-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408270030.20647.lkml@felipe-alfaro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Alfaro Solana <lkml@felipe-alfaro.com>
Cc: David Lang <david.lang@digitalinsight.com>, Christophe Saout <christophe@saout.de>, Rik van Riel <riel@redhat.com>, Jamie Lokier <jamie@shareable.org>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Fri, Aug 27, 2004 at 12:30:19AM +0200, Felipe Alfaro Solana wrote:
> On Thursday 26 August 2004 23:05, David Lang wrote:
> 
> > I also don't see why the VFS/Filesystem can't decide that (for example)
> > this tar.gz is so active that instead of storing it as a tar.gz and
> > providing a virtual directory of the contents that it instead stores the
> > directory of the contents and makes the tar.gz virtual (regenerating it as
> > needed or as extra system resources are available)
> 
> Because that would mean the kernel should "talk" the tar format, which is, 
> IMHO, a Bad Idea (TM). Maybe the kernel could notify a user-space daemon to 
> perform this task, instead.

Wasn't HURD supposed to do this for us?
-- 
Chris Dukes
Warning: Do not use the reflow toaster oven to prepare foods after
it has been used for solder paste reflow. 
http://www.stencilsunlimited.com/stencil_article_page5.htm
