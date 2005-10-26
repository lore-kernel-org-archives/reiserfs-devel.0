From: Edward Shishkin <edward@namesys.com>
Subject: Re: Reiser4 documentation & specifically current status of repacker,
 compression, and semantics
Date: Wed, 26 Oct 2005 17:51:33 +0400
Message-ID: <435F89E5.4000303@namesys.com>
References: <200510231850.45209.jgilmore@glycou.com> <200510241225.45686.jgilmore@glycou.com> <435D3110.8060204@namesys.com> <200510241345.17620.jgilmore@glycou.com> <435D4DF5.4090602@namesys.com> <435E8237.5050304@namesys.com> <435EADEB.9090402@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26654-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <435EADEB.9090402@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: John Gilmore <jgilmore@glycou.com>, reiserfs-list@namesys.com

Hans Reiser wrote:

>Edward Shishkin wrote:
>
>  
>
>>Hans Reiser wrote:
>>
>>    
>>
>>>John Gilmore wrote:
>>>
>>>      
>>>
>>>>So the first beta of compression will only have the option to
>>>>control it at mkfs time?
>>>>
>>>>  
>>>>        
>>>>
>>>It should be explained that on the first flush to disk of a new file the
>>>default compress plugin will test to see if the first 64k is
>>>compressable, and if it is not then it converts the file to a regular
>>>file plugin.
>>>
>>> 
>>>
>>>      
>>>
>>a little correction:
>>this is a compression transform plugin that is converted at flush
>>time, not file plugin
>>
>>    
>>
>Please define in more detail please.
>

http://www.namesys.com/cryptcompress_design.html
"Handling incompressible data"
and
http://www.namesys.com/cryptcompress-related_plugins.html
"Compression mode plugin"

>  Particularly, define whether large
>files that cannot be compressed get stored using extents and everything
>else that regular files use.
>
>  
>

Currently files powered by cryptcompress file plugin have its data 
stored only in the
items of CTAIL_ID

>Also, I thought we convert at first flush time, not at every flush
>time.  Did you write it to check at every flush? 
>

no, just turning off and no anymore check, but it can be easily changed

> Not entirely sure we
>want to do that for large multimedia files that are compressed by
>hardware, it could add a bunch of CPU, and I would think it would be
>more complex code, because now you have to convert extents, etc.
>

Yes, such converting seems to be a complicated workaround. We will need
something like "clustered extents"


>  I
>would be concerned that if you always have to check for compression with
>every little write to a file, the cost of that check will be substantial
>for many purposes.
>
>  
>

Since compression is going per cluster, we can consider a set of nominated
clusters as a pattern to check if we need to turn compression off[on] 
for the
whole file. Say, if the clusters of indexes #(N*k), k=0, 1, 2, ...  are
incompressible[compressible], then turn compression off[on].
The smaller N - the more substantial cost of check in the case when 
compression is off.

>Hans
>
>
>  
>
