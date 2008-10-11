From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-2.6.27
Date: Sun, 12 Oct 2008 01:14:51 +0400
Message-ID: <48F1174B.5050704@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>
Cc: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <artur.makowka@gmail.com>

Hello everyone.

This patch is based on reiser4-for-2.6.25 and contains the following
changes:

1) use trylock_page instead of !TestSetPageLocked (Mathieu B=E9langer);
2) use file_remove_suid() instead of remove_suid() (Mathieu B=E9langer)=
;
3) fix the problem with gzip1 compression in the case when reiser4 is
   compiled as a module;
4) use __set_page_dirty_nobuffers() instead of reiser4_set_page_dirty()=
;
5) update reiser4_set_page_dirty_internal() to take into account the la=
test
   changes in vfs.

(4) and (5) fix annoying oom under heavy workload (reproducible with
dbench 190).

The stuff for download can be found here:
http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-fo=
r-2.6/

Thanks,
Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
