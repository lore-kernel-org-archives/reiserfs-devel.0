From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Tue, 24 Jun 2003 17:19:04 +0400
Message-ID: <20030624131904.GA460@namesys.com>
References: <3EF07AFB.8060303@g-house.de> <20030618152626.GA17240@namesys.com> <3EF0A8E8.2000209@g-house.de> <20030619054535.GA23852@namesys.com> <3EF6AE67.5090502@namesys.com> <20030623090258.GA12259@namesys.com> <3EF6C83F.6060702@namesys.com> <3EF702CC.9050005@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14686-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EF702CC.9050005@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Mon, Jun 23, 2003 at 03:38:20PM +0200, Christian Kujau wrote:

> as stated before, the corruptions occur only on this very alpha machine, 

Well, I still cannot build the kernel myself and still working on it.
(having "make: *** [vmlinux] Error 139" and zero length vmlinux)

BTW, I realised that I have not looked into your kernel config for that box,
can you send it to me please?

> bread: Cannot read the block (523914): (Input/output error).

Hm, but still it means kernel returned some error for read request.

> hah! i was not aware that the disk might have an hw problem, not a 
> single error ever showed up in my logs. this was weird. so i 
> re-partitioned the disk with a 10MB sde (to circumvent the bread error) 
> on the beginning and a 2 GB sde2. now reiserfsck/cp/diff are all working 
> fine under 2.4.21, but 2.5.72 is still erroneous.

Sigh.

> 
> btw: i am still using reiserfsprogs 3.6.8 now (since debian/testing has 
> 3.6.6) and i have compiled these utils under a 2.5.72 kernel. is it safe 
> to use them under 2.4 ?

I see that you have used 2.5.70 and earlier kernels on alpha too.
Do you have any idea of when stuff broke for you?

Bye,
    Oleg
