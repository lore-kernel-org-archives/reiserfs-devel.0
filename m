From: Hans Reiser <reiser@namesys.com>
Subject: Re: bug: reiserfsck reports "neither new nor old
 reiserfs format found"
Date: Sat, 26 Oct 2002 04:07:53 +0400
Message-ID: <3DB9DCD9.9080602@namesys.com>
References: <m3n0p23lqn.fsf@gateway.askos> <200210251718.29370.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11789-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Moritz Franosch <mail@Franosch.org>, reiserfs-list@namesys.com

Vitaly Fertman wrote:

>Hi, 
>
>  
>
>>I've installed the system with Suse 8.0, the system booted (many
>>times), then hang and I switched off.
>>
>>The next boot, the kernel paniced with the message
>>
>>read_super_block: can't find a reiserfs filesystem on (dev 03:02, block 64,
>>size 1024)
>>
>>Thus I've downloaded reiserfsprogs-3.6.3.tar.gz and did
>>    
>>
>
>Please take the last 3.6.4 version of reiserfsprogs.
>
>  
>
>>reiserfsck --check --logfile check.log /dev/hda2
>>
>>It reported (I've to type from the screen):
>>
>>reiserfs_open: neither new nor old reiserfs format found on /dev/hda2
>>reiserfsck: could not open filesystem on "/dev/hda2"
>>    
>>
>
>Your super block got corrupted somehow or you have your partition table 
>changed so that the blocknumber of the superblock was changed.
>
>To rebuild the corrupted superblock you can use reiserfsck --rebuild-sb.
>
>  
>
>>"echo $?" reported 0 as exit status, check.log has size 0.
>>
>>According to the man page, reportig 0 as an exit status in this case
>>is a bug:
>>man reiserfsck says:
>>  2.  Run reiserfsck --check --logfile check.log /dev/hda1.  If
>>  reiserfsck --check exits with status 0 it means no errors were
>>  discovered.
>>    
>>
>
>We decided to not provide a special exit code for corrupted super block
>to avoid an automation of super block recovery. This is a difficult case 
>and should be done manually. 
>
Tell users that when fsck runs and finds a bad super.

>
>  
>
>>Thank you,
>>
>>Moritz
>>    
>>
>
>  
>



