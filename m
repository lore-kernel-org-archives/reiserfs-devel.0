From: Russell Coker <russell@coker.com.au>
Subject: Re: other OS
Date: Tue, 3 Dec 2002 18:49:30 +0100
Message-ID: <200212031849.30808.russell@coker.com.au>
References: <001501c29a82$0126a110$0101a8c0@bummer>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12093-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <001501c29a82$0126a110$0101a8c0@bummer>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: darren <teodarren@myrealbox.com>, reiserfs-list@namesys.com

On Tue, 3 Dec 2002 05:11, darren wrote:
> Was just wondering about the possibilities of using reiserfs on my
> Solaris 6 machine.
>
> Any chance of that?

I doubt it.  I can't imagine Sun (or anyone else) paying Hans enough money to 
do this.

Veritas VXFS is good for this type of thing.  Any time you want half decent IO 
performance on Solaris you want Veritas VXFS and Volume Manager.

> I am having problems with FS performance (large number, 20K of small
> files in folder with constant writes and deletes) on the Sun Machine and
> was thinking if this can help me.
>
> The only way I know is to use a Linux machine running reiser and NFS it
> over. But performance will surely be degraded this way....any other
> suggestions?

In 1999 I was doing some work on AIX machines.  I found that an AIX server was 
so slow that NFS mounting a ReiserFS file system over a 10baseT network was 
faster for some operations!!!  If you do a usenet search you can find 
references to this, comp.sys.aix or something.

Another option is to use Linux on the SPARC machine.  Linux on SPARC reputedly 
performs a lot better than Solaris if you have 8 or less CPUs, even without 
the ReiserFS issue.  I think that Linux on SPARC can even run Solaris 
binaries (but I'm not certain).


PS  There is no such thing as Solaris 6.  They jumped straight from Solaris 
2.6 (which is presumably what you are using) to Solaris 7.0.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

