From: Francesco Biscani <frbiscani@jumpy.it>
Subject: Re: fsck.reiser4 wrong size error (?)
Date: Fri, 13 Aug 2004 22:06:28 +0200
Message-ID: <200408132206.28624.frbiscani@jumpy.it>
References: <cd32a06204080910256de4cc0e@mail.gmail.com> <200408122308.06962.frbiscani@jumpy.it> <20040813091612.GF13834@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20278-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040813091612.GF13834@backtop.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Alex Zarochentsev <zam@namesys.com>

Hi,

On Friday 13 August 2004 11:16, Alex Zarochentsev wrote:
> Changing fs root dir fibration plugin would do that if the root dir was
> empty. Current code does not allow it.
>
> So, the problen cannot be fully solved.  However, you can re-create all
> second level sub-directories and assign another fibration plugins to them.

Would something like this be appropriate:

# mkdir /bin_new
# echo -e "ext-1\0" > /bin_new/metas/plugin/fibration
# cp -a /bin/* /bin_new/
# rm -fr /bin
# mv /bin_new /bin

Could this break systems or applications that relies on mtimes or other 
file/dir attributes? (Gentoo's portage system comes to mind) The "-a" option 
of cp should make this safe IMO.

> fs/reiser4/vfs_opts.c:reiser4_parse_options contains opts[] -- an array of
> all reiser4 mount option descriptions.

I'll look into that. Thanks for the pointer.

Thanks very much for the reply,

  Francesco
