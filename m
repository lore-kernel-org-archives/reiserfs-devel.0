From: Russell Coker <russell@coker.com.au>
Subject: Re: Proposal for keying encrypted filesystem
Date: Fri, 4 Apr 2003 10:25:29 +1000
Message-ID: <200304041025.29881.russell@coker.com.au>
References: <200303282026.23543.phma@webjockey.net> <200304031614.h33GE7S7004132@turing-police.cc.vt.edu> <200304031822.12677.phma@webjockey.net>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13565-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304031822.12677.phma@webjockey.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Abbat <phma@webjockey.net>, reiserfs-list@namesys.com, reiserfs-dev@namesys.com

On Friday 04 April 2003 09:22, Pierre Abbat wrote:
> On Thursday 03 April 2003 11:14, Valdis.Kletnieks@vt.edu wrote:
> > A better bet would be to use the LSM security framework to create a
> > module that carries the tokens around for the process - this could even
>
> What's LSM? This sounds like it can do what I want with rsync. Is it
> possible to add a new key token to init and have it propagate to all
> processes?

LSM is Linux Security Modules http://lsm.immunix.org/

LSM is the interface between a security module such as Security Enhanced Linux 
and the core Linux kernel code.

To do what you want you would have to create your own LSM module (which can 
even be loaded at run-time in an LSM kernel).

I suggest joining the LSM mailing list if you need more information, I'm not 
an expert on this.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

