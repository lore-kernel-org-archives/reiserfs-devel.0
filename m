From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 14:31:56 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408261422370.2304@ppc970.osdl.org>
References: <Pine.LNX.4.44.0408261152340.27909-100000@chimarrao.boston.redhat.com>
 <1093536282.5482.6.camel@leto.cs.pocnet.net> <Pine.LNX.4.60.0408261348370.27825@dlang.diginsite.com>
 <20040826211918.GF5733@mail.shareable.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20817-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826211918.GF5733@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: David Lang <david.lang@digitalinsight.com>, Christophe Saout <christophe@saout.de>, Rik van Riel <riel@redhat.com>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com



On Thu, 26 Aug 2004, Jamie Lokier wrote:
> 
> With good cacheing, I could cd into the .tar.bz2 files and
> _effectively_ have the performance of untarred source trees for the
> ones I look at often on my disk -- automatically cleaned if the space
> if needed for something else, too.  It would be quite nice.

What you're talking about is just a caching filesystem. Then you can have 
any deamon do whatever it wants to fill it - whether from tar-files or 
over the network or anything else.

I think you should ask David Howells about it..

		Linus
