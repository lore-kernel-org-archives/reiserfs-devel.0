From: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 10:34:38 +0300
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <200408261034.38509.vda@port.imtp.ilyichevsk.odessa.ua>
References: <20040825152805.45a1ce64.akpm@osdl.org> <1093496948.2748.69.camel@entropy> <20040826053200.GU31237@waste.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040826053200.GU31237@waste.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Mackall <mpm@selenic.com>, Nicholas Miell <nmiell@gmail.com>
Cc: Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

> > > A file is a stream of bytes.
> >
> > "OMG! It breaks tar and email!!!" argument doesn't fly. Things break all
> > the time and are fixed. It's called progress.
>
> What it breaks is the concept of a file. In ways that are ill-defined,
> not portable, hard to work with, and needlessly complex. Along the
> way, it breaks every single application that ever thought it knew what
> a file was.
>
> Progress? No, this has been done before. Various dead operating
> systems have done it or similar and regretted it. Most recently MacOS,
> which jumped through major hurdles to begin purging themselves of
> resource forks when they went to OS X. They're still there, but
> heavily deprecated.
>
> > cp, grep, cat, and tar will continue to work just fine on files with
> > multiple streams.
>
> Find some silly person with an iBook and open a shell on OS X. Use cp
> to copy a file with a resource fork. Oh look, the Finder has no idea
> what the new file is, even though it looks exactly identical in the
> shell. Isn't that _wonderful_? Now try cat < a > b on a file with a
> fork. How is that ever going to work?
>
> I like cat < a > b. You can keep your progress.

cat <a >b does not preserve following file properties even on standard
UNIX filesystems: name,owner,group,permissions.
-- 
vda
