From: Russell Coker <russell@coker.com.au>
Subject: Re: OT: Swapfile to RAM relation with 2.4.2X+
Date: Fri, 7 Feb 2003 12:09:51 +0100
Message-ID: <200302071209.51547.russell@coker.com.au>
References: <3E43103A.5010106@mb.tu-ilmenau.de>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12670-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E43103A.5010106@mb.tu-ilmenau.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, reiserfs-list <reiserfs-list@namesys.com>

On Fri, 7 Feb 2003 02:47, Manuel Krause wrote:
> In the beginning of 2.4.0+ a relation of swapfile-to-RAM of 2-to-1 was
> recommended. Due to my several system changes to come in those times I

Such recommendations are only generalisations.  Ignore them and look at what 
your system is doing.  If your swap space never runs out and you don't expect 
your usage patterns to require more (including cron jobs and periods of 
unexpected load) then you have enough.  If you run out of swap space then you 
need more, also you should have some swap even if you have a lot of memory.  
There's always data that isn't used much and can be paged out to make room 
for more disk cache.


BTW  Anything that is worth saying in a .sig can be said in 4 lines.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

