From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Fri, 27 Jun 2003 16:38:00 +0400
Message-ID: <20030627123800.GA9214@namesys.com>
References: <3EF8EFF0.6020207@g-house.de> <20030625054031.GA11576@namesys.com> <3EF9A0F6.4030401@g-house.de> <3EF9E939.1050501@g-house.de> <20030626092608.GA12252@namesys.com> <3EFAE933.6040206@g-house.de> <20030627092821.GA29715@namesys.com> <3EFC361A.4030009@g-house.de> <20030627122556.GA8753@namesys.com> <3EFC396A.7080808@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14730-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EFC396A.7080808@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Fri, Jun 27, 2003 at 02:32:42PM +0200, Christian Kujau wrote:
> >Sigh, I have found what happens. And it will happen on every 64 bit 
> >platform with recent 2.5 kernel.
> >the internal reiserfs blocknumbers were referred to as 'unsigned long', 
> >that's where these
> >extra blocks of zeroes are from, this also explains all other anomalies.
> >Except when I make it 'unsigned int' as it ought to be, it still breaks,
> >only in some other way which I have not understood yet.
> >(yes, I seem to finally got our alpha to some working state and can do 
> >experiments locally now).
> this sound like good news, yes? hm, but when you say on every 64bit 
> platform with recent 2.5 kernels, i wonder again where all the 
> sparc64/ppc64/opteron/itanium guys are to report corruptions...

Nobody uses reiserfs on 64 bit arches on recent 2.5 kernels?
Or may be they have not noticed corruptions yet?

> compiling 2.5.72 with your patch is under way...

Thank you,
this is not needed already.
I was looking in the wrong direction, when I produced that patch,
so it will produce zero output.
I hope to come up with ultimate fix soon enough. ;)

Bye,
    Oleg
