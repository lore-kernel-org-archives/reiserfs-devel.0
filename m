From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 01:43:59 -0700
Message-ID: <412DA2CF.2030204@namesys.com>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <20040825203516.GB4688@backtop.namesys.com> <20040825205149.GA17654@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20594-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040825205149.GA17654@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christoph Hellwig <hch@lst.de>
Cc: Alex Zarochentsev <zam@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, Linus Torvalds <torvalds@osdl.org>, ReiserFS List <reiserfs-list@namesys.com>

Christoph Hellwig wrote:

>On Thu, Aug 26, 2004 at 12:35:17AM +0400, Alex Zarochentsev wrote:
>  
>
>>Reiser4 may have a mount option for whoose who like or have to use traditional
>>O_DIRECTORY semantics.  There would be no /metas under non-directories, if user
>>wants that.
>>    
>>
>
>Again, O_DIRECTORY was added to solve a real-world race, not just for
>the sake of it. 
>
Can you supply more details and we will try to reply concretely?  Thanks.

> If you really want to add that option I'll research the
>CAN number for you so you can named it after that - or just call it -o
>insecure directly.
>
>
>
>  
>

