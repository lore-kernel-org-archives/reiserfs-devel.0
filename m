From: Oleg Drokin <green@namesys.com>
Subject: Re: Debugging Reiser4 with UML in 2.5
Date: Wed, 11 Dec 2002 11:01:52 +0300
Message-ID: <20021211110152.B6065@namesys.com>
References: <20021210215237.43081.qmail@web14905.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12148-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021210215237.43081.qmail@web14905.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Smirl <jonsmirl@yahoo.com>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Dec 10, 2002 at 01:52:37PM -0800, Jon Smirl wrote:
> I'm trying to give the new Reiser4 a whirl with UML in
> a 2.5 kernel. I can't seem to figure out how to make
> gdb work right in this setup. I've heard that UML is
> being used to develop Reiser4 so maybe you can give me
> some pointers.

Sure. Later on I assume that you use tt mode of UML (particularly
because skas mode is not very usable with reiser4 right now).

> I have the 2.4.59 kernel built with UML and Reiser4 in
> it. I can boot and come to a prompt. I can mount my
> reiser4 volume and make files on it, etc..

That's good.

> Now I start up ddd on the host and attach to the
> tracing thread for UML. I add a "br reiser4_read" and
> continue.

Hm. First of all you need to compile your UML with CONFIG_DEBUGSYM
and CONFIG_PT_PROXY config options.

> >From the UML prompt I cat a file. My UML console
> prints out "Trace/breakpoint trap" and continues.
> 
> How do I get a gdb hooked to the right process so that
> it will catch the breakpoint?

Run gdb with these two options:
debug=parent gdb-pid=<pid>
where <pid> is pid of gdb process started by your ddd instance.
UML will stop after loading, now in ddd type 
'att 1' (without quotes)
You will see something like this:
0xa013dc51 in __kill ()

Now put all of the breakpoints you are interested in and this kind of stuff
and execute 'c' command to continue UML boot.
After that it works like a debugging userspace threaded program.
See http://user-mode-linux.sourceforge.net/debugging.html fore more info.

Bye,
    Oleg
