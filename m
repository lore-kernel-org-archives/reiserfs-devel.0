From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 10:46:04 -0700
Message-ID: <43304ADC.7000603@namesys.com>
References: <200509180934.50789.chriswhite@gentoo.org>	<432FC150.9020807@namesys.com>	<20050920114253.GL10845@suse.de>	<200509201530.01808.l.allegrucci@gmail.com> <17200.5343.908617.558388@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17200.5343.908617.558388@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Lorenzo Allegrucci <l.allegrucci@gmail.com>, Nick Piggin <nickpiggin@yahoo.com.au>, Alan Cox <alan@lxorguk.ukuu.org.uk>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, lkml <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Nate Diller <ndiller@namesys.com>

Nikita Danilov wrote:

>Lorenzo Allegrucci <l.allegrucci@gmail.com> writes:
>
>[...]
>
>  
>
>>Why not just rename the kernel option "elevator" to "iosched" ?
>>    
>>
>
>At least update Documentation/kernel-parameters.txt to be consistent,
>but I think kernel boot options are considered to be a part of the "user
>space API" and, as such, cannot be changed that easily.
>
>Nikita.
>
>
>  
>
You could make both names work, and then deprecate "elevator".....
