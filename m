From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 4 Aug 2004 14:16:17 +0400
Message-ID: <200408041416.17554.vitaly@namesys.com>
References: <200406150022.34578.vitaly@namesys.com> <55083.202.71.232.79.1091590413.squirrel@sml.dyndns.org> <4110A1FA.2030803@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19968-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4110A1FA.2030803@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, Thomas Graham <lkthomas@sml.dyndns.org>
Cc: reiserfs-list@namesys.com

On Wednesday 04 August 2004 12:44, Hans Reiser wrote:
> Thomas Graham wrote:
> >how long does it take to build-fs for 200GB data HD ? and how many data am
> >I going to lost ?
> >
> >I am just freak out, you guys are promised that disk format wouldn't be
> >change anymore, but it still changing actually, pretty upset for that
> >statement.
> >
> >>Hello All,
> >>
> >>This snapshot contains updated reiser4progs-0.5.7 and the grub patch.
> >>
> >>It includes several bug fixes against the previous snapshot, and has a
> >>disk
> >>format change -- the layout of blocks that contain backuped fs metadata
> >>are changed.
> >>
> >>No kernel patch is needed for the disk format change, however fsck may
> >>report about some corruptions on an existent fs if a block was allocated
> >>for some data and has become a backup one. Fsck.reiser4 --build-fs is
> >>able to fix it of course, although the data in these blocks are lost
> >> then.
> >>
> >>--
> >>Thanks,
> >>Vitaly Fertman
>
> Vitaly, your email is a marvel of unclarity that vaguely threatens of
> losing data in ways that cannot be understood by the reader.  Please
> revise and resend, 

these blocks could be allocated for the reiser4 storage tree or user data. 
now they are backup super blocks. if run fsck --build-fs, it recovers the 
backup data in these blocks currently, so the previousely stored tree data 
will be lost.

> and don't make disk format changes in the future
> without discussing them with the rest of the team first.  Perhaps you
> should start that discussion of this disk format change now....

it was discussed many times already, and I mentioned about it in dev 
list many times also, e.g. the last email about it was 'format change in 
the backup layout' from 28/07/04. Btw, You agreed with this backup
layout scheem in the 'Reiser4 on-disk format' discussion more then a 
month ago.

-- 
Thanks,
Vitaly Fertman

