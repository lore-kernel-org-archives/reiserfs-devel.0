From: Hans Reiser <reiser@namesys.com>
Subject: latest reiser4 release contains performance killing bug fix, don't
 use it
Date: Tue, 02 Nov 2004 10:38:39 -0800
Message-ID: <4187D42F.9040707@namesys.com>
References: <4187671E.50601@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22255-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4187671E.50601@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "E.Gryaznova" <grev@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-dev <reiserfs-dev@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

We are pulling it from our website now, and will release a proper bug 
fix in a few days.  It is a hard to hit bug.

Hans

E.Gryaznova wrote:

> Hello,
>
> reiser4 losses the READ performance up to x3 times (!) due to
>
> ChangeSet@1.1703, 2004-10-27 18:10:49+04:00, vs@tribesman.namesys.com
>  get_user_pages to avoid pagefaults on copy_from/to_user
>
>
> http://www.namesys.com/intbenchmarks/mongo/04.11.01/256MB.RAM/old_vs_current/r4_performance_degradation.html 
>
>
> Thanks,
> Lena
>
>
>

