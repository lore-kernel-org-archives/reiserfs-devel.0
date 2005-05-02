From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 on PPC
Date: Mon, 2 May 2005 18:10:26 +0400
Message-ID: <20050502141026.GA6067@backtop.namesys.com>
References: <1114966993.11906.59.camel@gentoo>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23954-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1114966993.11906.59.camel@gentoo>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: reiserfs-list@namesys.com

Hi,

On Sun, May 01, 2005 at 12:03:13PM -0500, Jake Maciejewski wrote:
> Now that reiser4 seems to be working on AMD64, I'm trying to test it on
> PPC. Unfortunately, I haven't even been able to mount a reiser4 FS.

Unfortunately we could not test reiser4 on PPC because of lack of test machine.
Currently no idea where it might fail.

> I get the following error: "mount: No such file or directory". I've
> tried a loopback filesystem and a native partition. The same native
> patition works when formatted with reiserFS. I've tried the code as a
> module and builtin. I was using reiser4progs 1.0.4 and the latest -mm
> patch on vanilla, which while not officially supported works on AMD64
> and x86 and shouldn't cause a problem like this. fsck.reiser4 says the
> unmountable filesystem is consistent. Is there anything else I should
> try?

can you look at your machine /var/log/messages or dmesg(8) output for reiser4
messages?

If you have possibility to check the fs by an fsck.reiser4 compiled on i386,
please do it.  If you don't have i386 around or have no time to compile the
progs there, make a small file with reiser4 fs image , compress it and make it
downloadable.

> 
> -- 
> Jake Maciejewski <maciejej@msoe.edu>
> 

Thanks in advance,
Alex.

