From: "Fred -- Speed Up --" <speedup@free.fr>
Subject: Re: Some more questions about Reiser4 ;)
Date: Sat, 10 May 2003 19:39:17 +0200
Message-ID: <000201c31721$3aca6c50$9900a8c0@xpstation>
References: <001e01c313fd$975e7730$9900a8c0@xpstation> <3EBB9121.5060304@namesys.com> <007201c31709$4f36c5c0$9900a8c0@xpstation> <3EBD2427.4000806@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14058-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Storage layer (storage tree) is the tree balanced tree itself (node
> pointer items, keys, items on leaf level, etc).
> Semantic layer is more higher level of abstraction which means, that the
> filesystem objects lie on storage level and has some relations with
> parent objects.
> Suppose we have path /usr/src/linux. The object "linux" lies inside
> object "src", that is key locality component of the object "linux" the
> same as object id of the object "src".
Now the semantic layer handles with all the key stuff, being the link
between the storage layer and VFS, and a convenient tool for plugin
purposes, and the storage layer rules in-depth operations as files read and
write and the tree hanlding, am I right ?

> Filesystems in linux are not supposed to parse paths. When linux VFS is
> parsing a path, it is consulting with corresponding filesystem, in order
> to find needed components. For instance, VFS calls some lookup method of
> the directory object in order to find entry by name in it. And so on.
I just read my kernel book, in the VFS section, I hopelly won't ask you such
silly questions anymore :-D

> >When you're speaking of a graph used by the semantic layer, would it be
part
> >of the VFS caching process ?
> Probably you mean dentry cache?
Should be ;)
VFS seems to be very intrusive (I mean, it does a lot of the file-handling
process) ... doesn't it limit your initiatives in implementing new
structures ?

> >Another thing I could hardly understand : does Reiser4 keep directories
> >apart from files so that path can be cached or are they kept with the
same
> >status normal files got ?
> I can't understand you.
The reason why I asked this was because I didn't knew that VFS was the one
and only responsible for the path resolving ;)

> >I didn't noticed the difference, thank you for pointing this out. I
> >understand the "balancing" process, which is documented on your website,
> >meaning packing dirty memory items on flushing, but I don't understand
what
> >you mean by "tree should not be singular" :
> >does this mean a twig should
> >contain more than one item ?
> This means, that tree is as minimal height as possible. Suppose we have
> tree of height 3. Root level (3) contains one item and 2 sevel has  one
> item. This tree is singular. That it is because,  we need only two
> levels in this case. Tree like this is possible in balancing time. Flush
> will care about that in its time.
OK, now how do you balance the tree when items are deleted, or added ? This
operation must be very complex, as you don't have enough time to rebalance
the whole tree on every commit considering performance issues. I read tree
balancing (I mean keeping it consistent ;)) was done periodically, you're
saying it's done at flush time, but how can you achieve such a complex
operation in short enough time not to affect performance ?

> >The really interesting thing (the mysterious one :-D) is the
> >consistency-keeping process. I didn't really understood the
left-delimiting
> >key concept, I guess it's something like a path in the storage tree
> You are right :)
You can't guess how happy I am ||:-D

> >In a consistent tree, do all the inodes got the same left-delimiting
> >key depth ?
> >
> We do not have inodes in storage tree. We have nodes instead.
>
> Left delimiting key means,  that if node pointer item in the index part
> of tree (levels from tree height through to 2) points to some node, then
> node pointer item key equal to leftmost key of the node node pointer
> points to.
All right ;)


Thank you,
Fred

