From: Hans Reiser <reiser@namesys.com>
Subject: Re: Some more questions about Reiser4 ;)
Date: Sat, 10 May 2003 22:43:46 +0400
Message-ID: <3EBD4862.2@namesys.com>
References: <008f01c311bb$a60b70b0$9900a8c0@xpstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14060-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <008f01c311bb$a60b70b0$9900a8c0@xpstation>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fred -- Speed Up -- <speedup@free.fr>
Cc: reiserfs-list@namesys.com, NIKITA DANILOV <nikitadanilov@mail.ru>

Fred -- Speed Up -- wrote:

>
>- Could you please describe the overall structure of Reiser4fs, with a diagram or a little text, where the superblock is, the wandering logs, the storage tree and semantic graph, just sort of a picture of the hard drive to know where and how data and structures are kept and ordered ... ;)
>
Elena, can you draw a diagram or somehow document the disk layout for 
reiser4.  We seem to describe the pieces but not the whole.

>
>- How does your semantic graph work : is it a cache contaning parts of the semantic tree (containing the user-side paths : /foo/bar/...), and updated when the filesystem is being used to reduce paths resolution time and eventually cache some data, resolving path the "old fashion" way when the path is not in the graph, by browsing the storage tree looking for the desired folders and fetching their information, or does the semantic graph allready contain the whole path structure, so that it is not necessary to store directory (I mean, the way VFS understands what a directory is) informations (list of files and subfolders) in the storage tree ?
>
VFS does caching of the semantic graph in something called dcache.  We 
cache data and semantics the same way in the FS without trying to 
understand what is data and what is semantics.  We often discuss how we 
should cache internal nodes of the tree longer than leaf nodes, but I 
think we have not implemented that yet in Reiser4.  Nikita, please look 
into that.

>
>- Considering the semantic graph, as you choose to use a generic graph, you would be able to link paths together to shorten access to some files that are often used : does Reiser4 implement some algorithms that reduces access time to most acceded files (at least path resolution) other than caching paths ? For example, if "/foo/bar/1/2/3/file" file is being used very often, does the semantic graph make a link directly between the root and the file ?
>
No, semantic layers do not concern themselves with access patterns and 
should not.

>
>- How do you keep the storage tree balanced, as it is constantly evolving ? Even with balancing at flush time, some important tree changes would take too much time to rebalance the tree : 
>
I don't agree.

>if this occurs, does the storage tree remain unbalanced, scheduling tree balancing later ? Could you graphically (or with a short text ...) tell how the tree evolves, and what the balancing operation really consists in ?
>
www.namesys.com/v4/v4.html describes the difference between height 
balancing and space usage balancing.  I will be writing more on space 
usage balancing over the coming months.

>
>- When storing really big files, one extent pointer is not enough : 
>
fragmentation not size of the file determines number of extents needed.

>does Reiser4 manage big files the same way ext2 does, with 2-level indirection pointers, storing only the first one in the tree ?
>
no.

> If so, wouldn't this be considered as a Blob behaviour ?
>
>
>Thank you ;)
>
>Fred
>
>  
>


-- 
Hans


