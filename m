From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Wed, 22 Jun 2005 22:14:52 -0700
Message-ID: <42BA454C.3090500@namesys.com>
References: <20050620235458.5b437274.akpm@osdl.org> <42B831B4.9020603@pobox.com> <42B87318.80607@namesys.com> <20050621202448.GB30182@infradead.org> <42B8B9EE.7020002@namesys.com> <20050622053450.GA28228@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24481-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050622053450.GA28228@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Jeff Garzik <jgarzik@pobox.com>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

Christoph Hellwig wrote:

>
>
>  
>
>>What is wrong with having one file in the FS use a write only plugin, in
>>which the encrypion key is changed with every append in a forward but
>>not backward computable manner, and in order to read a file you must
>>either have a key that is stored on another computer or be reading what
>>was written after the moment of cracking root?
>>    
>>
>
>Because root can read kernel memory this is completely useless :)
>  
>
You missed the point of it rather nicely.  If root can read kernel
memory, that only gets it the appends made after the point in time of
cracking root.


It is not my idea, and it is not yet present in our code, let me not
seem to take credit for it though I think it a good idea.
