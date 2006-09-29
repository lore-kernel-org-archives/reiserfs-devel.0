From: Edward Shishkin <edward@namesys.com>
Subject: Re: icheck and ncheck on ReiserFS to convert bad sector numbers to
 filenames
Date: Fri, 29 Sep 2006 04:56:14 +0400
Message-ID: <451C6F2E.4020106@namesys.com>
References: <60509cfa0609281651v5553d879jd65b8e6d6041b14c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29987-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <60509cfa0609281651v5553d879jd65b8e6d6041b14c@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: chris@witham.com
Cc: reiserfs-list@namesys.com

Chris Witham wrote:

> I have a hard drive which has failed.  I posted about it here[1], and
> was referred to ddrescue[2] to create an image of the failed disk.
> This was successful, and I now have an image of the drive, including
> the 1688 bad sectors that couldn't be read.  The logfile lists all the
> the bad sectors, and I was referred to these[3] instructions to
> convert the bad sector numbers into filenames that are corrupted.
>

Make sure that blocksize for copy operation performed by dd_rescue
was specified as Reiserfs blocksize (4096) and bad block images were
zeroed, then run reiserfsck on the backup.

> Unfortunately, those instructions involve debugfs, which is
> ext2/ext3-specific.  What little information I was able to find online
> about the icheck and ncheck commands used in the instructions and
> ReiserFS has led me to either complaints that they are not implemented
> for ReiserFS, or some variant of a post[4] to this mailing list that
> suggests using 'find / -type f -exec cat {} > /dev/null \;' at
> watching for the filenames that fail.
>
> That seems like a complete brute force method (scanning over 110GB to
> locate 800kB of bad data!), and will almost certainly return
> inaccurate results because the drive is continuing to fail and will
> return more problems than it experienced initially when the drive
> image was made.  (Not to mention stress the disk further and make any
> more work I may need to do on it more difficult.)
>
> Is there any way to do the equivalent of icheck or ncheck in ReiserFS?
> If not now, are there plans to implement this functionality anytime
> soon?
>
>
> [1] http://www.linuxquestions.org/questions/showthread.php?t=485322
> [2] http://savannah.gnu.org/projects/ddrescue/
> [3] http://smartmontools.sourceforge.net/BadBlockHowTo.txt
> [4] http://marc.theaimsgroup.com/?l=reiserfs&m=114425109321290&w=2
>
>

