From: Hans Reiser <reiser@namesys.com>
Subject: Re: binary treaps
Date: Thu, 08 May 2003 01:57:35 +0400
Message-ID: <3EB9814F.6070405@namesys.com>
References: <20030507214245.73383.qmail@web40013.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13994-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030507214245.73383.qmail@web40013.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kevin Bealer <kevinbealer@yahoo.com>
Cc: reiserfs-list@namesys.com, jmacd <jmacd@cs.berkeley.edu>

Kevin Bealer wrote:

>On the namesys homepage, there is a statement that
>skip lists
>would be very good for directory contents but the node
>size
>varies.
>
>I wrote a balanced tree algorithm that works about
>like a skip
>list but does not have variable node size.  I started
>with the 'skip
>list' algorithm and developed a tree algorithm based
>on it.
>
>After developing this, I found an algorithm which is
>similar, called a 'treap', although they use an
>insert-then-rotate, and
>my version does the insert in one downward pass.
>
>I don't know enough about reiserfs's internals but I
>can send the
>tree algorithm description and code if anyone wants to
>see it.
>
>Kevin Bealer
>
>
>
>__________________________________
>Do you Yahoo!?
>The New Yahoo! Search - Faster. Easier. Bingo.
>http://search.yahoo.com
>
>
>  
>
Josh (jmacd) said that he did that also, but perhaps I did not listen 
carefully enough because I did not understand how it could be done.  If 
you randomly choose whether to insert into a given node or its children, 
how do you avoid randomly exceeding a fixed node size without 
balancing?   I must be misunderstanding one of the premises of the 
algorithm, or some such.

Yes, I would be interested in reading the algorithm description.

-- 
Hans


