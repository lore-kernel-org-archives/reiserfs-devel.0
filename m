From: Yury Umanets <umka@namesys.com>
Subject: Re: Some more questions about Reiser4 ;)
Date: Fri, 09 May 2003 15:29:37 +0400
Message-ID: <3EBB9121.5060304@namesys.com>
References: <001e01c313fd$975e7730$9900a8c0@xpstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14042-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <001e01c313fd$975e7730$9900a8c0@xpstation>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fred -- Speed Up -- <speedup@free.fr>
Cc: reiserfs-list@namesys.com

Fred -- Speed Up -- wrote:

>What about me :-D
>
>----- Original Message ----- 
>From: "Fred -- Speed Up --" <speedup@free.fr>
>To: <reiserfs-list@namesys.com>
>Sent: Saturday, May 03, 2003 11:33 PM
>Subject: Some more questions about Reiser4 ;)
>
>
>I posted one week ago some questions about Reiser4. I've just read your
>answers and I'll firstly want to thank all of the people developing Reiser4
>and answering on the mailing list ;)
>
>Thanks to Oleg I could understand what the object id stands for outside the
>FS. And parent id should be the part of the key related to what the
>file/item is related to : 
>

>when we consider some file's attribute, it's
>stored in a separate object which has a single object id but whose parent id
>is the object id of the file it's related to, am I right?
>
First of all, you should consider about object in reiser4 as abput as 
file, directory, symlinks, etc. Each object contains one or more items:
(1) Regular file contains stat data item, and not limited number of file 
body items. File body items are extents and tails. Empty file (size == 
0) contains only stat data item.
(2) Directory contains stat data item and not limited number of 
directory body items. Directory item contains directory entries, theirs 
hashes, keys of teh object entries point to.
(3) Symlink contains only stat data item (in the current implementation 
of the symlink40 plugin). If you like another symlink organization, you 
will probably intersting in writting your own symlink plugin

Each item of an object may be found by its key. The object id of the 
item is the same as object id of the file, it belongs to. Thus, in such 
a case all parts of some file may be found inside reiser4 tree.

Each object have its attributes.  But currently all object attributes 
are supposed to be stored inside stat data item of the object. And 
ofcourse attributes do not have own key.

> And a file should
>behave the same way with its parent directory (this is likely to be a main
>concept of Reiser4 : objects are both files and folders).
>

>Now an inode number identifies a physical file or folder considered from VFS
>(not an attribute or any metadata Reiser4 is implementing), it's the object
>id for the main file, from which we can get the attribute and/or the
>subfolders wether it is a directory or not.
>

>
>Hans Reiser informed me about the release date :-D. Can you evaluate the
>developement stage, are you still implementing features or rather getting
>the software stable, or even doing tweaking stuff ... the website announces
>June 2003 : I'm pretty sure it won't be ready that soon :-D. I know
>developing such a project takes time, and the release date is not such an
>important thing as soon as it is released stable, powerfull and fast ;)
>
Until fsck is done, filesystem cannot be used in production anyway :) We 
working on fsck now and another tools. If you are intersting, I will 
send you package or link, it may obtained at.

>
>
>Now I got some question still remaining unanswered :
>
>- Could you please describe the overall structure of Reiser4fs, with a
>diagram or a little text, where the superblock is, the wandering logs, the
>storage tree and semantic graph, just sort of a picture of the hard drive to
>know where and how data and structures are kept and ordered ... ;)
>
You are smart one :) It's huge work :) Read the source code please.

>
>- How does your semantic graph work : is it a cache contaning parts of the
>semantic tree (containing the user-side paths : /foo/bar/...), and updated
>when the filesystem is being used to reduce paths resolution time and
>eventually cache some data, resolving path the "old fashion" way when the
>path is not in the graph, by browsing the storage tree looking for the
>desired folders and fetching their information, or does the semantic graph
>allready contain the whole path structure, so that it is not necessary to
>store directory (I mean, the way VFS understands what a directory is)
>informations (list of files and subfolders) in the storage tree ?
>
The parsing the file path is fully VFS' job.

>
>- Considering the semantic graph, as you choose to use a generic graph, you
>would be able to link paths together to shorten access to some files that
>are often used : does Reiser4 implement some algorithms that reduces access
>time to most acceded files (at least path resolution) other than caching
>paths ? For example, if "/foo/bar/1/2/3/file" file is being used very often,
>does the semantic graph make a link directly between the root and the file ?
>

>
>- How do you keep the storage tree balanced, as it is constantly evolving ?
>Even with balancing at flush time, some important tree changes would take
>too much time to rebalance the tree : if this occurs, does the storage tree
>remain unbalanced, scheduling tree balancing later ? Could you graphically
>(or with a short text ...) tell how the tree evolves, and what the balancing
>operation really consists in ?
>
We should understand the difference between balancing and keeping tree 
consistent.
Tree is consistent if the following rule is hold true: all nodes may be 
accessed by means of using theirs left delimiting keys.
Tree is balanced if all used invariants are hold true (for instance, all 
nodes are half filled, or all nodes fully filled, etc). Also tree should 
not be singular.

Reiser4 in balancing time (any tree modification) does only care about 
tree consistency and keeps it in not singular state. Whereas flush does 
care about invariants (packing, etc).

>
>- When storing really big files, one extent pointer is not enough : does
>Reiser4 manage big files the same way ext2 does, with 2-level indirection
>pointers, storing only the first one in the tree ? If so, wouldn't this be
>considered as a Blob behaviour ?
>
Reiser4 uses extent items for that. Each extent item looks like the 
following:

------------------
start  | width
------------------
234    |  20
456    | 1034
567    | 345

and so on...

>
>
>Thank you ;)
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



