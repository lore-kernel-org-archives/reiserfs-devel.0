From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Problem with the latest auto snapshot
Date: Sat, 12 Jun 2004 22:46:49 +0300
Message-ID: <20040612194649.GF4990@nysv.org>
References: <200406122131.25974.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19158-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200406122131.25974.henning-04@die.informatik.uni-siegen.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Cc: reiserfs-list@namesys.com

On Sat, Jun 12, 2004 at 09:31:25PM +0200, Henning Westerholt wrote:

>After some few disk operation a process try to access some data on the 
>partition, and hung forever. I got the following log entries:
[snip]
>I could not kill the process, a reboot was needed.

I had something similar, with an old auto-snapshot, but I didn't get
those log messages. It also repeated on, 2004.06.09 under some mild load,
compiling .11-19.36 and doing a dist-upgrade. I'll dig out some traces
if it still repeats with this kernel, as they seem to have systematically
receeded.

I wonder if we have something different concerning debug?
mjt@shrike:~$ zgrep -i reiser4 /proc/config.gz 
CONFIG_REISER4_FS=y
# CONFIG_REISER4_FS_SYSCALL is not set
CONFIG_REISER4_LARGE_KEY=y
# CONFIG_REISER4_CHECK is not set
CONFIG_REISER4_USE_EFLUSH=y
# CONFIG_REISER4_COPY_ON_CAPTURE is not set
# CONFIG_REISER4_BADBLOCKS is not set
mjt@shrike:~$ 

>Any operation on the fs fail with a input/ output error. I try to fix this 
>with fsck, but it found no errors. I attached the output from the first fsck 
>runs.
>I'll rebuild the partition tomorow, and give it another try..

I just ran a bonnie++ without any problems. The machine isn't under any
real load, though.
top - 22:42:30 up 58 min, 16 users,  load average: 3.29, 2.37, 1.42
I'm just watching Threshold's Critical Energy live DVD, so all that is all
bonnie's doing.

Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
shrike           1G 11969  50 38699  19 16239  16 13620  62 29511  16 166.2 1
                    ------Sequential Create------ --------Random Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16 16636  62 +++++ +++  5849  62  6758  64 +++++ +++  5921 64
shrike,1G,11969,50,38699,19,16239,16,13620,62,29511,16,166.2,1,16,16636,62,+++++,+++,5849,62,6758,64,+++++,+++,5921,64

-- 
mjt

