From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Data-logging and md as / fs bug
Date: Tue, 6 May 2003 21:34:42 +0200
Message-ID: <200305062134.42520.christian.mayrhuber@gmx.net>
References: <3EB30852.6090402@netscape.net> <20030503103121.GA19798@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13969-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030503103121.GA19798@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list <reiserfs-list@namesys.com>

Am Samstag, 3. Mai 2003 12:31 schrieb Oleg Drokin:
> Hello!
>
> On Sat, May 03, 2003 at 02:07:46AM +0200, Manuel Krause wrote:
> > is there any effort on data-logging for 2.4.21-rc1+?
>
> Grab the replacement patches from
> ftp://namesys.com/pub/reiserfs-for-2.4/testing/data-logging-and-quota-2.4.2
>1-rc1
>
> Bye,
>     Oleg

Hi,

I've patched 2.4.21-rc1 with the following:
       
02-akpm-b_journal_head-1.diff        
03-2.4.21-rc1-relocation-6.diff      
04-reiserfs-sync_fs-1.diff           
05-2.4.21-pre6-data-logging-36.diff  
06-logging-export.diff               
06-write_times.diff                  
07-quota-v2-2.4.21.diff
08-2.4.21-pre6-reiserfs-quota-26.diff
09-kinoded-8.diff
10-reiserfs-quota-link-fix.diff

After rebooting this kernel it fails to cleanly shutdown /dev/md0, which
is mounted as / and runs as raid1. This causes a nasty resync of the disks at
every boot.
2.4.21-rc1 without those patches has no problems with md shutdown.
I just wanted let you know.
-- 
lg, Chris

