From: Hans Reiser <reiser@namesys.com>
Subject: Re: 2.6.9-mm1
Date: Fri, 22 Oct 2004 10:26:24 -0700
Message-ID: <417942C0.7070301@namesys.com>
References: <20041022032039.730eb226.akpm@osdl.org> <20041022103910.GB17526@infradead.org> <20041022035400.28131d76.akpm@osdl.org> <20041022110846.GA17866@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22128-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041022110846.GA17866@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christoph Hellwig <hch@infradead.org>
Cc: Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Christoph Hellwig wrote:

>On Fri, Oct 22, 2004 at 03:54:00AM -0700, Andrew Morton wrote:
>  
>
>>>Your tree also has various rejected core changes for it still.
>>>      
>>>
>>Which were they?
>>    
>>
>
>reiser4-aliased-dir.patch
>reiser4-allow-drop_inode-implementation.patch
>reiser4-export-inode_lock.patch
>reiser4-kobject-umount-race.patch
>reiser4-unstatic-kswapd.patch
>
>
>I'm not completely sure what problems the following one could
>cause (or rather which problems of the scheme it's needed for
>it doesn't solve):
>
>reiser4-reget-page-mapping.patch
>
>  
>
zam and vs will respond tomorrow most likely, the day has ended in Moscow.
