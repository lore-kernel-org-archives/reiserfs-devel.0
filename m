From: "Fred -- Speed Up --" <speedup@free.fr>
Subject: Some more questions about Reiser4 ;)
Date: Tue, 6 May 2003 20:30:22 +0200
Message-ID: <001e01c313fd$975e7730$9900a8c0@xpstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13968-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

What about me :-D

----- Original Message ----- 
From: "Fred -- Speed Up --" <speedup@free.fr>
To: <reiserfs-list@namesys.com>
Sent: Saturday, May 03, 2003 11:33 PM
Subject: Some more questions about Reiser4 ;)


I posted one week ago some questions about Reiser4. I've just read your
answers and I'll firstly want to thank all of the people developing Reiser4
and answering on the mailing list ;)

Thanks to Oleg I could understand what the object id stands for outside the
FS. And parent id should be the part of the key related to what the
file/item is related to : when we consider some file's attribute, it's
stored in a separate object which has a single object id but whose parent id
is the object id of the file it's related to, am I right ? And a file should
behave the same way with its parent directory (this is likely to be a main
concept of Reiser4 : objects are both files and folders).
Now an inode number identifies a physical file or folder considered from VFS
(not an attribute or any metadata Reiser4 is implementing), it's the object
id for the main file, from which we can get the attribute and/or the
subfolders wether it is a directory or not.

Hans Reiser informed me about the release date :-D. Can you evaluate the
developement stage, are you still implementing features or rather getting
the software stable, or even doing tweaking stuff ... the website announces
June 2003 : I'm pretty sure it won't be ready that soon :-D. I know
developing such a project takes time, and the release date is not such an
important thing as soon as it is released stable, powerfull and fast ;)


Now I got some question still remaining unanswered :

- Could you please describe the overall structure of Reiser4fs, with a
diagram or a little text, where the superblock is, the wandering logs, the
storage tree and semantic graph, just sort of a picture of the hard drive to
know where and how data and structures are kept and ordered ... ;)

- How does your semantic graph work : is it a cache contaning parts of the
semantic tree (containing the user-side paths : /foo/bar/...), and updated
when the filesystem is being used to reduce paths resolution time and
eventually cache some data, resolving path the "old fashion" way when the
path is not in the graph, by browsing the storage tree looking for the
desired folders and fetching their information, or does the semantic graph
allready contain the whole path structure, so that it is not necessary to
store directory (I mean, the way VFS understands what a directory is)
informations (list of files and subfolders) in the storage tree ?

- Considering the semantic graph, as you choose to use a generic graph, you
would be able to link paths together to shorten access to some files that
are often used : does Reiser4 implement some algorithms that reduces access
time to most acceded files (at least path resolution) other than caching
paths ? For example, if "/foo/bar/1/2/3/file" file is being used very often,
does the semantic graph make a link directly between the root and the file ?

- How do you keep the storage tree balanced, as it is constantly evolving ?
Even with balancing at flush time, some important tree changes would take
too much time to rebalance the tree : if this occurs, does the storage tree
remain unbalanced, scheduling tree balancing later ? Could you graphically
(or with a short text ...) tell how the tree evolves, and what the balancing
operation really consists in ?

- When storing really big files, one extent pointer is not enough : does
Reiser4 manage big files the same way ext2 does, with 2-level indirection
pointers, storing only the first one in the tree ? If so, wouldn't this be
considered as a Blob behaviour ?


Thank you ;)

Fred

