From: Kevin Bealer <kevinbealer@yahoo.com>
Subject: Re: Split Trees (my design, similar to binary treaps)
Date: Sat, 7 Jun 2003 22:17:00 -0700 (PDT)
Message-ID: <20030608051700.50169.qmail@web40015.mail.yahoo.com>
References: <3EDDBF85.6000905@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14490-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EDDBF85.6000905@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: "Alexander G. M. Smith" <agmsmith@rogers.com>, reiserfs-list@namesys.com


--- Hans Reiser <reiser@namesys.com> wrote:
> Kevin Bealer wrote:
> 
> >>Hans Reiser <reiser@namesys.com> wrote:
> >>Kevin Bealer wrote:
> >>
> >>    
> >>
> >>>Sorry, last message was accidentally sent
> >>>      
> >>>
> >>prematurely.
> >>    
> >>
> >>>To continue:
> >>>
> >>>Skip lists (turned 90 degrees) look like:
> >>>
> >>>topnode--x------x
> >>>C0
> >>>A1-----A1-----A1
> >>>C2
> >>>C3
> >>>B4-----B4
> >>>C5
> >>>A6-----A6-----A6
> >>>C7
> >>>C8
> >>>B9-----B9
> >>>C11
> >>>A12----A12----A12
> >>>
> >>>With pointers vertically between all aligned
> >>>      
> >>>
> >>letters
> >>    
> >>
> >>>(conceptually at least).
> >>>
> >>>      
> >>>
> >>I don't understand the diagram above, which means
> I
> >>don't understand the 
> >>rest.  I think you are explaining something you
> >>understand too well to 
> >>explain....;-)
> >>    
> >>
> >
> >
> >Yes, probably.  Sorry about that;  I was trying to
> >make a diagram that works with variable sized type.
> >
> >Each line of the diagram is a node of the skip
> list.
> >
> >The 'topnode' is the header of the skip list, which
> >typically looks like a skip node of the maximum
> >node size with no data.
> >
> >Nodes with one pointer are 'C#' here, nodes with
> >two pointers are 'B#', nodes with three are 'A#'.
> >The '#' is the data value of the node (or the key,
> >if it is a multiset).
> >
> >In the skip list, node A1 is a node with three
> >pointers, to C1, B2, and A6.
> >
> 
> C1 and B2 are not in your diagram....
> 

Sorry, it should read C2, B4, and A6.

> >  Each of these must
> >have a value greater or equal to A1, to preserve
> >the invariant, which is that the list at each
> >level is an ordered list.  In this case the list
> >at level 3 is the list containing A's and chained
> >in the third pointer.  The list using the second 
> >pointer contains A's, and B's.  The list at the
> >first level, represented here as character column
> >1 in the diagram, is the first level list, it 
> >contains all the nodes.
> >
> >The argument I am making is not essential, it is
> >only that some of these pointers are unnecessary,
> >which leads to the Split Tree.
> >
> >A different organization of pointers, and we have
> >the same search ORDER, but with slightly different
> >internal connections; plus all nodes are the same
> >size, and all normal 'binary tree' based algorithms
> >work as expected.
> >
> >If you understand the Skip List, you can see every
> >location where a decision is made by comparing the
> >search value to the value of a node.  Running
> through 
> >these by hand, I was able to use these decisions as
> >binary tree traversal decisions, and create a
> binary
> >tree that has the same traversal behavior as a skip
> >list.
> >
> >In doing so, I realized that the pointers which
> were
> >from a low level node to a high level node are not
> >consulted.  It looks good to have them because then
> >we have a set of ordered lists at each level, but
> >they don't actually get traversed in searches.
> >
> >Anyway, its sort of a 'theory' argument to explain
> >why Split Tree is possible even though it seems
> like
> >you can't safely do this to a Skip List.
> >
> >Does that help or am I still babbling? ;)
> >
> >Kevin
> >
> >  
> >
> >>>Now here is the reason why SkipTrees do NOT need
> >>>variable sized nodes:
> >>>
> >>>The Pointer from A1 to A6 is used, so is the
> >>>      
> >>>
> >>pointer
> >>>from A1 to B4 and from B4 to C5.
> >>    
> >>
> >>>However, the pointers from C2 and C3 to B4, B4 to
> >>>      
> >>>
> >>A6,
> >>    
> >>
> >>>and B9 to A12 are NEVER USED for example.  You
> are
> >>>sacrificing
> >>>pointers to get to a binary tree, but the
> pointers
> >>>      
> >>>
> >>you
> >>    
> >>
> >>>lose
> >>>are the pointers you don't need anyway.
> >>>
> >>>In SkipList, you need those pointers only to copy
> >>>their value to
> >>>other pointers which will not be used.  The nodes
> >>>can't shrink,
> >>>because an insertion changes which pointers are
> >>>      
> >>>
> >>used
> >>    
> >>
> >>>and which
> >>>are not.
> >>>
> >>>If * is a wildcard, the rule is:
> >>>
> >>>No pointer from C* to B* or B* to A* is ever
> used. 
> >>>      
> >>>
> >>If
> >>    
> >>
> >>>you were
> >>>going to get to A6, you would have gotten there
> >>>      
> >>>
> >>while
> >>    
> >>
> >>>traversing
> >>>the "A" list, and if you are at the C list level,
> >>>      
> >>>
> >>you
> >>    
> >>
> >>>have already left 
> >>>the A and B lists behind.
> >>>
> >>>To convert a Skip List to a Skip Tree, note that
> >>>      
> >>>
> >>every
> >>    
> >>
> >>>decision
> >>>you need to make is based on a NODE->VALUE
> >>>      
> >>>
> >>comparison.
> >>    
> 
=== message truncated ===


__________________________________
Do you Yahoo!?
Yahoo! Calendar - Free online calendar with sync to Outlook(TM).
http://calendar.yahoo.com
