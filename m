From: Kevin Bealer <kevinbealer@yahoo.com>
Subject: Re: Split Trees (my design, similar to binary treaps)
Date: Tue, 3 Jun 2003 21:54:11 -0700 (PDT)
Message-ID: <20030604045411.39217.qmail@web40011.mail.yahoo.com>
References: <3EDB8A80.50306@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14388-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EDB8A80.50306@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>, ReiserFS <reiserfs-list@namesys.com>


Sorry, I misspoke.  A SkipTree contains two pointers
down, a number from 1 to L, plus the data.  Fanout is
two, the 'third pointer' is really L, which probably
won't have to be larger than one byte (but would be
aligned to pointer size in practice.)

Normally, N would be no more than the log based 2 of
the max number of elements.  One byte should therefore
be enough for 2^256 elements.

Kevin

--- Hans Reiser <reiser@namesys.com> wrote:
> Kevin Bealer wrote:
> 
> >As Alexander said, data can be in the node or
> >elsewhere in
> >either a skip list or skip tree.  Skip List nodes
> are
> >variable
> >sized; skip tree nodes are uniform, three pointers
> +
> >data.
> >(Unless the data is variable sized).
> >
> >Skip Lists look like:
> >
> >XX-----X-----X
> >X--X--X--X--X--X--X--X
> >
> >
> >--- "Alexander G. M. Smith" <agmsmith@rogers.com>
> >wrote:
> >  
> >
> >>Hans Reiser wrote on Fri, 23 May 2003 02:48:05
> >>+0400:
> >>    
> >>
> >>>Do nodes contain both pointers and data?
> >>>      
> >>>
> >>Yes, that's a common way of doing skip lists.  Or
> >>the node could contain
> >>the level pointers and a data pointer.  The nodes
> >>are also awkwardly
> >>variable sized due to the random number of levels.
> 
> >>That leads to
> >>allocation fragmentation unless extra steps are
> >>taken.
> >>
> >>I don't know how the split trees approach does it.
> >>
> >>- Alex
> >>    
> >>
> >
> >
> >__________________________________
> >Do you Yahoo!?
> >The New Yahoo! Search - Faster. Easier. Bingo.
> >http://search.yahoo.com
> >
> >
> >  
> >
> So the fanout of a skip tree is 3?  (Just got back
> from Italy.....)
> 
> -- 
> Hans
> 
> 


__________________________________
Do you Yahoo!?
Yahoo! Calendar - Free online calendar with sync to Outlook(TM).
http://calendar.yahoo.com
