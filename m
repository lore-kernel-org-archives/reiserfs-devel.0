From: Fred Schaettgen <namesys.Sch@ttgen.net>
Subject: Re: Recursive modified-timestamp?
Date: Sat, 1 Jan 2005 19:18:19 +0100
Message-ID: <200501011918.19580.namesys.Sch@ttgen.net>
References: <1909372133-BeMail@cr593174-a> <200501011420.44734.namesys.Sch@ttgen.net> <200501011808.21336.sikkh@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23020-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200501011808.21336.sikkh@wp.pl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Saturday 01 January 2005 18:08, Piotr Neuman wrote:
> > I don't see how dnotify or inotify would help here. You can't monitor
> > whole directory trees with it. inotify (which I admittedly didn't know
> > about) seems to allow monitoring just about ~8000 files per device. And
> > you don't have any guarantee that none of the files changed before the
> > program using inotify starts up.
>
> You have the source code, move that limit up, and change data structures if
> it's necesary for efficient working with large trees...

The model of inotify doesn't fit for this application. It's made to get 
instant feedback when a small number of files or directories are changed. If 
a daemon would have to consume change notifications for the whole filesystem, 
it's hard to imagine that this might work under heavy load. What do you do if 
the change buffer runs full because the daemon has problems catching up? 
Increasing the buffer? What do you do after a system restart, when you can't 
be sure that no files have been touched before a daemon starts to use inotify 
to monitor changes? Scan the whole filesystem on each startup?
At the moment I can't imagine how this could be solved *reliably* without the 
the help of the file system. Do you?

> FAM uses the outdated dnotify (just browse lkml.org for info on inotify
> advantages). One of the goals of GNOME now is to have some platform to
> compete with the "fabled" Microsoft WinFS. Inotify could replace the "not
> so small" FAM, for example read:
>
> http://www.ussg.iu.edu/hypermail/linux/kernel/0407.2/0359.html
> http://www.gnome.org/~veillard/gamin/overview.html

I can't talk about WinFS, because all I know about it is that it will be great 
and late. But that Beagle thing, which uses inotify for indexing looks 
interesting. My bet is that it depends heavily on heuristics to monitor the 
right files. If this is true, then it's certainly not the best solution.
But before bashing it I have to take a look at it first. Thanks for the links.

...
> Inotyfy does not support such queries as BeOS did, but knowing the
> reluctancy of kernel developers to do anything that may increase bloat and
> could be done in userspace anyway, I don't think it will be supported.

*g* You may be right. 
But I thought it might still be worth trying. Especially since reiser4 with 
it's heavily advertised plugin system seems to be somewhat more open to 
extensions. And I'm sure that a much smaller extension than those of the BeOS 
fs would be sufficient. 

Fred

-- 
Fred Schaettgen
Sch@ttgen.net
