From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Strange errors with 2.4.22 patches (from Chris) and bonnie++
Date: Sat, 29 Nov 2003 20:27:22 +0100
Message-ID: <3FC8F31A.7000501@gmx.net>
References: <bq8f7u$ufn$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16183-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <bq8f7u$ufn$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Jens Benecke wrote:
> Hi,
> 
> I applied the 2.4.22 patches from Chris Mason's SuSE FTP directory for data
> logging etc:
> 
> available at 
> http://mirrors.mathematik.uni-bielefeld.de/pub/linux/suse/people/mason
> patches/data-logging/2.4.22/ or
> mirror.mcs.anl.gov/suse-people/mason/patches/data-logging/2.4.22/
> 
> root         3109 Jul 11 21:10 02-akpm-b_journal_head-1.diff
> root        17133 Jul 11 21:10 04-reiserfs-sync_fs-4.diff
> root       155659 Jul 11 21:09 05-data-logging-39.diff
> root          650 Jul 11 21:10 06-write_times.diff
> root        41276 Jul 11 21:09 07-reiserfs-quota-28.diff
> root         3275 Jul 11 21:15 08-kinoded-9.diff
> root         2653 Jul 11 21:10 10-reiserfs-quota-link-fix.diff
> root          898 Oct 10 12:25 README

Huh! What has happened to 06-reiserfs-jh-3.diff on the ftp server?
I've the above patches + jh-3 running for months. Without any problems 
on servers and on clients.

-- 
lg, Chris

