From: Alexander Lyamin <flx@msu.ru>
Subject: Re:  reiser4 plugins (was: silent semantic changes with reiser4)
Date: Sat, 28 Aug 2004 15:18:07 +0400
Message-ID: <20040828111807.GC6746@alias>
References: <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com> <20040826014542.4bfe7cc3.akpm@osdl.org> <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de> <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de> <1093526273.11694.8.camel@leto.cs.pocnet.net> <20040826132439.GA1188@lst.de> <1093527307.11694.23.camel@leto.cs.pocnet.net>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20975-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1093527307.11694.23.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Saout <christophe@saout.de>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Thu, Aug 26, 2004 at 03:35:07PM +0200, Christophe Saout wrote:
> Am Donnerstag, den 26.08.2004, 15:24 +0200 schrieb Christoph Hellwig:
> 
> > > First you say that that file-as-a-directory is crap then you say that it
> > > does belong into the filesystem?
> > 
> > I think you're talking about something different then me, I'm not
> > talking about the magic meta files but the VFS interface in general.
> > 
> > This VFS interface is an integral part of very filesystem, and it
> > doesn't make a whole lot to put it into a plugin.
> 
> Right. That's why these plugins are linked in uncoditionally. It doesn't
> work without them. Hence "plugins" is not a very good name.

its still plugins no matter what. they just emulate "conventional filesystem"
behavior for VFS, but at some point you might want just to scrap VFS..
if you'd like to.

And I honestly dont understand whats the other Christoph's worries are about.

Its got perfomance. Its there. It can emulate "conventional filesystem" behaviour,
 for legacy apps. Thouse two that are currently crippled by metas, we 
are so happy arguing about, will get fixed fast. Thats a point where you could
happily STOP and live with your happy "conventional filesystem emulation", yet
enjoying perfomance aspects (if perfomance hurts you, do not compile reiserfs,
just like one big-red distro does, nobody would not complain. except your hard-drive
mechanics sick of seeks).
 But most people would not stop, and its good.

Yes, I think it would be nice to have this infrastructure in VFS. Technically.
But its not possible, cause of "committee clusterfuck". Socially. Stupidly.




-- 
"the liberation loophole will make it clear.."
lex lyamin
