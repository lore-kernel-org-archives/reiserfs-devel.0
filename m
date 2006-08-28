From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser4 und LZO compression
Date: Mon, 28 Aug 2006 22:05:48 +0400
Message-ID: <44F3307C.8070704@namesys.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>	<20060827010428.5c9d943b.akpm@osdl.org>	<44F16923.9050609@slaphack.com> <20060828193401.5232e23c@holly.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29713-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060828193401.5232e23c@holly.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jindrich Makovicka <makovick@gmail.com>
Cc: David Masover <ninja@slaphack.com>, Andrew Morton <akpm@osdl.org>, Alexey Dobriyan <adobriyan@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Jindrich Makovicka wrote:
> On Sun, 27 Aug 2006 04:42:59 -0500
> David Masover <ninja@slaphack.com> wrote:
> 
> 
>>Andrew Morton wrote:
>>
>>>On Sun, 27 Aug 2006 04:34:26 +0400
>>>Alexey Dobriyan <adobriyan@gmail.com> wrote:
>>>
>>>
>>>>The patch below is so-called reiser4 LZO compression plugin as
>>>>extracted from 2.6.18-rc4-mm3.
>>>>
>>>>I think it is an unauditable piece of shit and thus should not
>>>>enter mainline.
>>>
>>>Like lib/inflate.c (and this new code should arguably be in lib/).
>>>
>>>The problem is that if we clean this up, we've diverged very much
>>>from the upstream implementation.  So taking in fixes and features
>>>from upstream becomes harder and more error-prone.
>>
>>Well, what kinds of changes have to happen?  I doubt upstream would
>>care about moving some of it to lib/ -- and anyway, reiserfs-list is
>>on the CC.  We are speaking of upstream in the third party in the
>>presence of upstream, so...
> 
> 
> The ifdef jungle is ugly, and especially the WIN / 16-bit DOS stuff is
> completely useless here.
> 

I agree that it needs some brushing,
putting in todo..


> 
>>Maybe just ask upstream?
> 
> 
> I am not sure if Mr. Oberhumer still cares about LZO 1.x, AFAIK he now
> develops a new compressor under a commercial license.
> 
> Regards,

