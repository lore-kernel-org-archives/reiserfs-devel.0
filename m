From: Felipe Alfaro Solana <lkml@felipe-alfaro.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 16:42:20 +0200
Message-ID: <200408261642.21643.lkml@felipe-alfaro.com>
References: <20040824202521.GA26705@lst.de> <m3llg2m9o0.fsf@zoo.weinigel.se> <200408261700.43253.vda@port.imtp.ilyichevsk.odessa.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20690-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408261700.43253.vda@port.imtp.ilyichevsk.odessa.ua>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>
Cc: Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thursday 26 August 2004 16:00, Denis Vlasenko wrote:
>
> I think Hans is not planning turning old "file is a stream of bytes"
> into eight-stream octopus. One stream will remain as a 'main' one,
> which contains actual data. Others will keep metadata, etc...
>
> Note that even today's files aren't simple "streams of bytes"
> because they also have names,mode bits etc.

This is just exactly how NTFS does work: there's an unnamed stream (which is 
the one that the majority of userspace programs do manipulate) which contains 
the user data (the pixels from a PMG image, or text from a text file, etc.), 
and there are named streams which not all kind of applications do know how to 
handle.
