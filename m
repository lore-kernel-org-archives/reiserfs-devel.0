From: "David Dabbs" <david@dabbs.net>
Subject: RE: [RFC] Pathname Semantics with //
Date: Thu, 9 Sep 2004 20:37:27 -0500
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040910013246.BF49B15ED9@mail03.powweb.com>
References: <20040909230333.GB8464@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040909230333.GB8464@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jamie Lokier' <jamie@shareable.org>, 'Christian Mayrhuber' <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org


> From: Jamie Lokier [mailto:jamie@shareable.org]
> 
> Christian Mayrhuber wrote:
> > //http://somehost:port/foo/bla
> 
> While we're here, I'll point out that http://somehost/foo/bla and
> http://somehost/foo/bla/ are valid, distinct URLs.
> 
>... snip
> 
> Food for thought.
> 
> -- Jamie

While I think there are bigger fish to fry before tackling URLish stuff
beyond filesystem access, I'll dive in.

Handwaving over changes to create() and many other apis that enable this,
what happens when you type the following commands? 

  ln -s //http://dabbs.net/foo/ MyPage
  cat MyURL

The first command works just fine today sans /any/ changes. Cat of course
fails (today) because it calls open("MyURL") which will follow the link
provided O_NOFOLLOW was not passed. After our magic mods, VFS will parse the
// escape, see that it is NOT file:// and then what? When we were talking
strictly about filesystem access this wasn't an issue.

We certainly don't want the kernel in the business of being a protocol
proxy, so any non-file:// pathnames could simply return EFAULT or ENOTDIR,
or ELNKURL, which indicates that the target is a URL. Apps that want to do
something /useful/ with the target resource (i.e. desktops) will have
http/ftp/etc libraries. They are free to stat() the file, get the linked-to
URL and use whatever protocol client lib they wish to access the URL. 

Shooting from the hip here. If we want to unify namespaces in a UNIXy way,
what if we make the VFS expose all the non-file "protocol" namespaces
through one mount point, device node or whatever. A filesystem, perhaps
something built using FiST [http://www.filesystems.org/], would "handle" a
protocol. Another, perhaps preferred, option is to steer in the direction of
Plan9, where ftp can be mounted and handled by a user-space filesystem,
ftpfs. 
See http://plan9.bell-labs.com/magic/man2html/4/ftpfs


David


