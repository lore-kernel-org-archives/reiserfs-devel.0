From: Yury Umanets <umka@namesys.com>
Subject: Re: Some questions about Reiser4
Date: Sat, 26 Apr 2003 19:10:29 +0400
Message-ID: <3EAAA165.5000403@namesys.com>
References: <000c01c30b6a$d7f12590$0200a8c0@xpstation> <3EAA8008.4020401@namesys.com> <000b01c30bf7$bf47b080$0200a8c0@xpstation> <3EAA98EB.3040702@namesys.com> <001e01c30c03$740efb80$0200a8c0@xpstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13828-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <001e01c30c03$740efb80$0200a8c0@xpstation>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fred -- Speed Up -- <speedup@free.fr>
Cc: reiserfs-list@namesys.com

Fred -- Speed Up -- wrote:

>So, what you call "inodes" within Reiser4 are stat data (last access time,
>right, ...)
>
Inode is struct in VFS, but in the case of reiser4 it contains also the 
pointer to the loaded reiser4 stat data item. Stat data item contains 
times, mode, nlinks, size, etc.

Each stat data is tag for file. That each file has one stat data. And 
this stat data can be found by its key. Its kay consists of  inode 
number of parent directory,  inode number of file itself and offset 
(zero for stat data).

> and a way to find the files's data (not directly the physical
>adress, but a piece of information determining exactly the file), mainly for
>VFS compatibility purposes. Are 'inodes' converted to keys when Reiser4 gets
>them from VFS, or do they represent a physical adress on the disk ?
>
Inode numbers may be converted to key. And then key is used for 
searching whatever in the tree (stat data, file body, directory entry, etc).
But in the case of seraching file body key must contain also offset 
component installed and namely the offset in file we are want to access.

>
>Now I'm going to reformulate the question I asked you about big file storage
>:
>Big files need more than one extent.
>
Right.

> But according to the documentation,
>there seems to be only one pointer associated to each file. 
>
Each big file can contains not limited number of extent items. Each 
extent item contains extent units. They can be accessed/found by key. 
Each extent unit consists of two fields: start (block number) and width 
(number of blocks). In these range from start to start + width some 
piece of file data is lie. But,  as there is not anough big contiguous 
range on disk (some of blocks are used for diffrent things, like 
bitmaps, leaves, etc), we should use more than one extent items with a 
lot of extent units inside.

>So how can you
>point out multiple extents necessary to store big files, using extent
>pointers in the tree ?
>

>
>Be sure I'm awaiting the great Hans and his core dev team ;-)
>
Actually I'm one of that team. But there are questions Hans can answer 
better than me, because he written that documentation on our web pages. 
It is not the same what is implemented, but it is rather roadmap. And 
I'm trying to explain you the things which are implemebted yet and how 
do thay implemented. But sometimes I can't comprehend your requests :)

>
>Fred
>
>
>
>  
>


-- 
Yury Umanets



