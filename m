From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: [patch] lockdep: annotate vfs_rmdir for filesystems that take
	i_mutex in delete_inode
Date: Wed, 26 Jul 2006 08:38:28 +0200
Message-ID: <1153895908.2896.6.camel@laptopd505.fenrus.org>
References: <9a8748490607251516j1433306ek9c64cc84c0838f7b@mail.gmail.com>
	 <20060725223327.b6d039b2.akpm@osdl.org>
	 <1153895524.2896.2.camel@laptopd505.fenrus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030414AbWGZGkr@vger.kernel.org>
In-Reply-To: <1153895524.2896.2.camel@laptopd505.fenrus.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: Jesper Juhl <jesper.juhl@gmail.com>, linux-kernel@vger.kernel.org, reiser@namesys.com, viro@zeniv.linux.org.uk, viro@ftp.linux.org.uk, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, Ingo Molnar <mingo@elte.hu>

On Wed, 2006-07-26 at 08:32 +0200, Arjan van de Ven wrote:
> > The VFS takes the directory i_mutex and reiserfs_delete_inode() takes the
> > to-be-deleted file's i_mutex.
> > 
> > That's notabug and lockdep will need to be taught about it.
> 
> Actually the annotation is in vfs_rmdir() since that is where the parent
> is taken (this may sound odd but the I_MUTEX_* ordering rules require
> the parent taking to be annotated rather than the child)


Ignore this; this one is wrong, more later
