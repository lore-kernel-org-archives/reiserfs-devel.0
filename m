From: Ian Kent <raven@themaw.net>
Subject: Re: request for patches: showing mount options
Date: Fri, 27 Jul 2007 23:30:56 +0800
Message-ID: <1185550256.3203.77.camel@raven.themaw.net>
References: <E1IEQ7q-0000qE-00@dorka.pomaz.szeredi.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <E1IEQ7q-0000qE-00@dorka.pomaz.szeredi.hu>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, kzak@redhat.com, ericvh@gmail.com, lucho@ionkov.net, zippel@linux-m68k.org, hpa@zytor.com, rathamahata@php4.ru, dhowells@redhat.com, sfrench@samba.org, mhalcrow@us.ibm.com, phillip@hellewell.homeip.net, hirofumi@mail.parknet.co.jp, mikulas@artax.karlin.mff.cuni.cz, wli@holomorphy.com, shaggy@austin.ibm.com, vandrove@vc.cvut.cz, trond.myklebust@fys.uio.no, aia21@cantab.net, mark.fasheh@oracle.com, kurt.hackel@oracle.com, reiserfs-devel@vger.kernel.org, bfennema@falcon.csc.calpoly.edu, dushistov@mail.ru, xfs-masters@oss.sgi.com, arnd@arndb.de, holzheu@de.ibm.com

On Fri, 2007-07-27 at 15:45 +0200, Miklos Szeredi wrote:
> [please consider pruning the CC list if discussing some aspect, which
> doesn't concern all]
> 
> I've done an audit of all filesystems with regards to showing mount
> options in /proc/<pid>/mounts.  Unfortunately most of them show none
> or only a part of all accepted options (for details see list of
> filesystems at the end of the mail).
> 
> This is currently not a big problem, because mount(8) stores the given
> options in /etc/mtab.  However we want to get rid of mtab, and this
> requires, that the option showing be fixed up.
> 
> It would be easiest if this was done by the VFS instead of having to
> deal with it in filesystems.  However there are differences in how
> filesytems handle options during mount and remount, and it would be
> impossible to take this into account in all cases.
> 
> If you are CC-ed, and responsible for one of these filesystems, please
> take a moment to fully implement the ->show_options() method.  In most
> cases it should be an easy task.
> 
> If for some reason you are unable to do this, please let me know and
> I'll fix it up.
> 
> Here are some guidelines for showing options.  I'll also add these to
> Documentation/filesystems/vfs.txt
> 
> +   If a filesystem accepts mount options, it must define show_options()
> +   to show all the currently active options.  The rules are:
> +
> +     - options MUST be shown which are not default or their values differ
> +       from the default
> +
> +     - options MAY be shown which are enabled by default or have their
> +       default value
> +
> +   Options used only internally between a mount helper and the kernel
> +   (such as file descriptors), or which only have an effect during the
> +   mounting (such as ones controlling the creation of a journal) are exempt
> +   from the above rules.
> 
> Thanks,
> Miklos
> 
> -------
> legend:
> 
>   all - fs has options, but doesn't define ->show_options()
>   some - fs defines ->show_options(), but some options are not shown
>   noopt - fs does not have options
>   good - fs shows all options
>   patch - I have a patch
> 
> 
> 9p          some
> adfs        all (maintainer?)
> affs        all
> afs         all
> autofs      all

I'm not sure I understand this.
How does autofs show it's options without a ->show_options method?

> autofs4     some

OK, uid and gid aren't shown.
That should be straight forward to fix.
What's your time frame for this?

Ian


