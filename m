From: "Thomas Graham" <lkthomas@sml.dyndns.org>
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 4 Aug 2004 11:33:33 +0800 (HKT)
Message-ID: <55083.202.71.232.79.1091590413.squirrel@sml.dyndns.org>
References: <200406150022.34578.vitaly@namesys.com>
    <200407131427.58912.vitaly@namesys.com>
    <200408031750.00291.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-19954-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408031750.00291.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

how long does it take to build-fs for 200GB data HD ? and how many data am
I going to lost ?

I am just freak out, you guys are promised that disk format wouldn't be
change anymore, but it still changing actually, pretty upset for that
statement.

> Hello All,
>
> This snapshot contains updated reiser4progs-0.5.7 and the grub patch.
>
> It includes several bug fixes against the previous snapshot, and has a
> disk
> format change -- the layout of blocks that contain backuped fs metadata
> are changed.
>
> No kernel patch is needed for the disk format change, however fsck may
> report about some corruptions on an existent fs if a block was allocated
> for some data and has become a backup one. Fsck.reiser4 --build-fs is
> able to fix it of course, although the data in these blocks are lost then.
>
> --
> Thanks,
> Vitaly Fertman
>
>


-- 
HK Celtic Orchestra leader and coordanator: Thomas Graham Lau
Phone number: 852-93239670    (24hours a day, 7days a week non-stop phone)
Web site: http://sml.dyndns.org
Email: lkthomas@sml.dyndns.org
