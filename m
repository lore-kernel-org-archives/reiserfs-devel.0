From: "Fred -- Speed Up --" <speedup@free.fr>
Subject: Re: Some questions about Reiser4
Date: Sat, 26 Apr 2003 16:52:25 +0200
Message-ID: <001e01c30c03$740efb80$0200a8c0@xpstation>
References: <000c01c30b6a$d7f12590$0200a8c0@xpstation> <3EAA8008.4020401@namesys.com> <000b01c30bf7$bf47b080$0200a8c0@xpstation> <3EAA98EB.3040702@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13827-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

So, what you call "inodes" within Reiser4 are stat data (last access time,
right, ...) and a way to find the files's data (not directly the physical
adress, but a piece of information determining exactly the file), mainly for
VFS compatibility purposes. Are 'inodes' converted to keys when Reiser4 gets
them from VFS, or do they represent a physical adress on the disk ?

Now I'm going to reformulate the question I asked you about big file storage
:
Big files need more than one extent. But according to the documentation,
there seems to be only one pointer associated to each file. So how can you
point out multiple extents necessary to store big files, using extent
pointers in the tree ?

Be sure I'm awaiting the great Hans and his core dev team ;-)

Fred

