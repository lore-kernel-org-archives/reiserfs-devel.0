From: "{RoC} MasterMind" <bve95001@sneakemail.com>
Subject: Bad root block 0, reiserfsck aborts...partition very slow, errors, HELP!
Date: Thu, 6 May 2004 00:16:11 -0400
Message-ID: <1329-49005@sneakemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18475-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Today I logged on, and noticed things were very slow...that meaning that reads 
from the disk were very slow.  DMA was on, and I switched to a virtual 
terminal to see things like "dma_intr    {DriveReady, SeekComplete Error}"
hda: dma_intr error 0x40 {uncorrectable error}
LBA 269868649 HIGH=16 LOW=1433193 SECTOR 1443288 end request I/O error
ide (3,3):vs-13070: reiserfs_read_inode2:i/o failure occured trying to find 
stat data of [5749 151067 0x0 SD]

I am also having "permission denied" errors when using ls, and files 
disappearing, then reappearing.

I tried running reiserfsck /dev/hda, but it aborted, which is scary:
reiserfsck /dev/hda
reiserfsck 3.6.14 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will read-only check consistency of the filesystem on /dev/hda
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
###########
reiserfsck --check started at Wed May  5 22:53:37 2004
###########
Replaying journal..
No transactions found
Zero bit found in on-disk bitmap after the last valid bit.
Checking internal tree..

Bad root block 0. (--rebuild-tree did not complete)

Aborted

My version of reiserfsprogs is 3.6.14-3 (debian).  This should be the latest 
available, as apt manages my packages.

reiserfsck reported I may have a corrupt or missing superblock (and journal?), 
so I ran reiserfsck --rebuild-sb, and now reiserfsck doesn't error out 
immediately, but nothing I have done has fixed the system.  

Does anyone know what is wrong, and how I can fix this?  Whatever happened, 
happened suddenly, as the system was fine when I left it a few hours before!
