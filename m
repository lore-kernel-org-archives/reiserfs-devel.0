From: "Fred -- Speed Up --" <speedup@free.fr>
Subject: Re: Some questions about Reiser4
Date: Sat, 26 Apr 2003 15:28:35 +0200
Message-ID: <000b01c30bf7$bf47b080$0200a8c0@xpstation>
References: <000c01c30b6a$d7f12590$0200a8c0@xpstation> <3EAA8008.4020401@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13825-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Now that I know that keys depend on inode numbers, I can understand some
points a far better way., thanks a lot ;)

- But I didn't knew Reiser4 was using inodes, as I thought everything was
stored in the tree ... now, you say Reiser4 stores directories and small
files in the tree, but isn't that kind of blobs Reiser4 would not use ?
- In the official documentation, it is said that blobs have moved out from
Reiser4, is that true ?
- In case of a small file being written to the disk, even if it is kept in
the tree you assign it an inode number ?
- What do you really mean by "flush" : can it be considered as a mantainance
operation that's running from time to time to clean the tree ? I saw that
programs can ask Reiser4 to flush, does flush in this case mean "physically
write data to the disk" ?
- When resolving a path, you still need to physically open directories, this
means searching through the tree : isn't there another data structure
intended to cache path data so that resolving a path operation doesn't
include searching the main tree ? I thought the semantic layer had its own
structure, not directly dependent on the main tree, for performance
concerns.
- There is no case of multiple extents use in the official doc, but as you
explained to me they are commonly used : do you need inodes to store extent
pointers, or are they kept together in the tree ?

Be sure you'll have full regard on the documents I'm publishing about
Reiser4.

Than you again,

Fred

