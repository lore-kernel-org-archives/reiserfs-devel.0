From: Hans Reiser <reiser@namesys.com>
Subject: Re: Authoring a versioning plugin
Date: Fri, 13 Jan 2006 13:48:58 -0800
Message-ID: <43C8204A.1050909@namesys.com>
References: <200601111759.14638.fred@lab.matcom.uh.cu> <200601121014.37940.pvh@uvic.ca> <43C80EC3.7050003@namesys.com> <43C818D2.4080805@ac24.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27702-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43C818D2.4080805@ac24.ee>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Toomas Laasik <toomas@ac24.ee>
Cc: reiserfs-list@namesys.com

Toomas Laasik wrote:

> Hello,
> Here are some links that I have found while searching such file
> systems that can keep versions or log of changes:
> http://logfs.sourceforge.net/ - small logging filesystem project
> started by a student, but not very stable yet
> http://wayback.sourceforge.net/ - written in Perl, based on quite old
> version on FUSE API
> http://sourceforge.net/projects/cvsfs - uses CVS as file system, based
> on FUSE API
> http://www.opensolaris.org/os/community/zfs/ - very powerful file
> system that supports snapshots of files
> Microsoft has made something too on their server platform, but I
> couldn't find a link for that.
>
> It seems to me that many have started with it, but haven't finished.
> Creating a versioning FS that is comercially stable and fast takes a
> lot of effort and is quite complex. Go discover what and how others
> have done it and how to do it best in ReiserFS.
>
> I would be very interested in stable file system that supports
> automatic versioning. Maybe ReiserFS becomes the first one that I can
> actually use. I don't want a userspace FS, but a good FS where I can
> safely keep my FreeBSD installation.
>
> Toomas

Clearcase is out there and finished and it works.  Several thousand
dollars a seat though....

;-)

Hans
