From: Yury Umanets <umka@namesys.com>
Subject: Re: Some more questions about Reiser4 ;)
Date: Sat, 10 May 2003 20:09:11 +0400
Message-ID: <3EBD2427.4000806@namesys.com>
References: <001e01c313fd$975e7730$9900a8c0@xpstation> <3EBB9121.5060304@namesys.com> <007201c31709$4f36c5c0$9900a8c0@xpstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14051-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <007201c31709$4f36c5c0$9900a8c0@xpstation>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fred -- Speed Up -- <speedup@free.fr>
Cc: reiserfs-list@namesys.com

Fred -- Speed Up -- wrote:

>Thank you for your answers ;)
>
>You're right, I'd have to read the source code, but I don't really know
>where I can find it : where do you keep the recent snapshots, the only thing
>I've been able to download is your 2.5.60 patch and the february Reiser4
>utilities.
>
2.5.60 is enough. Disk format was not changed substantionaly since it. 
Also you can download reiser4progs and try to find out everything you 
are intersted in there.  You can get it at 
http://thebsh.namesys.com/snapshots/2003.05.10/

>
>  
>
>>Until fsck is done, filesystem cannot be used in production anyway :) We
>>working on fsck now and another tools. If you are intersting, I will
>>send you package or link, it may obtained at.
>>    
>>
>It would be nice if you could sent me the url, thank you ;)
>
http://thebsh.namesys.com/snapshots/2003.05.10/

>
>  
>
>>The parsing the file path is fully VFS' job.
>>    
>>
>Probably ... but the Reiser4 doc specifies a "semantic layer" and a "storage
>layer" : does the semantic layer only consist in VFS resolving path from
>standard Reiser4 directory reading methods based on reading directory
>entries and everytime resolving the whole path reading the Reiser4 physical
>tree ?
>
Storage layer (storage tree) is the tree balanced tree itself (node 
pointer items, keys, items on leaf level, etc).

Semantic layer is more higher level of abstraction which means, that the 
filesystem objects lie on storage level and has some relations with 
parent objects.
Suppose we have path /usr/src/linux. The object "linux" lies inside 
object "src", that is key locality component of the object "linux" the 
same as object id of the object "src".

>Does Reiser4 implement some new ways of resolving paths, as I thought I've
>read in the doc, to convert file paths to keys or does VFS alone achieve
>this ?
>
Filesystems in linux are not supposed to parse paths. When linux VFS is 
parsing a path, it is consulting with corresponding filesystem, in order 
to find needed components. For instance, VFS calls some lookup method of 
the directory object in order to find entry by name in it. And so on.

>When you're speaking of a graph used by the semantic layer, would it be part
>of the VFS caching process ?
>
Probably you mean dentry cache?

>Another thing I could hardly understand : does Reiser4 keep directories
>apart from files so that path can be cached or are they kept with the same
>status normal files got ?
>
I can't understand you.

>
>  
>
>>We should understand the difference between balancing and keeping tree
>>consistent.
>>Tree is consistent if the following rule is hold true: all nodes may be
>>accessed by means of using theirs left delimiting keys.
>>Tree is balanced if all used invariants are hold true (for instance, all
>>nodes are half filled, or all nodes fully filled, etc). Also tree should
>>not be singular.
>>
>>Reiser4 in balancing time (any tree modification) does only care about
>>tree consistency and keeps it in not singular state. Whereas flush does
>>care about invariants (packing, etc).
>>    
>>
>I didn't noticed the difference, thank you for pointing this out. I
>understand the "balancing" process, which is documented on your website,
>meaning packing dirty memory items on flushing, but I don't understand what
>you mean by "tree should not be singular" : 
>

>does this mean a twig should
>contain more than one item ?
>
This means, that tree is as minimal height as possible. Suppose we have 
tree of height 3. Root level (3) contains one item and 2 sevel has  one 
item. This tree is singular. That it is because,  we need only two 
levels in this case. Tree like this is possible in balancing time. Flush 
will care about that in its time.

>The really interesting thing (the mysterious one :-D) is the
>consistency-keeping process. I didn't really understood the left-delimiting
>key concept, I guess it's something like a path in the storage tree,
>
You are right :)

> am I
>right ? 
>

>In a consistent tree, do all the inodes got the same left-delimiting
>key depth ?
>
We do not have inodes in storage tree. We have nodes instead.

Left delimiting key means,  that if node pointer item in the index part 
of tree (levels from tree height through to 2) points to some node, then 
node pointer item key equal to leftmost key of the node node pointer 
points to.

>
>
>Real thank you for your answers Yuri ;)
>
You are welcome.

>I'm going to read my "kernel internals" book to know more about the VFS and
>ext2 handlings, so you can expect some more questions (or answers ;))
>comming :-D
>

>
>Fred
>
>
>
>  
>


-- 
Yury Umanets
"We're flying high, we're watching the world passes by..."



