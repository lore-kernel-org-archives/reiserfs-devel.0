From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions
Date: Sat, 28 Jun 2003 13:59:19 +0200
Message-ID: <3EFD8317.9000009@g-house.de>
References: <3EFC361A.4030009@g-house.de> <20030627122556.GA8753@namesys.com> <3EFC396A.7080808@g-house.de> <20030627123800.GA9214@namesys.com> <20030627161344.GA13908@namesys.com> <3EFC9919.8020308@g-house.de> <20030627211416.GA16091@namesys.com> <3EFCC72F.9020100@g-house.de> <20030628095847.GA19610@namesys.com> <3EFD7FF5.7020305@g-house.de> <20030628115343.GA21256@namesys.com>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14777-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030628115343.GA21256@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Oleg Drokin schrieb:
> Aha, there is "u32 long" in line 593 in fs/reiserfs/bitmap.c file.
> Remove the "long" word and it should compile.

ok, to make sure i've done the right thing, i'll put your patch with 
this change on this webserver.

> Strange enough that it compiles with gcc 2.95 and gcc 3.2.2

hehe 8-)

> Hm, interesting that I compiled gcc 2.95.3 on my alpha and still the kernel
> built with this gcc dies aprox at a time when starting init too (jumps to zero again).

oh, when init starts up, so the options i called were for booting only. 
i never had probs with init...


thanks,
Christian.

