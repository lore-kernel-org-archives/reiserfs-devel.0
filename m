From: Dirk Mueller <dmuell@gmx.net>
Subject: Re: Large Partition Performance Test
Date: Thu, 11 Apr 2002 22:28:56 +0200
Message-ID: <20020411202856.GA26083@matrix.wg>
References: <20020411181459.69516.qmail@web10002.mail.yahoo.com> <20020411234316.A3749@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10048-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020411234316.A3749@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Don, 11 Apr 2002, Oleg Drokin wrote:

> 4 minutes 20 seconds to write 1.6G of data even in the beginning?!
> This sounds too slow to me. Though RAID5 certainly can slow things down.

Its not the RAID,I can reproduce it: 

day/hour 00 00 seconds = 691
day/hour 00 01 seconds = 720

this seems to be highly CPU bound, because it hardly ever accessed the 
harddisk. it spends 60% in kernel space cpu though. 


Dirk
