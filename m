From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: Re: fsck.reiser4 problem (was: reiser4 corruption problem)
Date: Tue, 31 Aug 2004 17:04:41 +0200
Message-ID: <41349389.8080308@dermichi.com>
References: <20040831012446.631CB15E2E@mail03.powweb.com>	 <200408311209.43653.IOBuf@gmx.de>	 <1093955415.2716.476.camel@tribesman.namesys.com>	 <200408311603.56537.IOBuf@gmx.de> <1093963404.2716.480.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21161-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093963404.2716.480.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>

> 
> Would you please try with the attached patch.
> 
hooray, i just tried it, your patch fixes my problem! after recompiling 
reiser4progs:

criminal mnt # fsck.reiser4 /dev/sda1
...
***** fsck.reiser4 finished at Tue Aug 31 16:59:05 2004
Closing fs...done

FS is consistent.

i'm planning to move my / partition to reiser4 soon if no other problems 
occur.
kind regards,
Michael
