From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Data-logging and md as / fs bug
Date: Wed, 14 May 2003 00:18:26 +0200
Message-ID: <200305140018.26691.christian.mayrhuber@gmx.net>
References: <3EB30852.6090402@netscape.net> <20030512072943.GA21604@namesys.com> <5.2.0.9.2.20030513224724.01cc3d10@pop.tvnet.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14098-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5.2.0.9.2.20030513224724.01cc3d10@pop.tvnet.hu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Am Dienstag, 13. Mai 2003 23:52 schrieb Newsmail:
> wow could somebody make my mind a bit more clear: what patches to use
> exactly to have the more error less functioning with datalogging without
> quota? Manuel uses patches posted only on the mailing list but not present
> on suse.de or namesys.com apparently. is it better to use what he uses, or
> some of them are +- useless as not on namesys, or what happens exactly?
> cheers,
> greg


At the moment the newest ones are at:
ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21/

Needed for data logging:
02-akpm-b_journal_head-1.diff.gz
03-relocation-8.diff.gz
04-reiserfs-sync_fs-4.diff.gz
05-data-logging-37.diff.gz
06-logging-export.diff.gz

General speedup:
06-write_times.diff.gz 

Quota support:
07-quota-v2-2.4.21.diff.gz
08-reiserfs-quota-27.diff.gz
09-kinoded-8.diff.gz
10-reiserfs-quota-link-fix.diff.gz

Those patches apply to 2.4.21-rc1 and 2.4.21-rc2.
If you want data logging only you do not need
"General Speedup" and "Quota support".

I have all of them running and did some stress tests
over the weekend. Those patches are behaving nice.
They have good performance, seem stable and look like
they do not corrupt any data.

Hopefully, the data logging part is due for inclusion in
2.4.22-pre.
-- 
lg, Chris

