From: "Yury V. Umanets" <umka@namesys.com>
Subject: Re: [jedi@ninja.dynup.net: Re: V4 status]
Date: Fri, 05 Dec 2003 15:56:27 +0300
Message-ID: <1070628987.945.3.camel@firefly>
References: <20031205085814.GD1926@backtop.namesys.com>
	 <1070616004.15376.9.camel@firefly>  <3FD07ECB.2080004@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16244-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD07ECB.2080004@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: jedi@ninja.dynup.net, reiserfs-list@namesys.com

On Fri, 2003-12-05 at 15:49, Hans Reiser wrote:
> >  
> >
> >> and v3 was never supported very well). 
> >>    
> >>
> >I thought, that it is supported good enough :) Can you be more specific
> >on this?
> >
> >
> >  
> >
> SuSE users use grub and reiserfs by default.
Yep. Speaking about reiserfs support more specifically, I can say, that
GRUB supports reiserfs 3.5-3.6 and with relocated journal in both modes:
with using stage_1.5 and without using it. Using stage 1_5 means, that
GRUB is able to read kernel image from reiserfs even if it was fully of
tails (like it is possible in reiser4).


-- 
umka

