From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 30 Aug 2004 23:47:36 -0700
Message-ID: <41341F08.7050401@namesys.com>
References: <Pine.LNX.4.44.0408271043090.10272-100000@chimarrao.boston.redhat.com> <412F7D63.4000109@namesys.com> <20040829150041.GD9471@alias> <4133CA74.6070906@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21145-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4133CA74.6070906@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: flx@msu.ru, Rik van Riel <riel@redhat.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

David Masover wrote:

>
>
> And I did mention before about how it'd be nice for it to be an fs 
> chunk...

Please define fs chunk. My mind has an open door.;-)

>
> Imagine 5000 tiny little files that, by the time reiser's done with
> them, fit inside 5 blocks or so. It's insanely cheaper to copy the five
> blocks than to tar them up. It also means that we don't have to worry
> about supporting tar on other platforms -- if they don't have reiser4,
> they need a separate converter. If apps are going to use reiser4
> metadata for anything significant, they probably would link against some
> sort of userland implementation of reiser4 as a Windows library, say, to
> access the files elsewhere.
>
> That's extreme, but you get the idea.

