From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiser4 O_DIRECT
Date: Fri, 20 May 2005 12:42:06 +0400
Message-ID: <1116578526.3532.463.camel@tribesman.namesys.com>
References: <1116525192.29446.5.camel@zion>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24090-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1116525192.29446.5.camel@zion>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin Piayda <martin.piayda@udo.edu>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2005-05-19 at 21:53, Martin Piayda wrote:
> Hi,
> I'm missing O_DIRECT support in the current Reiser4 implementation (up
> to Kernel 2.6.12-rc4-mm).
> Calling sys_open(myfile, O_RDWR | O_DIRECT, 0) fails with -22.
> 
> Is this support planned, did I miss something, should I get my own
> patches? ReiserFS seems to work with O_DIRECT, but not Reiser4, so I
> wondered why not.
> 

reiser4 has not O_DIRECT support yet.
It will be added when the below are done:
1. reiser4 does not crash in our internal stress tests
2. there are no core linux patches reiser4 depends on and lkml objects
against
3. reiser4 has stable performance

Unfortunately, I can not estimate when those problems will be addressed

> Regards,
> Martin
> 
> 

