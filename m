From: Russell Coker <russell@coker.com.au>
Subject: Re: Debugreiserfs Security Question (3.6.7-pre1)
Date: Fri, 20 Jun 2003 14:14:49 +1000
Message-ID: <200306201414.49470.russell@coker.com.au>
References: <3EF27041.6060401@netscape.net>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14638-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EF27041.6060401@netscape.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuelkrause@netscape.net>, reiserfs-list <reiserfs-list@namesys.com>

On Fri, 20 Jun 2003 12:24, Manuel Krause wrote:
> If I currently use debugreiserfs -p  /dev/xxx | gzip -c > xxx.gz and
> later for testing gunzip -c xxx.gz | unpack /dev/yyy  I get the same
> filenames on the last target partition. (with reiserfsprogs 3.6.7-pre1)

So if the bug in ReiserFS is related to file names then how could it be 
diagnosed without the names being preserved?

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

