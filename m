From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: EACCESS vs ENOENT for nonexistent files-within-files
Date: Wed, 15 Sep 2004 19:12:14 +0400
Message-ID: <16712.23502.414611.505881@thebsh.namesys.com>
References: <20040915151803.vl9es48kkosg4k88@www.wagland.net>
	<41484BDB.7060007@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21773-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41484BDB.7060007@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Paul Wagland <paul@kungfoocoder.org>, Nikita Danilov <nikita@clusterfs.com>, evilninja <evilninja@gmx.net>, reiserfs-list@namesys.com

Hans Reiser writes:
 > Paul Wagland wrote:
 > 
 > >On Wed 15 Sep 2004 01:41:40 PM CEST, Nikita Danilov wrote:
 > >  
 > >
 > >>evilninja writes:
 > >> > evil@prinz:/tmp$ touch file.txt
 > >> > evil@prinz:/tmp$ cat file.txt/.htaccess
 > >> > cat: file.txt/.htaccess: Not a directory
 > >> > evil@prinz:/tmp$ chmod +x file.txt
 > >> > evil@prinz:/tmp$ cat file.txt/.htaccess
 > >> > cat: file.txt/.htaccess: Not a directory
 > >>
 > >>But in reiser4 file.txt _is_ a directory. That's the whole point: it
 > >>contains other objects inside.
 > >>    
 > >>
 > >
 > >[...]
 > >
 > >  
 > >
 > >>This is very simple: do be able to do a lookup one needs +x bit. No +x
 > >>bit--no lookup. No lookup---impossible to determine exists .htaccess or
 > >>not.
 > >>
 > >>Permission bits determine what operations are possible on
 > >>object. Letting user to know that .htaccess doesn't exist while
 > >>permission bits on parent explicitly disable lookups is a security
 > >>hole.
 > >>    
 > >>
 > >
 > >I'm sorry to be so blunt on this... but this is just plain dumb. Really. For as
 > >long as I have known, an executable bit on a file means that you can "execute"
 > >that file. Now  you try to say, yeah, that, but as well, it means whether or
 > >not you can access the files attributes?
 > >
 > >Seriously. What were you thinking?
 > >
 > >Does this mean (for example) that on a sgid file, only the group can see the
 > >attributes? Even if the file is world readable? Does this really make sense?
 > >
 > >Here is the rub... you are breaking the rules of "one object - one purpose".
 > >Surely this is not how it is meant to be? On a file, the execute bit is meant
 > >for "can I run this file". On a dir, this bit is for "Can I see inside this
 > >directory". They do not match!
 > >
 > >Paul.
 > >  
 > >
 > Separate bits are needed for the separate purposes.  Nikita, can you 
 > remind what implementation details delay separating the bits?  I thought 
 > it was already done, sigh....

The only patch that I know about is MAY_LOOKUP one that I mentioned in
other response. It basically always allowed ->lookup() to be called on a
regular file. This allowes to cope with the most frequent complaint "I
cannot access /etc/passwd/metas/uid!", but this is only sufficient for
pseudo files within regular files. For general situation when objects
behave as both regular and directory, _and_ we want DAC on them,
separate bits are needed indeed. I see several possibilities for this:

    - implement this as reiser4 feature: keep additional bits in
      stat-data and cache them in reiser4 specific portion of inode. 

    - implement this as a generic feature: cache additional bits in
      inode->i_mode (extended appropriately). This requires changing
      generic VFS permission checks and all file systems.

Both approaches still requires modifying all user-level tools that show
or copy permissions (ls, GUI file managers, tar, cpio, cp)

As I had more than one occasion to note, releasing file system into user
land that can silently drop DAC bits (and this is what unmodified cp and
tar will do) is very dangerous enterprise. In the time being, sharing +x
for lookup and exec seems to be the only plausible solution. But, hey!
Who am I to dwell into these matters at this point?

 > 
 > Hans

Nikita.
