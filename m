From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] various allocator optimizations
Date: Wed, 12 Mar 2003 17:00:32 +0300
Message-ID: <3E6F3D80.80306@namesys.com>
References: <1047400482.8215.312.camel@tiny.suse.com>	 <20030311194205.A4493@namesys.com>	 <1047403968.8219.337.camel@tiny.suse.com> <3E6E584D.4080809@namesys.com>	 <1047421551.8219.448.camel@tiny.suse.com> <3E6E674E.4040305@namesys.com>	 <1047433739.8215.487.camel@tiny.suse.com>	 <20030312101222.A8452@namesys.com> <1047475876.8215.507.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13224-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1047475876.8215.507.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Chris Mason wrote:

>On Wed, 2003-03-12 at 02:12, Oleg Drokin wrote:
>
>  
>
>>>>No, it uses the left neighbor in the tree.  Please correct me if I am 
>>>>wrong, because if I am wrong we have a bug.
>>>>        
>>>>
>>>It uses the left neighbor in the tree once the file has a starting
>>>block.  But the first starting block comes by searching from block #0.
>>>      
>>>
>>No, this is not correct.
>>We look at the left neighbor.
>>See the get_left_neighbor() in bitmap.c,
>>first we make the search_start to be a block number of last path
>>element (if there is path at all of course which may be not there in some
>>cases), ans then check if we are allocating indirect block and if there is
>>non zero element in current indirect item in path, if there is non-zero element,
>>we take it as new search_start, otherwise it still contains blocknumber of
>>left neighbor.
>>    
>>
>
>Right, I missed the hint->search_start = bh->b_blocknr for when we don't
>find an indirect item.
>
>This is better, so the search will start from the bh with the stat data
>for a new file, but it depends on the last path element being in a good
>position relative to the rest of the files in the directory.
>
Where other than near the stat data do you propose?

>
>-chris
>
>
>
>
>
>
>  
>


-- 
Hans


