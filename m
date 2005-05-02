From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: reiser4 on PPC
Date: Mon, 02 May 2005 10:34:14 -0500
Message-ID: <1115048054.6385.12.camel@gentoo>
References: <1114966993.11906.59.camel@gentoo>
	 <20050502141026.GA6067@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23957-reiserfs=m.gmane.org@namesys.com>
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

I have access to a friend's Mac mini, but you could use PearPC on one of
your x86 machines. The website claims it's ~1/15th speed using
"JITC-X86", so a fast x86 box would give you a reasonable PPC test
environment.

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

I don't remember seeing anything unusual.

> 
> If you have possibility to check the fs by an fsck.reiser4 compiled on i386,
> please do it.  If you don't have i386 around or have no time to compile the
> progs there, make a small file with reiser4 fs image , compress it and make it
> downloadable.

I was able to mount and use it on AMD64, but I don't recall if I fscked
it on AMD64. After adding a file to the reiser4 FS, I transfered the
image back to the PPC machine and it gave me the same mount error. I
suppose I could try making an image on x86 or AMD64.

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

