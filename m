From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser4 documentation & specifically current status of repacker,
 compression, and semantics
Date: Thu, 27 Oct 2005 17:48:56 +0400
Message-ID: <4360DAC8.9060507@namesys.com>
References: <200510231850.45209.jgilmore@glycou.com> <200510241225.45686.jgilmore@glycou.com> <435D3110.8060204@namesys.com> <200510241345.17620.jgilmore@glycou.com> <435D4DF5.4090602@namesys.com> <435E8237.5050304@namesys.com> <435EADEB.9090402@namesys.com> <435F89E5.4000303@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26687-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <435F89E5.4000303@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: John Gilmore <jgilmore@glycou.com>, reiserfs-list@namesys.com

Edward Shishkin wrote:

> Hans Reiser wrote:
>
>>  Particularly, define whether large
>> files that cannot be compressed get stored using extents and everything
>> else that regular files use.
>>
>>  
>>
>
> Currently files powered by cryptcompress file plugin have its data 
> stored only in the
> items of CTAIL_ID
>
>> Also, I thought we convert at first flush time, not at every flush
>> time.  Did you write it to check at every flush?
>
>
> no, just turning off and no anymore check, but it can be easily changed
>
>> Not entirely sure we
>> want to do that for large multimedia files that are compressed by
>> hardware, it could add a bunch of CPU, and I would think it would be
>> more complex code, because now you have to convert extents, etc.
>>
>
> Yes, such converting seems to be a complicated workaround. We will need
> something like "clustered extents"
>

So having such "cextents" instead of incompressible ctails on leaf level
will reduce (/=2 times) memory usage and response to emergency flush
(currently there are no any chances for cryptcompress files to be 
eflushed).

Edward.

