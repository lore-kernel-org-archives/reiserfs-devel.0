From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: using reiserfs as a DB
Date: Tue, 23 Apr 2002 12:50:28 +0400
Message-ID: <15557.8276.40771.252529@laputa.namesys.com>
References: <20020421205328.GA8407@vega.ipal.net>
	<20020422172009.A1109@namesys.com>
	<20020422174449.GC8407@vega.ipal.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10142-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020422174449.GC8407@vega.ipal.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phil Howard <phil-reiserfs@ipal.net>
Cc: reiserfs-list@namesys.com

Hello,

Phil Howard writes:
 > On Mon, Apr 22, 2002 at 05:20:09PM +0400, Oleg Drokin wrote:
 > 
 > | On Sun, Apr 21, 2002 at 03:53:28PM -0500, Phil Howard wrote:
 > | > Given the balanced tree directory structure of reiserfs, it seems it
 > | > could be usable as a DB in place of a DB library (such as Berkeley DB).
 > | > Has anyone done any timing/benchmarks of reiserfs used as a replacement
 > | > for a DB library, as compared to one such as Berkeley DB?  There would
 > | > be an advantage to using conventional file tools to access the data
 > | > instead of having to code some up for a DB library.  The issue would
 > | > certainly involve the open/read/close timings for reiserfs for each
 > | > piece of data accessed.  The uses for which I have an interest in doing
 > | > this would most be small data, usually less than 128 bytes, and almost
 > | > always less than 512 bytes.  For example, one use involves indexing a
 > | > lot of (100s to maybe even 1000000) URLs under special short keywords.
 > | 
 > | I do not have any numbers, but take in account that while DB database
 > | generally have to updata atime/mtime/ctime on only 3 files (or even 2),
 > | in case of a filesystem each file accessed will change atime and/or mtime/ctime.
 > | 
 > | (you can turn off atime updates of course). Also directory lookups ain't going
 > | to be free either.
 > | I've not heard of a test like you are describing, so feel free to implement
 > | one that will suit all your needs.
 > | 
 > | But I remember that squid people decided lookup/open/close operations are
 > | too expensive for them and raw reiserfs access was born, where you was able
 > | directly access filesystems objects by the keys. 
 > 
 > "By the keys" means what?  Are the keys the filenames/paths, or are they an
 > internal manifestation obtained by looking up those keys?  What I envision
 > in some needs ideas are pretty much "flat" directory structures where the
 > application key would be the filename in the directory.  One example of this
 > would be a lookup table translating a ham radio callsign into a web URL for
 > that ham operators web site (the keys in this case would be small strings,
 > 3 to 6 characters, and potentially a rather tight space if it scales up).
 > 
 > Does the raw interface simply shortcut access to files in a normal reiserfs
 > mounted filesystem, which can also still be accessed the usual way, or is it
 > a special object which can only be accessed that way (if so, then it loses
 > the advantage of being able to use conventional tools that work on files, and
 > ends up being pretty much a DB lib implemented in kernel space).  Since most
 > operations would be open() file, read() file once (because nothing would be
 > larger than one block), and close(), a single system call that allowed to
 > just fetch the contents given a name would certainly be a plus for the server
 > component.
 > 

I shall try to answer these and other questions about reiserfs-raw.

Internally, reiserfs stores almost all file-system meta-data (directory
entries, on-disk inodes, and pointers to blocks with file data) and some
files-system data ("tails"---last portion of files bodies) in a balanced
tree similar to ones described in a standard CS text-books.

Specifically, each file-system object (directory, regular file, symbolic
link, etc.) is represented as sequence of "items". Each item is stored
in the tree under some "key". In reiser3.x key is 16 bytes. To obtain
meta-data, file-system composes key and performs tree lookup
(search_by_key() function).

Key of an item is composed from some unique identifier of object
("objectid", also used as inode number), its "packing locality", which
happens to be objectid of directory where object was created (*the*
parent directory, so to speak), item type, and "offset" within
object. For regular file offset is really offset within file, for
directory, offset of the directory entry is, roughly speaking, hash of
name stored in this directory entry.

As I said, reiserfs just uses this tree (referred to as "internal") to
build user visible file system structure (which itself is a tree, called
"semantic") on the top of it. Note, that said trees are not even close
to be isomorphic.

Reiserfs-raw implemented API to access internal reiserfs tree directly,
that is without going through semantic tree first.

Application using this API is responsible for:

(1) assigning keys to objects. Application creates anonymous object by
giving its objectid. There are no directories. The only way to access
object later is by knowing its objectid. Of course, objectid can be
stored in the tree itself, but this way one just builds some sort of
directories.

(2) keeping track of object lifetime. In the standard file systems,
directory tree also serves as garbage collector: when link count drops
to zero, object is recycled. In reiserfs-raw there are not directories
and hence to garbage collector is provided by system.

Reiserfs-raw was designed as back-end for SquidNG (Squid New
Generation)---project to rewrite squid and get rid of some of its
limitations (mainly necessity to keep all cache meta-data in the memory
all the time). In was mainly implemented by Yury Shevchuk
<sizif@botik.ru> and sponsored by IntegratedLinux (not sure how they are
named today).

Joe Cooper (joe@swelltech.com) maintained SquidNG
(http://www.swelltech.com/pengies/joe/squidng.html)

Later Arkadi E. Shishlov (arkadi@it.lv) ported reiserfs-raw to 2.4
kernels (http://kvin.lv/arkadi/reiserfs-raw/).

I cannot help mentioning that SquidNG+reiserfs-raw outperformed all
other Squids by large margin at the official benchmarking event.

Namesys doesn't support reiserfs-raw.

Nikita.
