From: "Rob Mueller" <robm@fastmail.fm>
Subject: Re: 2.4.22pre7aa1 ;-) Mit O(1) aber leider kein pre-emption
Date: Tue, 22 Jul 2003 15:32:33 +1000
Message-ID: <001c01c35012$abcc9250$2b8bddcb@lifebook>
References: <200307211639.32418.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14986-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?iso-8859-15?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>, Chris Mason <mason@suse.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

> Data-logging in the works?

I've managed to get this working. Patched to 2.4.22-pre7-aa and then applied
the data logging patches for 2.4.22-pre5 (see
ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.22) which seems
to work fine. I saw two problems though, a function (can't remember which
one) was duplicate defined in mm/filemap.c (exactly the same code appeared
twice), and an EXPORT_SYMBOL() from mm/filemap.c had to be removed as well.
However removing them seemed to work fine.


The patches I applied:

04-reiserfs-sync_fs-4.diff
05-data-logging-39.diff
06-logging-export.diff
06-reiserfs-jh-3.diff
06-write_times.diff
search_reada-5.diff

Rob

