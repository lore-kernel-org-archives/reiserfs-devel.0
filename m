From: Russell Coker <russell@coker.com.au>
Subject: Re: Write-once file system
Date: Sat, 28 Jun 2003 04:30:10 +1000
Message-ID: <200306280430.10176.russell@coker.com.au>
References: <Pine.LNX.4.44.0306271724390.3922-100000@potato.zayda.com>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14755-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0306271724390.3922-100000@potato.zayda.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Holt <jason@lunkwill.org>, Fong Vang <FVang@Zantaz.com>
Cc: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

On Sat, 28 Jun 2003 03:37, Jason Holt wrote:
> *Somebody* has to have root.  Just like *something* on the disk has got to
> be physically capable of writing a sector that it shouldn't.  You just need

True.

However if you have a daemon that needs "root" access because it needs raw 
Ethernet access, to bind to low ports, or to spawn child processes under 
different UIDs but which still may not be permitted full access to the system 
then there are a variety of solutions.  SE Linux is the solution I recommend 
to this problem.

If you want a file to not be re-writable in any way (not by any contexts and 
not even by replacing the kernel) then you need some cryptographic solution, 
and AFAIK none of this is available in Linux yet.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

