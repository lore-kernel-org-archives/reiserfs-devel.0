From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions
Date: Tue, 24 Jun 2003 19:21:54 +0200
Message-ID: <3EF888B2.4000900@g-house.de>
References: <3EF07AFB.8060303@g-house.de> <20030618152626.GA17240@namesys.com> <3EF0A8E8.2000209@g-house.de> <20030619054535.GA23852@namesys.com> <3EF6AE67.5090502@namesys.com> <20030623090258.GA12259@namesys.com> <3EF6C83F.6060702@namesys.com> <3EF702CC.9050005@g-house.de> <20030624131904.GA460@namesys.com> <3EF86928.7080504@g-house.de> <20030624151940.GC21845@namesys.com>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14687-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030624151940.GC21845@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Oleg Drokin schrieb:
>>>I see that you have used 2.5.70 and earlier kernels on alpha too.
>>>Do you have any idea of when stuff broke for you?
>>
>>hm, i used 2.5.6x kernels too on this machine, but i recognized the 
>>vpf-10680 the first time with 2.5.70.

of course, the best thing i can do is the el-cheapo-hacking approach: 
compiling 2.5.60...up to 2.5.72 and see *when* it breaks. hm, compiling 
a 2.5 kernel takes 180min on this machine. but anyway, i'll start with 
2.5.60 now, see what it gives.

> 
> You are certainly not the one person with alpha and 2.5, but I do not know
> if others are using reiserfs.

you gotta send ads (read: spam) to all the linux-alpha lists :-)

> BTW, have you tried to run with CONFIG_REISERFS_CHECK enabled to see if it will break
> and panic in kernel or something like that?

no, only CONFIG_REISERFS_PROC_INFO, but i'll do so now.

Thanks,
Christian.

