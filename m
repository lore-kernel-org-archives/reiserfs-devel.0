From: "David Dabbs" <david@dabbs.net>
Subject: RE: [SPAM] RE: [RFC] Pathname Semantics with //
Date: Fri, 10 Sep 2004 12:11:56 -0500
Message-ID: <20040910170731.495DC15C93@mail03.powweb.com>
References: <20040910095355.GA20383@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21682-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040910095355.GA20383@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jamie Lokier' <jamie@shareable.org>
Cc: 'Christian Mayrhuber' <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org



> Jamie Lokier
> 
> David Dabbs wrote:
> 
> > Shooting from the hip here. If we want to unify namespaces in a UNIXy
> way,
> > what if we make the VFS expose all the non-file "protocol" namespaces
> > through one mount point, device node or whatever. A filesystem, perhaps
> > something built using FiST [http://www.filesystems.org/], would "handle"
> a
> > protocol. Another, perhaps preferred, option is to steer in the
> direction of
> > Plan9, where ftp can be mounted and handled by a user-space filesystem,
> > ftpfs.
> > See http://plan9.bell-labs.com/magic/man2html/4/ftpfs
> 
> You can already do it, something like this:
> 
>     mkdir /http:; mount none /http: -t uservfs -o view=http
>     mkdir /ftp:;  mount none /ftp:  -t uservfs -o view=ftp
> 
> I don't see any compelling reason to make "//" special for this.
> However, if there is such a reason, then you could just mount protocol
> handlers on "//http:" and so on, and make "//" a normal directory with
> a special name.
> 
> -- Jamie

Jamie, we _definitely_ agree, except apps that want to create links to URLs
will prepend one slash to the URL instead of two. Is your reference to
uservfs a "foo" reference or do you mean
http://sourceforge.net/projects/uservfs/? It looks a little dusty. But we
are pulling in the same direction.

The /file: node could simply be a symlink. Thus we have

      cd /
      ln -s / file:
      mkdir http:; mount none /http: -t uservfs -o view=http
      mkdir ftp:;  mount none /ftp:  -t uservfs -o view=ftp
      #etc...

Pathnames would be resolved with the existing code in namei.c. I can
understand mounting a URL whose protocol looks like a fs tree (e.g. ftp),
but http? Namei() parses the pathname one component at a time, checks the
dcache, and goes to the fs when that fails. Let's trace through how a URL
might get resolved. 

      ln -s /http://sourceforge.net/projects/uservfs
      cat uservfs

Pathname would be resolved as 

      /http:          
      sourceforge.net/
      projects/
      uservfs

I need to look closer at namei (or the uservfs code if it really supports a
view=http). As long as a fs can generate meaningful, stateful values in
response to VFS calls to real_lookup(), then this may work. 


David


