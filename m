From: lrc1@st-andrews.ac.uk
Subject: Carrying Attributes too Far at Great Length
Date: Fri, 10 Oct 2003 02:02:05 +0100
Message-ID: <1065747725.3f86050de1b25@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-15827-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Transfer-Encoding: 8bit
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I did it again. Replying properly to your reply required me to go into lots of 
things I was going to have to talk about sometime anyway, so I ended up with 
this tract. I can only beg your patience, and plead that it covers many 
different topics, all relevant.

------------------
Unix filenames are misnamed. A name is a tag that identifies a person or thing.
A good Unix (full) pathname is a description: it gives a piece of information
about the file(s) it applies to. ("This file is the password file.") Names
aren't necessarily descriptive; for example, my name is scarcely designed to 
convey information about me.

The distinction becomes clearer if we put on our formal-logic goggles. As I'm
sure you know know much better than me, in first-order logic the statement "Bob
wears a hat." can be formalised as

    Pa , where the predicate P means 'wears a hat' and the constant a refers to 
Bob.

P, the predicate, is a piece of information about a, Bob. Now let's say that the
/etc directory associates the name(-segment) passwd and the i-number 15385. That
indicates that the pathname /etc/passwd applies to file 15385. In other words,
file 15385 is the password file. We can formalise "file 15385 is a password 
file" as

    Pa , where the predicate P means 'is a password file' and the constant a
refers to file 15385.

(Of course, to say that 15385 is /the/ password file, we'd have to add another
proposition stating that there is at most one password file. The distinction
isn't relevant here, partly because any Unix pathname can happily apply to
either one or more than one file (or indeed to zero files). If the file
/etc/passwd were a directory with two non-directory descendants, then 'is the
password file' would be asserted of both of them (and not of /etc/passwd
itself). The fact that this would be Big Trouble is neither here nor there.)

We see that the pathname /etc/passwd corresponds to the predicate, the assertion
being made about the file, rather than to the constant, the name the file is
given. We also see that the number 15385 is to the file as 'Bob' is to Bob.
15385 is a meaningless tag that (volume-)uniquely indentifies the file. In other
words, it's already true that each Unix file has exactly one name: that name is
its i-number. Humans find names like 15385 unergonomic and unappealing, and
prefer things like 'Bob'. Similarly, it generally doesn't suit automated or
formalised systems to adopt or mimic the names humans use. But both are
basically the same thing.

Quoting "Alexander G. M. Smith" <agmsmith@rogers.com>:

> lrc1@st-andrews.ac.uk wrote on Sat,  4 Oct 2003 06:58:04 +0100:
> > Yes, it is impossible to hard-link between two files on different volumes
> > (except at mount points) in the Unix filesystem, but it shouldn't be.
> (More
> > generally, with the necessary permissions it should be possible to make
> any
> > file the child of any directory via a hard link, except where doing so
> would
> > create a cycle.)
> 
> Or if the file system supports parent links for all objects, and does a bit
> of graph traversal when deleting files, then you can have cycles.  It is
> useful and more natural to organize information in a graph rather than a
> hierarchy.  It's possible to do it with symbolic links, but hard links
> make it more reliable (moving files around doesn't destroy the links).
> 

We can have cycles, but we shouldn't, because we don't need them. Take it that a
file's (full) pathname asserts a predicate about that file, while a directory's
(full) pathname asserts a predicate - the same proposition - separately about
all of the directory's descendants that aren't themselves directories (and not
the directory itself). (/usr/ says that all of its non-directory descendants are
user files, /usr/bin/ says that all of its non-directory descendants are user
binaries.) Of course, all of a directory's descendants are automatically also
descendants of its parent directory. So whatever the parent directory's pathname
asserts must also be true of all the child directory's non-directory
descendants. (All user binaries are user files, so it's OK for /usr/bin/ to be
the child of /usr/ .) In fact it's stronger than that - the parent directory's
predicate must in some way be /necessarily/ true of all files of which the child
directory's predicate is true. After all, it's not as if all of the child
directory's non-directory descendants just happen to be descendants of the
parent directory as well - any file you make a descendant of the child
automatically becomes a descendant of the parent. (All user binaries are
necessarily user files - if a file isn't a user file, it can't be a user binary.
Therefore we're happy that child of /usr/bin/ is automatically a descendant of
/usr/ . In fact, we can think of the link from /usr/ to /usr/bin/ as an
assertion that all user binaries are necessarily user files. Modal logic ahoy.)

Now, consider a directory which is the parent of its parent, a simple cycle.
(Suppose /a/b/ is the parent of /a/ .) That means that every descendant of one
directory in the loop is automatically a descendant of the other. (/a/b/ 's
descendants are automatically descendants of /a/ , but /a is also /a/b/c/ , so
all of its descendants are automatically descendants of /a/b/ .) So everything
which is '/a/b' is necessarily also '/a' - and /vice versa/. But you get the
same effect if you have two pathnames which point to the same directory. If /ab/
is a  hardlink to /a/ then every file which is '/a' is automatically '/ab' and
vice versa. This is good news not only because it means we can do without 
cycles, but because it makes for a cleaner language. Using cycles we face an 
arbitrary choice of which order we want to put the directories in. (Imagine that 
Cedric wants to have a directory containing photos of all the good people he 
knows, and a directory with photos of all the happy people he knows. Cedric 
believes that all good people are necessarily happy and that all happy people 
are necessarily good. But he knows that not all the people who may browse the 
directory are aware of his belief, so he wants separate pathnames for 'photos of 
good people' and 'photos of happy people'. Should Cedric create 
photos/people/happy/good/ which links back to photos/people/happy/ , or should 
he create photos/people/good/happy/ , which links back to photos/people/good/ ?)

So cycles are redundant, at least if we are willing to have directories with
multiple (hard-linked) full pathnames. And since we don't need cycles, we
shouldn't have them - both because then we don't have to deal with cycles, and
because this is a clear case where there should be "only one way to do it" (and
there's even more than one way of doing it using cycles). But there is a deeper
moral here. If, say, a Lisp program wants to store a certain body of information
in its memory, it is free to store it using whatever data structure it wants,
built up from its linked-list-node building blocks. Only the program itself (and
the programmers who debug it...) need to understand the data format that it
chooses. If the Unix file "naming" system were like that, there would be no
reason for it not to have cycles. But it's not like that, and it shouldn't be
like that. It's a language which different people and programs can communicate
in because they share a common understanding of how it should be interpreted.
You can follow the sentence structure even if you don't know all the words: a
simple filesystem browser may have no concept of what a password file is, but it
can see that file 15385 on volume /dev/hda1 is a '/usr/passwd', and also a
'/usr'. On the down side, this means that the Unix file naming system is a more
limited and special-purpose tool than a Lisp list (for one thing, we can't
express a linked list in it) and if we add things to the filesystem to make it
more flexible, we have to ask how the additions will fit into the language of
the filesystem, just as we did with cycles above. I will post my solution to
this problem before long.

[I've switched the order of the two following quote blocks.]

> > There's no semantic reason why it shouldn't be possible; in other words,
> > if it's meaningful for a file to be named both /pub/pictures/sunrise and
> > /home/alice/pictures/daylight , why would it in fact not be meaningful
> just
> > because a volume is mounted at /home ?
> 
> I'd ditch the cool but mostly useless and confusing feature of having
> different names for the same file.  Use symbolic links for that.  Having
> a single name makes the implementation easier too (store the name in the
> file's inode rather than in the directories).  This would slow down
> directory traversal, but "ls" and other tools already stat() each file to
> read its inode metadata anyway, so putting the name there wouldn't be
> too bad.

I am happy that the idea that a file can have more than one full path"name" is
not a fundamentally confusing concept. If you think of a non-directory file's
full path"name" as asserting a piece of metadata about it, it stands to reason
that you should be able to say more than one thing about any given file, and
hence files should be able to have multiple pathnames. Certainly, if it's not
too confusing to allow multiple pathnames through symbolic links, it shouldn't
be too confusing to allow them through hard links. However, there are certainly 
things in the current Unix implementation of hard linking that make multiple 
pathnames through hard links confusing and, yes, largely useless. One of them is
the prohibition on hard-linking across volumes, which should be removed. The
real killer, however, is the practical impossibility of discovering the
pathnames of a given file. Given a full pathname, a file handle, or even an
i-number, there must be a system call (or calls) to return all the hard-linked
full pathnames of the given file, permissions allowing. This removes the last
advantage of using a symlink where you really want a hardlink: after all, a
symlink only knows *one* of the target file's other pathnames. More than that,
the ability to discover the pathnames of a given file transforms the file naming
system from being crippled to being much more powerful and generally useful. But 
I've banged that drum before and I'll bang it again, so I won't bang it too hard 
this time. Other reasons why people find multiple "names" confusing is 
unfamiliarity and the prevalence of bad metaphors for the filesystem in users' 
heads, only one of which is the delusion that Unix full pathnames are in fact 
names rather than predicates (it's confusing that Bill should also be known as 
Todd and Dean; it's not confusing that we should know that Bill wears a hat and 
also that he carries an umbrella and speaks English). Those problems should wane 
if people actually get used to seeing multiple names used well.

How should pathname discovery be implemented? The only big thing you need is
some reasonably efficient means for the filesystem to discover the i-numbers of
all of any given file's immediate parents. (One way to do this would be to store
the parent file i-numbers in each file's inode. However, it would be better if
the information were stored in files, one for (and in) each volume. The Unix
ideal of the file - one volume-unique identifier (the i-number), one stream of
bytes (the file body), and nothing else - is something that we should be moving
towards rather than away from. Going into detail would require another long
digression, so I'll leave it for later.) This "parent link" information is 
really just a means of making the existing links from directory to file two-way 
(*not* symmetrical). Note that you need such a mechanism anyway if you want to 
implement things like explicit file deletion (to find and rewrite all the parent 
directories of a deleted file) or links that don't count as references for the 
purposes of file (non-)deletion (to know which, if any, of the links are 
"loose", and to clean up the loose-linked parent directories after implicit file 
deletion).

On the other side, symlinks are a deeply defective substitute for hard links.
This is indeed because they each refer to a file with a given (full) pathname,
not directly to any file, and if you pretend that they refer to files you live
with the consequences. If a file has only one hard-linked pathname, of course,
you can be certain that changing that name will break any and all of the
symbolic links to the file. And since existing Unix symlinks are every bit as
one-way as existing Unix hard links, good luck finding and repairing them all,
or even noticing. The other reason not to misuse symlinks is because the
indirection they offer is very useful if used intentionally. If ordinary full
pathnames say things like 'File 17762 is the message-of-the-day text' then
symlinked pathnames say things like 'the message-of-the-day text is whatever
file is Bob's .plan file'. If symbolic links aren't used as makeshifts for hard
links, then users can be confident in always interpreting them in their natural way.

But if you /were/ to implement a system in which every file has exactly one
(hard-linked) full pathname, it would not be a good idea to put the name
segments in the inodes. The general reason is once again the Unix ideal of
the file. More specifically, I expect that it would be a lot less like brain 
surgery to modify the directory file format and the filesystem code that reads 
and modifies it than to modify the filesystem device file format and the code 
which interacts with /that/. And even if you were to put the file's name segment 
in the inode, it's still only meaningful in the context of what the directories 
tell you about it (is that 'bin' file /bin/ or /usr/bin/ or 
/usr/local/TogetherSoft/Together6.0/bundled/j2ee/bin/ ?) Again, more on this 
later.

A final, perhaps relatively minor, problem with implementing a one-hard-pathname 
filesystem is that such a system wouldn't be compatible with existing Unix 
filesystems and the programs which use them. The problem of compatibility is 
more severe here than with subfile-metadata filesystems, where you have to hide 
new (mis)features from old programs - here you are hiding or dealing with the 
loss of an old feature for which there is no real replacement.

> Hard links across volumes or removable media isn't possible since you
> don't have real time notification of changes; so the links would be
> slightly-soft, squishy, firm, or some other such technical term :-).
> I guess you could make such a firm link evaluation block the caller
> until the system has gotten a lock on the target (insert removable
> disk, establish network connection, etc).

I think there are two distinguishable problems here. One is the danger that a
hard link that crosses volumes will break silently when the volume containing
the linked-to file is unmounted. But with two-way links this is no longer a 
major problem: the links which will be broken by the unmount can be identified 
and the parent directories fixed. Explicit file deletion and non-reference 
linking will face largely the same problem and will also use two-way links to 
resolve it. The other problem is that following a hard link to a file on an 
unreliable volume may take a long time or never succeed. But you face just the 
same problem when reading or writing to a file body on such a volume, or when 
following hard links inside the volume. In any case, non-symbolic links across 
volumes should be to a particular file (designated by i-number) and 
(probably...) the link information should be stored in the directory like a hard 
link's. Whether that makes it a hard link or not is probably not so important.

> 
> > What if two children of hello.mp3/+/ have different permissions, and a
> third
> > file is the child of both of them? And what about the proposal that
> ordinary,
> > non-attribute files should inherit metadata from their parent directories?
> 
> 
> Good point.  I guess the inheritance algorithm should take multiple parents
> into account when doing its traversal.  Or just restrict the use of
> inheritance.
> 

Easily said. The devil is in the detail. What multiple-inheritance regime would 
you apply? Alternatively, how and when would you prevent multiple inheritance of 
metadata? Allowing every file only one hard-linked pathname, and banning 
inheritance over symlinks, would solve the problem, but it's a drastic and 
unpleasant remedy. Is there an alternative you would suggest?

> - Alex
> 

Leo.


-----------------------------------------------------------------
University of St Andrews Webmail: http://webmail.st-andrews.ac.uk
