From: "'Andreas Dilger'" <adilger@clusterfs.com>
Subject: Re: Write-once file system
Date: Fri, 27 Jun 2003 11:27:22 -0600
Message-ID: <20030627112720.F7414@schatzie.adilger.int>
References: <12C7D768CC8ED4118A9200508BEEC6FB033776CD@zanexch.zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14749-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <12C7D768CC8ED4118A9200508BEEC6FB033776CD@zanexch.zantaz.com>; from FVang@Zantaz.com on Fri, Jun 27, 2003 at 10:07:05AM -0700
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fong Vang <FVang@Zantaz.com>
Cc: 'Hans Reiser' <reiser@namesys.com>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

On Jun 27, 2003  10:07 -0700, Fong Vang wrote:
> this doesn't seem to work on kernel 2.4.20.  I did a chattr +i on file but
> rm -rf (as root) on the file deletes it.

That is a reiserfs bug then...  I just tested it with ext3 and it worked as
expected.

[root]# chattr +i /tmp/ttt
[root]# echo foo >> /tmp/ttt
bash: /tmp/ttt: Permission denied
[root]# cp /etc/hosts /tmp/ttt
cp: cannot create regular file `/tmp/ttt': Permission denied
[root]# mv /tmp/cvsErIatf /tmp/ttt
mv: cannot move `/tmp/cvsErIatf' to `/tmp/ttt': Operation not permitted
[root]# rm -f /tmp/ttt
rm: cannot unlink `/tmp/ttt': Operation not permitted
[root]# mv /tmp/ttt /tmp/foo
mv: cannot unlink `/tmp/ttt': Operation not permitted
mv: cannot remove `/tmp/ttt': Operation not permitted


Note however, that I now see that an immutable directory can not have new
files created in it, so there is no easy way for new files to inherit the
immutable flag.  That could probably be done on a per-filesystem basis by
mounting with a new option "inherit=immutable" or something like that.

Andreas Dilger [mailto:adilger@clusterfs.com] wrote:
> On Jun 27, 2003  09:07 -0700, Fong Vang wrote:
> > Once the write to the file is CLOSED the file should not be modifiable in
> > any way.  It should not be writeable by root.  Ideally, this should be
> > across reboot and across kernel.  The current requirement is that as long
> as
> > the modified kernel/reisefs is being used then it should NOT be modifiable
> > (if a kernel allowing modification is used then it could allow
> > modifications).
> 
> Sounds like "immutable" (chattr +i) support is what you want.  It looks
> like reiserfs already supports this.  Even root can not overwrite or delete
> an immutable file, but could disable the immutable flag first (chattr -i)
> before doing so.  Regular users can never disable the immutable flag once
> set without the CAP_LINUX_IMMUTABLE capability.  However, it looks like
> the reiserfs code has a bug there - any user can clear the immutable flag
> (see ext[23]_ioctl() for proper permission check).
> 
> In BSD (AFAIK), removing the immutable flag requires that you be booted
> into runlevel 1 (single user) but in Linux it can currently be done at any
> time, although I imagine it would be pretty easy to fix that.
> 
> You should be able to set the immutable flag on a directory and have it
> inherited by all files created in that directory.
> 
> > Fong Vang wrote:
> > >We rely heavily on reiserfs for some of our critical file systems.  I'm
> > >wondering what work would be involved and how difficult it would be to
> add
> > >an option (perhaps at mount time) to reiserfs that will allow a file to
> be
> > >written only once, i.e. once a file is created it should not be allowed
> to
> > >be modified or deleted (including the inode).  We may consider paying for
> > >this modification.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

