From: Matt Stegman <matts@ksu.edu>
Subject: Re: fsck.reiser4 wrong size error (?)
Date: Fri, 13 Aug 2004 15:26:26 -0500 (CDT)
Message-ID: <Pine.GSO.4.44L.0408131513520.11129-100000@unix2.cc.ksu.edu>
References: <200408132206.28624.frbiscani@jumpy.it>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20279-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408132206.28624.frbiscani@jumpy.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francesco Biscani <frbiscani@jumpy.it>
Cc: reiserfs-list@namesys.com



On Fri, 13 Aug 2004, Francesco Biscani wrote:

> Hi,
>
> On Friday 13 August 2004 11:16, Alex Zarochentsev wrote:
> > Changing fs root dir fibration plugin would do that if the root dir was
> > empty. Current code does not allow it.
> >
> > So, the problen cannot be fully solved.  However, you can re-create all
> > second level sub-directories and assign another fibration plugins to them.
>
> Would something like this be appropriate:
>
> # mkdir /bin_new
> # echo -e "ext-1\0" > /bin_new/metas/plugin/fibration
> # cp -a /bin/* /bin_new/
> # rm -fr /bin
> # mv /bin_new /bin
>
> Could this break systems or applications that relies on mtimes or other
> file/dir attributes? (Gentoo's portage system comes to mind) The "-a" option
> of cp should make this safe IMO.

The ctime will be updated.  'cp -a' cannot preserve the ctime field.
Whether or not your application uses the ctime is something you'll have to
determine (backup software usually does, for example).

cp also does not copy EAs or ACLs, or any attributes set by chattr (not
applicable to reiser4).  Any other attributes or permissions unique to
reiser4 would also not be copied.

-- 
Matt Stegman


