From: Phil Howard <phil-reiserfs@ipal.net>
Subject: Re: using reiserfs as a DB
Date: Mon, 22 Apr 2002 12:44:49 -0500
Message-ID: <20020422174449.GC8407@vega.ipal.net>
References: <20020421205328.GA8407@vega.ipal.net> <20020422172009.A1109@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10125-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020422172009.A1109@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Mon, Apr 22, 2002 at 05:20:09PM +0400, Oleg Drokin wrote:

| On Sun, Apr 21, 2002 at 03:53:28PM -0500, Phil Howard wrote:
| > Given the balanced tree directory structure of reiserfs, it seems it
| > could be usable as a DB in place of a DB library (such as Berkeley DB).
| > Has anyone done any timing/benchmarks of reiserfs used as a replacement
| > for a DB library, as compared to one such as Berkeley DB?  There would
| > be an advantage to using conventional file tools to access the data
| > instead of having to code some up for a DB library.  The issue would
| > certainly involve the open/read/close timings for reiserfs for each
| > piece of data accessed.  The uses for which I have an interest in doing
| > this would most be small data, usually less than 128 bytes, and almost
| > always less than 512 bytes.  For example, one use involves indexing a
| > lot of (100s to maybe even 1000000) URLs under special short keywords.
| 
| I do not have any numbers, but take in account that while DB database
| generally have to updata atime/mtime/ctime on only 3 files (or even 2),
| in case of a filesystem each file accessed will change atime and/or mtime/ctime.
| 
| (you can turn off atime updates of course). Also directory lookups ain't going
| to be free either.
| I've not heard of a test like you are describing, so feel free to implement
| one that will suit all your needs.
| 
| But I remember that squid people decided lookup/open/close operations are
| too expensive for them and raw reiserfs access was born, where you was able
| directly access filesystems objects by the keys. 

"By the keys" means what?  Are the keys the filenames/paths, or are they an
internal manifestation obtained by looking up those keys?  What I envision
in some needs ideas are pretty much "flat" directory structures where the
application key would be the filename in the directory.  One example of this
would be a lookup table translating a ham radio callsign into a web URL for
that ham operators web site (the keys in this case would be small strings,
3 to 6 characters, and potentially a rather tight space if it scales up).

Does the raw interface simply shortcut access to files in a normal reiserfs
mounted filesystem, which can also still be accessed the usual way, or is it
a special object which can only be accessed that way (if so, then it loses
the advantage of being able to use conventional tools that work on files, and
ends up being pretty much a DB lib implemented in kernel space).  Since most
operations would be open() file, read() file once (because nothing would be
larger than one block), and close(), a single system call that allowed to
just fetch the contents given a name would certainly be a plus for the server
component.

-- 
-----------------------------------------------------------------
| Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
| phil-nospam@ipal.net | Texas, USA | http://phil.ipal.org/     |
-----------------------------------------------------------------
