From: Russell Coker <russell@coker.com.au>
Subject: Re: Write-once file system
Date: Sat, 28 Jun 2003 19:48:16 +1000
Message-ID: <200306281948.16105.russell@coker.com.au>
References: <Pine.LNX.4.44.0306280736170.20105-100000@potato.zayda.com>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14772-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0306280736170.20105-100000@potato.zayda.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Holt <jason@lunkwill.org>
Cc: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

On Sat, 28 Jun 2003 17:45, Jason Holt wrote:
> I looked a bit at grsecurity.net, but didn't find anything right off the
> bat to explain how they accomplish this securely.  It sounds... really
> suspicious, to me anyway.  Do they actually prevent root from, say,
> manually issuing the machine code to talk to the disk?  Or does it just
> keep him from doing it via the standard syscalls?

They limit what can be done with the system calls.

There is no way of avoiding system calls when accessing things in Linux (*), 
this is the difference between Linux and DOS.

(*) Presuming that you also limit access to /dev/kmem and /dev/mem.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

