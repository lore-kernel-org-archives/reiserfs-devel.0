From: Russell Coker <russell@coker.com.au>
Subject: Re: !?!
Date: Wed, 8 Jan 2003 08:18:16 +0100
Message-ID: <200301080818.16061.russell@coker.com.au>
References: <3E1BCAE6.9000408@ap-plastic.ru>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12291-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E1BCAE6.9000408@ap-plastic.ru>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anton Erofeevskij <ae@ap-plastic.ru>, reiserfs-list@namesys.com

On Wed, 8 Jan 2003 07:53, Anton Erofeevskij wrote:
> in reiserfs filesystem
> time cat sd1 | ./a.out > sd2
> 0.00user 0.05system 0:01.79elapsed 2%CPU (0avgtext+0avgdata 0maxresident)k
> 0inputs+0outputs (131major+43minor)pagefaults 0swaps
>
> in ext2 filesystem
> time cat sd1 | ./a.out > sd2
> 0.00user 0.05system 0:00.95elapsed 2%CPU (0avgtext+0avgdata 0maxresident)k
> 0inputs+0outputs (131major+43minor)pagefaults 0swaps

Try mounting the ReiserFS file system with notail and it should perform a lot 
better for such things.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

