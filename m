From: Oleg Drokin <green@namesys.com>
Subject: Re: Some questions about Reiser4
Date: Mon, 28 Apr 2003 09:58:34 +0400
Message-ID: <20030428055834.GE22902@namesys.com>
References: <000c01c30b6a$d7f12590$0200a8c0@xpstation> <3EAA8008.4020401@namesys.com> <000b01c30bf7$bf47b080$0200a8c0@xpstation> <3EAA98EB.3040702@namesys.com> <001e01c30c03$740efb80$0200a8c0@xpstation>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13846-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <001e01c30c03$740efb80$0200a8c0@xpstation>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fred -- Speed Up -- <speedup@free.fr>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Apr 26, 2003 at 04:52:25PM +0200, Fred -- Speed Up -- wrote:
> So, what you call "inodes" within Reiser4 are stat data (last access time,
> right, ...) and a way to find the files's data (not directly the physical
> adress, but a piece of information determining exactly the file), mainly for
> VFS compatibility purposes. Are 'inodes' converted to keys when Reiser4 gets
> them from VFS, or do they represent a physical adress on the disk ?

Well, some confusiuon is going on, it seems.
It seems what Yury calls as "inodes" is in fact "object id".
Object id is part of the key. Each item belonging to file/directory/whatever other object
have identical (to other objects belonging to the same object) "object id" part in it's key.
This object id is visible outside of FS as inode number. (but there are no static inode thing
like you see in ext2 for example. The closest object that is similar to inode in the meaning of
ext2fs is "statdata" item. It holds file access modes, size and other stuff. But in fact
it is not necessary that each object should have this "statdata". Also there are no fixed locations
for "statdata"s. Reiser4 sports expandable statdata items that may contain different stuff
based on what kind of files you deal with. E.g. "lightweight" files may not have owner/group/acl stuff
in there (these fields are stored in "unixfile" statdata extension) which might be practical for
single-user systems with only one user.)
This is the same for reiserfs v3 and reiser4. Only in reiserfs v3 we had 32bit (and even less
in 3.5 disk format) wide objectid space and objectids were reusable.
In reiser4 objectid space is 64bits and for now the default setting is not to reuse objectids.

Bye,
    Oleg
