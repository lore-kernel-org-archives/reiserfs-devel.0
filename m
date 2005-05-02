From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: reiser4 on PPC
Date: Mon, 02 May 2005 10:59:04 -0500
Message-ID: <1115049544.6385.20.camel@gentoo>
References: <1114966993.11906.59.camel@gentoo>
	 <20050502141026.GA6067@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23958-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050502141026.GA6067@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, 2005-05-02 at 18:10 +0400, Alex Zarochentsev wrote:
> Hi,
> 
> On Sun, May 01, 2005 at 12:03:13PM -0500, Jake Maciejewski wrote:
> > Now that reiser4 seems to be working on AMD64, I'm trying to test it on
> > PPC. Unfortunately, I haven't even been able to mount a reiser4 FS.
> 
> Unfortunately we could not test reiser4 on PPC because of lack of test machine.
> Currently no idea where it might fail.
> 
> > I get the following error: "mount: No such file or directory". I've
> > tried a loopback filesystem and a native partition. The same native
> > patition works when formatted with reiserFS. I've tried the code as a
> > module and builtin. I was using reiser4progs 1.0.4 and the latest -mm
> > patch on vanilla, which while not officially supported works on AMD64
> > and x86 and shouldn't cause a problem like this. fsck.reiser4 says the
> > unmountable filesystem is consistent. Is there anything else I should
> > try?
> 
> can you look at your machine /var/log/messages or dmesg(8) output for reiser4
> messages?

Well, now that I've actually checked it, there is a warning. I get the
same message regardless of the architecture the FS is created on.

reiser4[mount(22352)]: key_warning
(fs/reiser4/plugin/object.c:96)[nikita-717]:
WARNING: Error for inode 720575940379279360 (-2)

This is a clean, consistent filesystem we're talking about, so I guess
it's a kernel problem. Is it worth trying a different kernel version?
I'm trying to avoid -mm because it sometimes breaks alternative
architectures, but I wanted the lastest version of the code. As I
mentioned before, I used a cutsom patch that works on x86. I'm willing
to try other versions if necessary.

> 
> If you have possibility to check the fs by an fsck.reiser4 compiled on i386,
> please do it.  If you don't have i386 around or have no time to compile the
> progs there, make a small file with reiser4 fs image , compress it and make it
> downloadable.
> 
> > 
> > -- 
> > Jake Maciejewski <maciejej@msoe.edu>
> > 
> 
> Thanks in advance,
> Alex.
> 
-- 
Jake Maciejewski <maciejej@msoe.edu>

