From: Russell Coker <russell@coker.com.au>
Subject: kernel go-slow
Date: Mon, 3 Feb 2003 00:27:40 +0100
Message-ID: <200302030027.40936.russell@coker.com.au>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12606-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS <reiserfs-list@namesys.com>

I'm running a number of machines with 2.4.20 and the ReiserFS journal patches.

One problem that has started occuring is that periodically some of the 
machines will go really slow for a while.  It's as if the CPU speed has just 
dropped to 1% of it's regular speed.  Then after 10 minutes or so it will 
continue as normal.

Has anyone heard of such things before?

I am asking here first because the ReiserFS patch is the most significant 
kernel patch I've applied on what is otherwise a stock 2.4.20 kernel.

Interestingly the machines that have the problems are not the most active in 
the file system (mail store), but the mail spool machines.  The mail spool 
machines do a good amount of file access (but well below the limits of the 
hardware) and also use more memory and have large load spikes on occasion 
(virus and spam scanning).

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

