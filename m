From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: kernel BUG 362
Date: Fri, 01 Apr 2005 16:26:54 +0400
Message-ID: <1112358403.3757.43.camel@tribesman.namesys.com>
References: <435.921-16966-1988335017-1112349396@seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23751-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <435.921-16966-1988335017-1112349396@seznam.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf <ralf@seznam.cz>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2005-04-01 at 13:56, Ralf wrote:
> hi, i have problems:
> 
> file "bugs.txt" in attachment (or here http://147.229.196.80/tmp/bugs.txt) - some of error messages i got, i had to reboot my system due this errors
> 
> i use debian unstable, linux kernel 2.6.11.6, reiser 3.6 fs, reiser V3, reiserfsprogs 1.3.6.19, i does not use quotas
> 
> the patch in the attachment (or here http://147.229.196.80/tmp/reiser-lock-fix.diff) does not work for me
> 
Please provide more details of the problem:

can you reproduce it?
what did your system do when it happened?
what filesystems did you have mounted when system crashed?
do you have messages starting with "REISERFS: panic.." in system logs?



> 
> ____________________________________________________________
> http://www.bezpecnyinternet.cz
> http://ad.seznam.cz/clickthru?spotId=94734
> 

