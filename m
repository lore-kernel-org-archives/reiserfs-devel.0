From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions
Date: Fri, 27 Jun 2003 14:32:42 +0200
Message-ID: <3EFC396A.7080808@g-house.de>
References: <20030624151940.GC21845@namesys.com> <3EF888B2.4000900@g-house.de> <3EF8EFF0.6020207@g-house.de> <20030625054031.GA11576@namesys.com> <3EF9A0F6.4030401@g-house.de> <3EF9E939.1050501@g-house.de> <20030626092608.GA12252@namesys.com> <3EFAE933.6040206@g-house.de> <20030627092821.GA29715@namesys.com> <3EFC361A.4030009@g-house.de> <20030627122556.GA8753@namesys.com>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14729-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030627122556.GA8753@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Oleg Drokin schrieb:
> Sigh, I have found what happens. And it will happen on every 64 bit platform with recent 2.5 kernel.
> the internal reiserfs blocknumbers were referred to as 'unsigned long', that's where these
> extra blocks of zeroes are from, this also explains all other anomalies.
> Except when I make it 'unsigned int' as it ought to be, it still breaks,
> only in some other way which I have not understood yet.
> (yes, I seem to finally got our alpha to some working state and can do experiments locally now).
> 

this sound like good news, yes? hm, but when you say on every 64bit 
platform with recent 2.5 kernels, i wonder again where all the 
sparc64/ppc64/opteron/itanium guys are to report corruptions...

compiling 2.5.72 with your patch is under way...

thank you Oleg,
Christian.

