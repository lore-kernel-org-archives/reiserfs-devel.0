From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: [OT] Re: ReiserFS problems
Date: Fri, 08 Aug 2003 15:06:38 +0200
Message-ID: <3F33A05E.3030301@gmx.net>
References: <20030806182055.A28562@bitwizard.nl>	<3F3252A4.4010104@namesys.com>	<20030807181227.GA23303@matchmail.com>	<200308081018.31525.russell@coker.com.au>	<3F338990.3040506@g-house.de> <16179.39482.567511.102156@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15250-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16179.39482.567511.102156@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Christian Kujau <evil@g-house.de>, reiserfs-list@namesys.com

Nikita Danilov wrote:
> Christian Kujau writes:
>  > Russell Coker wrote:
>  > > system for storing a file-system image.  If you use an XOR encryption method 
>  > > it won't even hurt performance either.  :-#
>  > 
>  > sorry to hop in here, but i don't understand why an algorithm like "XOR" 
>  > is named "encryption" at all. isn't it that another XOR operation just 
>  > delivers the cleartext again?
> 
> "XOR encryption" xors consequent bytes of data being encrypted (in our
> case blocks of loop device) with consequent bytes of user supplied key
> (password). For all reasonable sizes of the key, this is surely only
> marginally safer than no encryption at all, because, for instance, file
> block devices usually contains a lot of zero-filled blocks, and xoring
> key with zeroes will give you key.

Yeah, but we don't know if we will say something similar about AES in 50
years. Besides that, if you look at different cryptoloop implementations,
you will notice that some of them (AFAIK the affected versions are no
longer used) use the same IV for every block they encrypt, thus giving
identical ciphertext blocks for identical plaintext blocks. That doesn't
necessarily give you the key when you look at ciphertext blocks where the
plaintext is supposed to be zero-filled (it NEVER should if your algorithm
is worth anything) but still gives you strong hints about the filesystem
type which was encrypted. Knowing the filesystem type, you know more parts
of the plaintext and thus can start cryptanalysis. However, all current
algorithms are designed to withstand this type of attack.

> 
>  > 
>  > a     b             a
>  > 
>  > 0 XOR 1 = 1 XOR b = 0
>  > 1 XOR 0 = 1 XOR b = 1
>  > 1 XOR 1 = 0 XOR b = 1
>  > 0 XOR 0 = 0 XOR b = 0
>  > 
>  > 
>  > but i don't have to explain that to you...
>  > 
>  > thanks,
>  > Christian.
> 
> Nikita.

Regards,
Carl-Daniel

-- 
Usual disclaimers apply. Satisfaction guaranteed: You would get your money
back if you had paid me for writing this.

