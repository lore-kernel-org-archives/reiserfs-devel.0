From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 01 Sep 2004 07:51:33 -0400 EDT
Message-ID: <216111536359-BeMail@cr593174-a>
References: <413578C9.8020305@namesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21206-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <413578C9.8020305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: ninja@slaphack.com, vonbrand@inf.utfsm.cl, pavel@ucw.cz, jamie@shareable.org, cw@f00f.org, viro@parcelfarce.linux.theplanet.co.uk, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com, zam@namesys.com, torvalds@osdl.org

Hans Reiser wrote on Wed, 01 Sep 2004 00:22:49 -0700:
> Making "hard links only link to the file aspect of the file-directory
> duality, and persons who want to link to the directory aspect must use
> symlinks" seems to solve this.  If we want to use the Alexander Smith
> solution to cycle detection, and allow hard links to directories, then
> we must make sure that for the hard linked entity, there is a single
> lock for it somewhere (e.g. the directory inode) that can be taken.

Oddly enough that's what I did in my RAM file system.  No matter how
the file/directory node is found (the path can lead through different
parents), it has a unique ID and a corresponding single lock for it.

Rename/delete goes and locks all the nodes that might change parents
and/or children, then it does its operations (though it has to watch
out for deadlocks, which are unavoidable when two rename/deletes both
sneak up on the same file by different paths).

- Alex
