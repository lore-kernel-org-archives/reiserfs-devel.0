From: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: Re: More Slowdown
Date: Tue, 15 Nov 2005 23:55:10 +0100
Message-ID: <437A674E.2060407@ursynow.2a.pl>
References: <1132093347.6347.7.camel@bauerbob.hirsch.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26950-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1132093347.6347.7.camel@bauerbob.hirsch.lan>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thorsten Hirsch <t.hirsch@web.de>
Cc: reiserfs-list@namesys.com

Thorsten Hirsch wrote:
 > Hi,
 >
 > I've seen the mails in the mail archive concerning a slow-down problem
 > with reiser4. Seems like I've got the same problem. My kernel is
 > 2.6.14-mm2 (gentoo) and my default disk scheduler is anticipatory, but
 > I've also tried cqf and I'd say that it depends on the application for
 > which scheduler might be a bis faster. But they're both very slow and my
 > load is very high.
 >
 > I've found out, that resizing the columns in evolution is also for me a
 > good proof of this problem as it really creates a lot of hard disk
 > activity. So I've done the same strace call as Craig Shelley:
 >
[cut]
 >

My slowdown problems are on my web server, so its concerning different 
things than Evolution. but this slowdown was very easy to notice when 
writing something with vim.

Anyways, i remembered that i was using stable kernel without this 
happening some time ago. So i tested 2.6.14.x , 2.6.13.x mm and 2.6.13.x 
, and i still had system crashes. so i downgraded to 2.6.12.6 and the 
system is stable for more than 24 hours (first time in this month or 
even longer!)

probably some processes were doing fsync often (or something similar) 
and the effect was raising LA and lock-up at the end.

anyways, 2.6.12.6 (but other than .6 probably too) is, i think, bug 
free. maybe this will help.

