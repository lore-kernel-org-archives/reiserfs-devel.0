From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Strange errors with 2.4.22 patches (from Chris) and bonnie++
Date: Mon, 01 Dec 2003 17:00:23 +0100
Message-ID: <3FCB6597.8010604@gmx.net>
References: <bq8f7u$ufn$1@sea.gmane.org>  <3FC8F31A.7000501@gmx.net> <1070285425.12810.2.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16191-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1070285425.12810.2.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com


> I've had to remove reiserfs-jh-3, it caused problems in the suse kernel
> and a week or so of hunting wasn't able to track it down.  All my effort
> right now is on fixing it in my 2.6 branch.
Nice, to see data logging in 2.6.

So one is more safe without reiserfs-jh-3 than with it?

I sometimes get permission denied messages on some files if I read from 
LVM snapshots. This happens rather seldom and goes away if I redo a
snapshot. I could ask an admin to have a look for the console messsages, 
if this is the same problem you are facing.
I had no corruption.
-- 
lg, Chris

