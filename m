From: "Fred -- Speed Up --" <speedup@free.fr>
Subject: Re: When is a defragmenting tool expected to be released?
Date: Sat, 26 Apr 2003 09:56:05 +0200
Message-ID: <002c01c30bc9$4ac348b0$0200a8c0@xpstation>
References: <569438017.20030425213516@tnonline.net> <200304261414.00860._nasturtium@bigpond.com> <000e01c30bbb$23ca3470$0200a8c0@xpstation> <20030426073020.GA2283@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13820-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Why won't there be a 2.4 version of Reiser4 ? I knew Reiser4 would be
available for v2.5, but it is intended to be released on september (you know
better than I, if you could tell me when Reiser4 would be released it would
be nice :-D) and the 2.6 kernel should release at the end of 2003, maybe
first quarter of 2004 : why would you release a stable Reiser4 code only on
2.5 kernels, as 2.4 versions may be used for at least one year before major
distros include the 2.6 version.
Is Reiser4 intended to replace Reiser3 (I've read Reiser4 mounter may be
able to mount Reiser3 volumes), or will Reiser3 be kept in 2.2 and 2.4
kernels, as Reiser4 would be 2.5 (and 2.6 ;)) dedicated ?
There are probably necessary features issues (the new VFS maybe), and mostly
performance issues to that would make you release Reiser4 for 2.5 kernels,
but why did you choose to make Reiser4 2.5-only compliant ?
Why aren't there news on the Namesys website ? Maybe cvs logs, or whatever
completion percentage, implemented features, stable ones, maybe some new
performance tests (there are no tests comparing Reiser4, XFS and JFS anymore
on your website) ?
You seem to be a bit late about the kernel experimental release : the latest
one is 2.5.68, and your patches are only available up to 2.5.60. When do you
decide to move on to a newer experimental kernel version ?
May Reiser4 be included in the -ac series ?


While you're up, I've got some questions to ask you (you don't have to
answer all of them ...), as I'm very interersted in your filesystem, and I'm
writing a french doc about Reiser4 :

- Firstly the trees. I read that the it (the storage one, not the semantic
side) grew on top, which makes the key grow in lenght. But what about fanout
? When a file has been deleted, can its former key be freed and reused so
that the tree keeps balanced ? Does Reiser4 otpimize the tree by storing
small files together in a part of the tree, or directories, or whatever
organisation : when a file is being written, does Reiser4 give it the first
key it finds, or does a segragation exist in order to improve performance ?
For instance, small temp files are created and deleted numbers of times,
does a special part of the tree keep those temp files so that only a little
part of the tree is constantly changing ?
- What do you call a 'graph' when speaking about the structure the semantic
layer uses to resolve paths ? How does this part really work (it is not
formally spcified in the doc) ?
- How about folders : what status do they have ? They may be stored as other
files, as they have to keep their own properties, but their information (the
folder's files and subfolder list) is being kept in the semantic layer's
graph : how do you handle with this ?
- Why do you need to store the locality_id in the key ?
- How do you handle with big files wich do not fit in contiguous bloc space,
so they need more than one extended pointer ? How are those other pointers
stored ?
- B+Trees are simply BTrees that do not use BLOBs, am I right ?
- Dancing trees are simply Balanced Trees wich are only modified in an event
of memory pressure, don't they ?
- How is the developement ? I mean, should we await the Reiser 4.0 release
this summer, or do you need some more time ? What features will be included
in 4.0 and which will be left for 4.1 ? Will the packer be ready for release
as Reiser 4.0 comes out ?


Sorry if I'm bugging you, but as you're Release Manager I'm pretty sure
you're the right person to ask ;)
Thank all the Reiser team for the great job you do, and for releasing such
huge documentation about the project without the help of which I wouldn't be
able to understand what's going on ;)

Fred

----- Original Message ----- 
From: "Oleg Drokin" <green@namesys.com>
To: "Fred -- Speed Up --" <speedup@free.fr>
Cc: <reiserfs-list@namesys.com>
Sent: Saturday, April 26, 2003 9:30 AM
Subject: Re: When is a defragmenting tool expected to be released?


> Hello!
>
> On Sat, Apr 26, 2003 at 08:14:47AM +0200, Fred -- Speed Up -- wrote:
>
> > Hans said Reiser4 would use data preallocate blocks as ext2 does, and
the
> > Reiser4 feature paper is speaking about a "repacker" that should be
fully
> > functionnal at 4.1 release. How do you feel about that ?
>
> reiser4 has delaying allocation implemented.
> The "preallocate blocks as ext2 does" reference is reiserfs (v3) thing
> (there is no 2.4 version of reiser4)
>
> Bye,
>     Oleg

