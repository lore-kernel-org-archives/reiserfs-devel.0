From: Russell Coker <bofh@coker.com.au>
Subject: Fwd: Re: [reiserfs-list] best reiserfs mount options for generic benchmarking
Date: Sat, 14 Sep 2002 13:35:43 +0200
Message-ID: <200209141335.43329.bofh@coker.com.au>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11445-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com



----------  Forwarded Message  ----------

Subject: Re: [reiserfs-list] best reiserfs mount options for generic 
benchmarking
Date: Sat, 14 Sep 2002 13:33:29 +0200
From: Russell Coker <russell@coker.com.au>
To: rwhron@earthlink.net, reiserfs-list@namesys.com

On Sat, 14 Sep 2002 13:09, rwhron@earthlink.net wrote:
> I want to use a consistent set of "best" mount options
> for various i/o benchmarks on reiserfs.  (bonnie++,
> tiobench, dbench).

Why?

Surely the aim of a benchmark is to simulate something that happens in the
real world, not just to generate big numbers for their own sake.  Therefore
the best thing to benchmark is the way you really use a system.

If you have files that grow by small chunks but which are on average quite
large then you will probably want to mount notails as it won't save any
significant amount of space but can cost performance.  If you have any
typical disk usage for home directories or maildir's then you'll want tails.

You'll never want a 400M journal on a real system (unless you've got many
terabytes of disk space and the journal is striped across several spindles).

--
I do not get viruses because I do not use MS software.
If you use Outlook then please do not put my email address in your
address-book so that WHEN you get a virus it won't use my address in the
From field.

-------------------------------------------------------

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

