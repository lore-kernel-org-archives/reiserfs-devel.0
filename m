From: David Masover <ninja@slaphack.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 09:41:36 -0500
Message-ID: <43301FA0.7030906@slaphack.com>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl> <432E5024.20709@namesys.com> <20050920075133.GB4074@elf.ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26125-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050920075133.GB4074@elf.ucw.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pavel Machek <pavel@suse.cz>
Cc: Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Pavel Machek wrote:
> Hi!
> 
> 
>>V3 is obsoleted by V4 in every way.  V3 is old code that should be
>>marked as deprecated as soon as V4 has passed mass testing.   V4 is far
>>superior in its coding style also.  Having V3 in and V4 out is at this
>>point just stupid. 
> 
> 
> Really? Last time I checked, even V3's fsck was not too great. [In
> fact I never could make it run stable enough to even _test_ it
> properly].
> 
> Do you have working fsck for V4?

Already saved me once.  But then, I should have had backups.

And personally, if it was my FS, I'd stop working on fsck after it was 
able to "check".  That's what it's for.  To fix an FS, you wipe it and 
restore from backups.
