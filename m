From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 12 Feb 2003 20:19:58 +0300
Message-ID: <3E4A823E.9010609@namesys.com>
References: <93F527C91A6ED411AFE10050040665D0049C06D5@corpusmx1.us.dg.com> <200302130522.35829.sam@vilain.net> <51115850843.20030212175355@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12728-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <51115850843.20030212175355@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

We are doing ok financially until summer, during which I need to come up 
with more money from somewhere.

There is a lot of fiscal uncertainty in a project like ours.  We get 
money in big chunks with no knowledge of how long we need to make it 
last.  There is this nagging worry that I could get unlucky for the 
wrong 6 month stretch, and have to lay off everyone.  This worry is 
especially acute during the midst of a tech bust (sponsors dry up even 
for successful projects) which is also during the debugging phase for 
reiser4 (will it be debugged by June, or will it take as long as V3, or 
longer....).

For V3 we are going to fix any bugs that come in (one known bug remains 
that seems to be elusive and will distract our lead programmer from V4 
this month), put in Oleg's write patch and chris's patches, fix fsck 
when it fails, and that is it.  V3 will be our feature frozen FS for 
mission critical servers.

Every resource we have is going to go into getting V4 done and stable so 
that we can sell it in the summer.  Hopefully we will make it.  One 
worry is that while V4 will be much more stable by design (transactions, 
fsck friendly node format with mkfsids and transaction ids (that make it 
easier to figure out when two version of a file collide which one to 
keep), etc.), V3 will be more stable in implementation for quite some time.

>>It must suck having a free project get only slight funding.  All of a
>>sudden a whole load of geeks get very angry and demanding.  I wish I could
>>help, but hey it's more fun to troll.^H^H^H I've got better things to do.
>>    
>>
>
>You are free to donate your hard earned money to them.
>
> - Anders
>
>  
>


-- 
Hans


