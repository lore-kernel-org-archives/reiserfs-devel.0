From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4progs do not handle the reiser4 format changes
Date: Wed, 27 Jul 2005 00:02:01 +0400
Message-ID: <200507270002.01223.vitaly@namesys.com>
References: <42DE5A5E.9020404@namesys.com> <42E196FB.6080409@namesys.com> <42E2D667.6060104@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25250-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42E2D667.6060104@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sunday 24 July 2005 03:44, Edward Shishkin wrote:
> Edward Shishkin wrote:
> 
> > David Masover wrote:
> >
> >>
> >>
> >> Ok, please explain what this actually means for users.
> >>
> >> How will an FS made by the current reiser4progs be different than 
> >> that made by the new (patched) ones that will be coming out?  Is the 
> >> new way better?  If so, how can one take an existing FS and 
> >> convert/update/tweak it to the new way?
> >>
> >
> > This is a common scenario:
> >
> > Each disk reiser4 is supposed to be supported by all kernel/reiser4.
> 
> 
> I was wrong here: the only last version of kernel/reiser4 is able
> to support _all_ disk file systems. Old kernels will refuse to mount
> file systems of new versions with the warning about wrong plugin set
> of root inode.
> 
> Edward.
> 
> >
> > Both kernel and reiser4progs have a plugin table which should be 
> > upgraded in sync.
> > For each point A of upgrading the plugin table all reiser4progs of 
> > versions < A
> > become invalid for disk reiser4 being once mounted in the 
> > kernel/reiser4 of version >= A.
> >
> > Is it okay?
> > Perhaps introducing a special sub-versions of reiser4/reiser4progs for 
> > upgrading
> > the plugin table will improve the situation..

the reiser4progs obtained from 
ftp.namesys.com/pub/reiser4progs/reiser4progs-1.0.4-1.tar.gz
contain the fix to handle the extended plugin table correctly.

-- 
Thanks,
Vitaly Fertman
