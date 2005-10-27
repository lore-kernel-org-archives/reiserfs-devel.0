From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: Our introduction to Reiser-list
Date: Wed, 26 Oct 2005 20:55:47 -0400
Message-ID: <87irvjdbho.fsf@evinrude.uhoreg.ca>
References: <200510251558.13860.pvh@uvic.ca> <435FB231.5070507@nauticom.net>
	<5c49b0ed0510261540l370acbfepfe4b6649c91cee61@mail.gmail.com>
	<200510261702.06844.jgilmore@glycou.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26673-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510261702.06844.jgilmore@glycou.com> (John Gilmore's message
	of "Wed, 26 Oct 2005 17:02:06 +0000")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Wed, 26 Oct 2005 17:02:06 +0000, John Gilmore <jgilmore@glycou.com> said:

> On Wednesday 26 October 2005 22:40, Nate Diller wrote:
>> File-as-Directory
>> The issue with file-as-directory (FaD) is that it removes the Acyclic
>> property of the namespace graph.

More precisely, it removes an easy criterion which prevents directed
cycles.  There are other ways to prevent directed cycles, but preventing
directories from being hard-linked is an easy way to do it.

One way, which I had suggested before, and I had promised to work out
some of the nasty details, but haven't had time to yet (it's still on my
todo list), is to keep parent pointers for all nodes.  Whenever you
create a new hardlink, you walk up the tree and see if that new hardlink
will create a cycle.  While this *may* require, in the worst case, a
traversal of the entire tree, it is highly unlikely to do so, under most
peoples' file organization scheme.  (Hard links are rare, and very deep
and narrow hierarchies are rare too.)

[...]

>> It's been awhile since I took graph theory, and I got a C in it
>> anyway, but the algorithms I have seen for determining graph
>> connectivity end up traversing to every node in the graph in the
>> worst case.

That is correct.  Any algorithm for determining graph connectivity, or
checking for directed cycles, by necessity has to traverse the entire
graph in the worst case.  So you definitely don't want to restart your
algorithm from scratch on every link/unlink operation.  The best that
you could hope for is that you can maintain a separate data structure
that you update on every link/unlink operation, which allows you to
easily determine whether the graph is connected, or if it has a directed
cycle.  But from my own studies in this area, it doesn't seem very
likely that such a data structure can me easily maintained.

>> This means that the file system would potentially have to read in the
>> directory data for every link to every file in the system, for a
>> single deletion operation.

> If the issue is really the matter of removing the acyclic property,
> wouldn't that be solved by requiring that the file contains no
> non-dynamically generated subdirectories? That way, the graph is still
> acyclic, making reference counting work again.

I think we would still want to have hardlinks to files that contain
dynamically generated subdirectories; one of the purposes for
file-as-dir is to be able to attach arbitrary metadata to a file.

But yes, preventing hardlinks to files that contain non-dynamically
generated subdirectories would ensure that there are no directed cycles
(as long as we are sure that the dynamically-generated subdirectories
don't do stupid things).

> I had understood that a big part of the issue with file-as-directory
> was the same as the issue with hard links to directories. Which I
> thought is that if you move one directory into another, you can lose
> the connection to the root of the filesystem

I think that you can run into this problem even without (multiple) hard
links to directories.  And I believe this is solved by making sure that
when you move directory A into directory B, you check the pathname to
make sure that A isn't a prefix of B.

I believe that as long as you check that, and ensure that the graph has
no directed cycles, and never unlink a non-empty directory (or rather a
directory with no non-dynamically generated subdirectories), you won't
have to worry about losing the connection to the root.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

