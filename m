From: Chris Mason <mason@suse.com>
Subject: Re: vpf-10680, minor corruptions
Date: 27 Jun 2003 12:23:07 -0400
Message-ID: <1056730986.20899.235.camel@tiny.suse.com>
References: <20030625054031.GA11576@namesys.com>
	 <3EF9A0F6.4030401@g-house.de> <3EF9E939.1050501@g-house.de>
	 <20030626092608.GA12252@namesys.com> <3EFAE933.6040206@g-house.de>
	 <20030627092821.GA29715@namesys.com> <3EFC361A.4030009@g-house.de>
	 <20030627122556.GA8753@namesys.com> <3EFC396A.7080808@g-house.de>
	 <20030627123800.GA9214@namesys.com>  <20030627161344.GA13908@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14741-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030627161344.GA13908@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Christian Kujau <evil@g-house.de>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, 2003-06-27 at 12:13, Oleg Drokin wrote:
> Hello!
> 
> On Fri, Jun 27, 2003 at 04:38:00PM +0400, Oleg Drokin wrote:
> 
> > I was looking in the wrong direction, when I produced that patch,
> > so it will produce zero output.
> > I hope to come up with ultimate fix soon enough. ;)
> 
> Well, there is a patch below that does *not* work for me ;)
> But it should work.
> I have traced the new problem to a cross compiler that compiles
> code in a different way than native compiler for whatever reason
> (demo is attached as test.c program, it should print "result is 1"
> in case it is compiled correctly and stuff about unknown
> uniqueness if it is miscompiled. In fact may be this is just correct compiler behaviour.)
> I now think that when I compile a kernel with native compiler, it should work
> with below patch. But I can verify that only tomorrow it seems.
> You might try that patch as well to see if it helps you before I try it ;)
> The patch is "obviously correct" one. (except that it does not work
> with my cross compiler and kernel does work without patch which is really-really strange).
> 

Most of these changes are in 2.4.21, which I've been using on an AMD64
bit box for a while without any problems.  The bug should be somewhere
else, it looks to me like these spots aren't trying to send an unsigned
long to disk.

-chris


