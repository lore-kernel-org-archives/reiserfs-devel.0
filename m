From: Edward Shishkin <edward@namesys.com>
Subject: Re: [PATCH] Fix Reiser4 Dependencies
Date: Wed, 22 Jun 2005 12:39:44 +0400
Message-ID: <42B923D0.8050700@namesys.com>
References: <20050619233029.45dd66b8.akpm@osdl.org> <200506200832.22260.ajwade@cpe00095b3131a0-cm0011ae8cd564.cpe.net.cable.rogers.com> <42B70A6D.7030308@namesys.com> <200506201644.10429.ajwade@cpe00095b3131a0-cm0011ae8cd564.cpe.net.cable.rogers.com> <42B7F98B.5050405@namesys.com> <42B860D9.60109@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24451-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42B860D9.60109@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Andrew James Wade <ajwade@cpe00095b3131a0-cm0011ae8cd564.cpe.net.cable.rogers.com>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, reiserfs-dev@namesys.com, Reiserfs List <reiserfs-list@namesys.com>

Hans Reiser wrote:

>Edward Shishkin wrote:
>
>  
>
>>Hello,
>>ZLIB_INFLATE/DEFLATE  will be selected by special reiser4 related
>>configuration
>>option "Enable reiser4 compression plugins of gzip family"
>>(REISER4_ZLIB), but
>>since this kind of support was discussed, it is in our working
>>repository for a while..
>>
>>Anyway thanks,
>>Edward.
>>    
>>
>
>I am sorry, are you telling him that it works for you because you have
>code that is different?  Did I misunderstand you?  How is what is in
>your working repository relevant to anybody but you?  Please supply a
>full update patch.
>
>Hans
>
>  
>

1. The patchset reiser4-replacement-broken-out.1 for 2.6.12-rc5-mm2 is 
buggy and leads to compilation errors
2. To fix this one should use the fixed patchset:
   
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.12-rc5-mm2/reiser4-replacement-broken-out.2.tar.gz

Thanks,
Edward.

>
>  
>

