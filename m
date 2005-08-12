From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 on 2.6.13-rc6-realtime-preempt
Date: Fri, 12 Aug 2005 13:05:33 +0400
Message-ID: <42FC665D.4030802@namesys.com>
References: <20050811224503.7dbd67dd@SiRiUS.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25422-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050811224503.7dbd67dd@SiRiUS.home>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: gimpel <gimpel@sonnenkinder.org>
Cc: reiserfs-list@namesys.com

Hello

gimpel wrote:
> Hello!
> 
> I'm trying to compile a recent 2.6.13-rc6 with realtime-preempt-2.6.13-
> rc4-RT-V0.7.53-02 and want to add reiser4. 2.6.12-rt hardlocked very
> often here.

Which patches did you use?

> I managed to fix up the DEFINE_SPINLOCK and compat_semaphore wait;
> changes by taking a look on the changes between reiser4 for 2.6.12
> and 2.6.12-rt and it first seems to compile fine but ends up with:
> 
> ----8<------
> 
>   CC      init/version.o
>   LD      init/built-in.o
>   LD      .tmp_vmlinux1
> fs/built-in.o(.text+0x92999): In function `reiser4_put_super':
> : undefined reference to `rcu_barrier'

reiser4 depends on several core kernel patches. I think you did not apply them.
You might want to try to apply this patch
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.12/reiser4-for-2.6.12-realtime-preempt-2.6.12-final-V0.7.51-29.patch.gz
It contains all necessary patches already.

> fs/built-in.o(.text+0x929a9): In function `reiser4_put_super':
> : undefined reference to `rcu_barrier'
> fs/built-in.o(.text+0x97989): In function `_done_sinfo':
> : undefined reference to `rcu_barrier'
> fs/built-in.o(.text+0x97d76): In function `_done_formatted_fake':
> : undefined reference to `rcu_barrier'
> fs/built-in.o(.text+0x97d86): In function `_done_formatted_fake':
> : undefined reference to `rcu_barrier'
> make: *** [.tmp_vmlinux1] Fehler 1
> 
> ----->8-----
> 
> Maybe some has managed to fix that or knows how to do so and is willing
> to help me. My C knowledge is still too limited...
> 
> regards and thanks in advance
> tom
> 

