From: Hans Reiser <reiser@namesys.com>
Subject: Re: issues related to writing a file in reiser4
Date: Thu, 24 Mar 2005 10:08:36 -0800
Message-ID: <42430224.8050708@namesys.com>
References: <20050323172635.51889.qmail@web60104.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050323172635.51889.qmail@web60104.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pallavi Dalya <pallavidalya@yahoo.com>
Cc: reiser-list mailing <reiserfs-list@namesys.com>

Pallavi Dalya wrote:

> hello,
>   By doing debugfs on reiser4 and studying it I understand that the
> disk block address of the root node of on-disk tree as well as the
> complete on-disk tree gets  changed due to the creation of extent pointer.
> For example:: suppose the root node is initally created at disk block
> 23. And the other nodes of the tree are say 24,25,26. Now suppose a
> extent gets created. This extent  has a length of 30 disk blocks.So
> now according to my observation the extent starts from disk block
> number 23 and extends till disk block number (23+30)53. and now the
> root node of the tree starts from block number 54..and the other nodes
> of the tree starts from 55,56,57 respectively.
> This means that whenever an extent is created the extents are stored
> and then the on-disk tree is stored to maintain locality of space.
> What is the advantage of such a policy???Isn't it shear overhead?

Sheer overhead compared to what?  I don't understand the question well.

>      Secondly when a file is created its entry has to be made in its
> respective directory i.e. in the directory entry item. The file is
> assigned the key which is the value that the field "next-oid" in the
> super block holds. But no matter when the file is created or what key
> it is assigned it is stored alphabetically in the tree. Even the stat
> data and the tail item of the respective file are inserted
> alphabetically. What is the use of alphabetical insertion? Is this
> useful in anyway during searching?

If directory entries and file bodies are stored in the same order, then
it creates a dramatic performance improvement for when accessing things
in readdir order.

>       Also if files are stored alphabetically and not according to the
> key order.Since the keys are generated sequentially but files are
> stored alphabetically the keys appear to be in random order on the
> disk. In this case how can the concept of delimiting keys be used???

I don't understand the question.  File body parts are stored by key. 
Keys include the filename as one component unless it is more than 15 (or
16, can't remember....) characters.

> regards,
> pallavi
> ------------------------------------------------------------------------
> * Yahoo! Messenger*
> <http://uk.rd.yahoo.com/mail/tagline_messenger/*http://uk.messenger.yahoo.com>
> - Communicate instantly..."Ping" your friends today! *Download
> Messenger Now*
> <http://uk.rd.yahoo.com/mail/tagline_messenger/*http://uk.messenger.yahoo.com/download/index.html>



