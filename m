From: Chris Mason <mason@suse.com>
Subject: Re: Data-logging and md as / fs bug
Date: 06 May 2003 15:44:58 -0400
Message-ID: <1052250298.14612.235.camel@tiny.suse.com>
References: <3EB30852.6090402@netscape.net>
	 <20030503103121.GA19798@namesys.com>
	 <200305062134.42520.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13970-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305062134.42520.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Tue, 2003-05-06 at 15:34, Christian Mayrhuber wrote:

> Hi,
> 
> I've patched 2.4.21-rc1 with the following:
>        
> 02-akpm-b_journal_head-1.diff        
> 03-2.4.21-rc1-relocation-6.diff      
> 04-reiserfs-sync_fs-1.diff           
> 05-2.4.21-pre6-data-logging-36.diff  
> 06-logging-export.diff               
> 06-write_times.diff                  
> 07-quota-v2-2.4.21.diff
> 08-2.4.21-pre6-reiserfs-quota-26.diff
> 09-kinoded-8.diff
> 10-reiserfs-quota-link-fix.diff
> 
> After rebooting this kernel it fails to cleanly shutdown /dev/md0, which
> is mounted as / and runs as raid1. This causes a nasty resync of the disks at
> every boot.
> 2.4.21-rc1 without those patches has no problems with md shutdown.
> I just wanted let you know.

Interesting, this isn't a known bug.  Could you please try two things:

1) try to reproduce without any patches past 06-write_times.diff applied
(in other words, without the quota)

2) try to reproduce with only 02-akpm-b_journal_head-1.diff and
03-2.4.21-rc1-relocation-6.diff applied.

thanks!

-chris


