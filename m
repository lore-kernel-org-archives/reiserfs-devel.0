From: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 17:00:42 +0300
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <200408261700.43253.vda@port.imtp.ilyichevsk.odessa.ua>
References: <20040824202521.GA26705@lst.de> <839984491.20040826122025@tnonline.net> <m3llg2m9o0.fsf@zoo.weinigel.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <m3llg2m9o0.fsf@zoo.weinigel.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>
Cc: Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thursday 26 August 2004 14:16, Christer Weinigel wrote:
> Spam <spam@tnonline.net> writes:
> >   Keeping stuff in the kernel should make the new features
> >   transparent to the applications.
>
> No, it will make just one special case, rename within the same
> filesystem, work.  (Well, two special cases, rm will also delete
> the other forks).

In traditional UNIX filesystems, copy loses some info too
(owner,group,mode bits). cp and tar was taught about this
and they now can preserve that info.

However, I do not think that hacking on cp, tar, etc everytime
we need to add something to our filesystems (xattrs, ACLs,
whatever) is a terribly attractive idea.

I think reiserfs is going to handle that by giving uniform access
to such ancillary data. It will be visible as file/meta/*
filelets ('small files') or something like that and can be saved/restored
by e.g. tar *without* needing to know what data is stored there, and
in what format.

I think Hans is not planning turning old "file is a stream of bytes"
into eight-stream octopus. One stream will remain as a 'main' one,
which contains actual data. Others will keep metadata, etc...

Note that even today's files aren't simple "streams of bytes"
because they also have names,mode bits etc.
--
vda
