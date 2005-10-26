From: Nate Diller <nate.diller@gmail.com>
Subject: Re: Our introduction to Reiser-list
Date: Wed, 26 Oct 2005 15:40:35 -0700
Message-ID: <5c49b0ed0510261540l370acbfepfe4b6649c91cee61@mail.gmail.com>
References: <200510251558.13860.pvh@uvic.ca>
	 <87k6g1yp5a.fsf@evinrude.uhoreg.ca>
	 <435F7A2A.5020506@st-andrews.ac.uk> <200510260910.12136.pvh@uvic.ca>
	 <435FB231.5070507@nauticom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26671-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <435FB231.5070507@nauticom.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Chester R. Hosey" <chosey@nauticom.net>
Cc: reiserfs-list@namesys.com

On 10/26/05, Chester R. Hosey <chosey@nauticom.net> wrote:
> Peter van Hardenberg wrote:
> > Although I freely acknowledge my inexperience, I believe the real probl=
ems
> are=20
> > related to graph traversal algorithms. Linus has commented on the obvio=
us
>=20
> > hardlink issues. I imagine there are more gremlins lurking in the shado=
ws
> on=20
> > this one. Garbage collectors have largely given up on reference countin=
g,
> a=20
> > luxury afforded by blazingly fast access to small amounts of storage. I=
 am
>=20
> > not particularly up on the research though.
>=20
> Just a suggestion from the uninformed peanut gallery...
>=20
> Hans already plans on having a repacker, which will run incrementally in
> the background. Might it make sense to do incremental GC, possibly even
> in combination with the repacker's traversal of the disk?
>=20
I'd reply to Hans' email directly, but in a moment of weakness he top-poste=
d.  Anyway, I don't subscribe to this list from my namesys account.

Ok, the garbage collection problem.  Your suggestion is insightful for an i=
mportant reason, although it turns out not to solve the problem, it actuall=
y helps illustrate it quite well.

File Locality
  There are a few schools of thought on how to group data that is not forma=
lly structured (ie, not a relational database).  One is to use temporal loc=
ality, meaning group things together which are created close together in ti=
me.  Another is locality of reference, which is optimal if you can get it. =
 Unfortunately, it's difficult to keep track of which files are accessed cl=
ose together in time, without incurring lots of overhead.  It's also imposs=
ible to know in advance, so it can really only be used in a repacker.
  Hans chose to use semantic locality to group data in the on-disk tree, me=
aning that files are grouped based on their name, and their parent director=
y.  This is done by a key assignment plugin, which basically aligns everyth=
ing in the tree by its position alphabetically (this is the purpose of the =
firbration plugin) withinin its parent directory.  This means that if you l=
oop over the results of readdir() reading each file, you will traverse thro=
ugh part of the tree incrementally, eliminating disk seeks and speeding up =
access immensely.
  Since the disk is basically a static array of blocks, and the whole tree =
obviously cannot be cached at once, the tree sometimes has to get divided u=
p when it is written to disk.  If this happens a lot, traversing the tree i=
n order can actually introduce a lot of seeks, jumping around to the variou=
s peices of the tree, rather than none like I just described.  This is the =
problem which the repacker solves, its job is to "defragment" the tree itse=
lf, and since there is only one tree, once it is done the disk's free space=
 will also be consolidated.

Graphs
  This semantic locality scheme doesn't perfectly map to the posix namespac=
e, since posix allows for hard links.  A directory tree with hard links is =
not precisely a tree, it is actually a directed graph, or digraph.  In orde=
r to make management of the namespace easier, however, there is a limitatio=
n that directories cannot be hard linked, meaning that the namespace is act=
ually an acyclic directed graph, or ADG.
  Even with an ADG there is the problem that semantic locality does not cor=
respond to in-tree (on-disk) locality when a file has more than one hard li=
nk, since it only exists in one place on disk but more than one place in th=
e namespace.  In practice this poses no real issues, but it makes it diffic=
ult to imagine a repacker that could track down all the parent directories =
of a particular file, without lots of overhead.

File-as-Directory
  The issue with file-as-directory (FaD) is that it removes the Acyclic pro=
perty of the namespace graph.  This is because anything which contains file=
 data can be hard-linked, even if that item is also a directory.  It would =
be unreasonable to discard hard links entirely, they are quite useful and w=
ould be much more useful, in fact, with FaD enabled.  So the new namespace =
would be a directed graph, with cycles.
  Since unix operating systems are responsible for deleting unused data in =
file systems (garbage collection), any algorithm used for that purpose has =
to satisfy strict requirements, for CPU and memory use, but more importantl=
y for reliability.  The algorithm must not fail the deletion unless the sys=
tem is OOM, and it must always free the file's resources.  Reference counti=
ng has always been used for this task.
  It's been awhile since I took graph theory, and I got a C in it anyway, b=
ut the algorithms I have seen for determining graph connectivity end up tra=
versing to every node in the graph in the worst case.  This means that the =
file system would potentially have to read in the directory data for every =
link to every file in the system, for a single deletion operation.

my proposal
  First I should note that this is my personal suggestion, and it is not en=
dorsed by Hans in any way.
  I have always had a strange view of the role of the OS, and in my view, t=
here is no reason that the kernel should be required perform garbage collec=
tion for the file system.  Rather, a program should be able to do garbage c=
ollection for itself, or delegate the task to a daemon.  The program simply=
 needs to be able to get a list of all the nodes (files, ie. inodes) in the=
 system, and be able to instruct the kernel to delete them if they are unus=
ed.
  Unfortunately, I've run out of time, and I'll have to articulate my idea =
in detail in another email.  It's not the easy way to do it; I don't think =
that this can work in Linux (or Reiser4) in the near future, so no need for=
 flames on that account.  There are also a number of practical problems to =
address, such as whether inode numbers are persistant, but I'm confident th=
at this is the long-term solution.

NATE
