From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: EACCESS vs ENOENT for nonexistent files-within-files
Date: Wed, 15 Sep 2004 18:45:59 +0400
Message-ID: <16712.21927.550122.367489@thebsh.namesys.com>
References: <20040915151803.vl9es48kkosg4k88@www.wagland.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21772-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040915151803.vl9es48kkosg4k88@www.wagland.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Wagland <paul@kungfoocoder.org>
Cc: evilninja <evilninja@gmx.net>, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>

Paul Wagland writes:
 > On Wed 15 Sep 2004 01:41:40 PM CEST, Nikita Danilov wrote:
 > > evilninja writes:
 > >  > evil@prinz:/tmp$ touch file.txt
 > >  > evil@prinz:/tmp$ cat file.txt/.htaccess
 > >  > cat: file.txt/.htaccess: Not a directory
 > >  > evil@prinz:/tmp$ chmod +x file.txt
 > >  > evil@prinz:/tmp$ cat file.txt/.htaccess
 > >  > cat: file.txt/.htaccess: Not a directory
 > >
 > > But in reiser4 file.txt _is_ a directory. That's the whole point: it
 > > contains other objects inside.
 > 
 > [...]
 > 
 > > This is very simple: do be able to do a lookup one needs +x bit. No +x
 > > bit--no lookup. No lookup---impossible to determine exists .htaccess or
 > > not.
 > >
 > > Permission bits determine what operations are possible on
 > > object. Letting user to know that .htaccess doesn't exist while
 > > permission bits on parent explicitly disable lookups is a security
 > > hole.
 > 
 > I'm sorry to be so blunt on this... but this is just plain dumb. Really. For as
 > long as I have known, an executable bit on a file means that you can "execute"
 > that file. Now  you try to say, yeah, that, but as well, it means whether or
 > not you can access the files attributes?

The real problem is that in reiser4 regular files and directories are
indistinguishable by design. There can be subobjects within "regular"
file and one can do read("directory"), or, even, execve("directory") to
one's heart content.
  
 > 
 > Seriously. What were you thinking?

"I am thinking" as you style it, that in "foo/bar" path, "foo" is a
directory, and +x bit controls whether lookups are allowed on it. How in
your opinion lookup permission should be controlled instead?

In traditional UNIX different sets of operations were applicable to the
regular files and directories: for any given object either lookup or
exec were applicable by never both. So, the same bit in permissions mask
was used to control lookup and exec.

Now, we have a situation where there are objects for which both lookup
and exec are implemented. What can be done here short of abandoning
whole UNIX security model, adding new bits, rewriting large fractions of
user space and kernel code, etc.? Current reiser4 behavior is a
reasonable compromise. Other alternatives include 

   . "always allow lookup, use +x to control exec" (MAY_LOOKUP patch)

   . "always allow exec, use +x to control lookup" 

 > 
 > Does this mean (for example) that on a sgid file, only the group can see the

What +s bit has to do with anything mentioned so far?

 > attributes? Even if the file is world readable? Does this really make sense?

To make things clear: I have described in my message how things actually
do work in reiser4, so I don't see the point of your questions. If you
think reiser4 semantics is wrong (I am not happy with it too, by the
way), propose to Namesys something better.

 > 
 > Here is the rub... you are breaking the rules of "one object - one purpose".
 > Surely this is not how it is meant to be? On a file, the execute bit is meant

Surely equivalence of files and directories (and attributes) is exactly
how it is meant to be in reiser4. Ask Hans as to why.

 > for "can I run this file". On a dir, this bit is for "Can I see inside this
 > directory". They do not match!

And given that in reiser4 there is no difference between (regular) file
and directory this gives...?

There is 1000+ messagesful thread about these issues on LKML, from where
you can l
