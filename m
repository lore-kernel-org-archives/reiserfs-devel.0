From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: link/unlink problem gone?
Date: 6 Feb 2003 17:32:10 -0500
Message-ID: <b1unpa$bmb$1@satsuki.furryterror.org>
References: <20030129164906.A8320@namesys.com> <20030129164906.A8320@namesys.com> <20030131105745.A7426@namesys.com>
Return-path: <reiserfs-list-return-12667-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <20030131105745.A7426@namesys.com>,
Oleg Drokin  <green@namesys.com> wrote:
>Hello!
>
>   Sigh, these were false hopes indeed.
>   I can reproduce it with 2.4.21-pre4, only it is now harder for some reason.

I've seen times-to-failure ranging from 20 minutes to 20+ hours (!).

Interestingly enough, both extremes occurred back-to-back--I tried
for 20 hours to reproduce the problem, failed, tried again with the
same kernel setup, and 20 minutes later the machine was spewing out
"Permission denied" too quickly to display.

>   Chris: My current idea is it happens during low memory conditions, so I am
>   actively running around prune_icache and id's dcache equivalent. Probably
>   you can easily reproduce that if you'd have no swap and not very much RAM.
>
>   (Ok, I just checked, limited the RAM to 90M and turned off SWAP entirely.
>    and reproduced the problem fairly quickly)

I have observed the problem on machines ranging in size from 96 to
512MB RAM.  I haven't observed a correlation between swapping activity
and failures but I haven't been looking for this either.  The machines
that have problems machines are swapping at some time or another (they
have several hundred MB of swap used).

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
