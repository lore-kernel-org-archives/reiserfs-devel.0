From: Yury Umanets <umka@namesys.com>
Subject: Re: Some questions about Reiser4
Date: Sat, 26 Apr 2003 18:34:19 +0400
Message-ID: <3EAA98EB.3040702@namesys.com>
References: <000c01c30b6a$d7f12590$0200a8c0@xpstation> <3EAA8008.4020401@namesys.com> <000b01c30bf7$bf47b080$0200a8c0@xpstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13826-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000b01c30bf7$bf47b080$0200a8c0@xpstation>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fred -- Speed Up -- <speedup@free.fr>
Cc: reiserfs-list@namesys.com

Fred -- Speed Up -- wrote:

>Now that I know that keys depend on inode numbers, I can understand some
>points a far better way., thanks a lot ;)
>
Inode number has the different nature in different filesystems.

>
>- But I didn't knew Reiser4 was using inodes, as I thought everything was
>stored in the tree ... now, you say Reiser4 stores directories and small
>files in the tree, but isn't that kind of blobs Reiser4 would not use ?
>
Hans will answer this in monday.

>- In the official documentation, it is said that blobs have moved out from
>Reiser4, is that true ?
>
And this one.

>- In case of a small file being written to the disk, even if it is kept in
>the tree you assign it an inode number ?
>
Of course. Each file contains of the following:
(1) stat data (inode in VFS notation)
(2) some body (tails, extents, directory items, etc)

If we do not assign inode to small file, how VFS will handle it? And how 
reiser4 will find it in the tree?

>- What do you really mean by "flush" : can it be considered as a mantainance
>operation that's running from time to time to clean the tree ?
>
Yes. In general flush is reiser4 subsystem, supposed to flush slums 
(dirty pieces of tree) to the disk. Of course those slums should be 
served in particular maner (packing, allocation) I have written about it.

> I saw that
>programs can ask Reiser4 to flush, does flush in this case mean "physically
>write data to the disk" ?
>
It does mean and this too.

>- When resolving a path, you still need to physically open directories, this
>means searching through the tree : isn't there another data structure
>intended to cache path data so that resolving a path operation doesn't
>include searching the main tree ?
>
Actually there is so called CBK cache. This is simple mechanism to 
satisfy tree lookups (by a key) without searching though the tree itself.
But it is used not only in path serach time, but also in other cases 
(for instance, for seraching file body item at particular file offset).

> I thought the semantic layer had its own
>structure, not directly dependent on the main tree, for performance
>concerns.
>

>- There is no case of multiple extents use in the official doc, but as you
>explained to me they are commonly used : do you need inodes to store extent
>pointers, or are they kept together in the tree ?
>
I can't comprehend you.

>
>Be sure you'll have full regard on the documents I'm publishing about
>Reiser4.
>
>Than you again,
>
Okay, thanks

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



