From: Hans Reiser <reiser@namesys.com>
Subject: I changed the subject line so that vitaly will read it....
Date: Fri, 11 Mar 2005 11:48:43 -0800
Message-ID: <4231F61B.9090400@namesys.com>
References: <Pine.GSO.4.44.0503101327540.12813-100000@elaine24.Stanford.EDU>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.GSO.4.44.0503101327540.12813-100000@elaine24.Stanford.EDU>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Junfeng Yang <yjf@stanford.edu>, vitaly@thebsh.namesys.com
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com, mc@cs.Stanford.EDU

Junfeng Yang wrote:

>Hi, our mail server had some problems the last few days.  I'm not sure if
>you guys have received my message or not.  Can you please send me an ACK,
>even if you haven't gotten time to diagnose the error yet?
>
>Thanks a lot,
>-Junfeng
>
>On Wed, 9 Mar 2005, Junfeng Yang wrote:
>
>  
>
>>Let me know if you need any more information to reproduce the warning.  I
>>would really appreciate it if you can cc me once you figure out if it is a
>>bug.
>>
>>-Junfeng
>>
>>On Sun, 6 Mar 2005, Junfeng Yang wrote:
>>
>>    
>>
>>>Hi Vladimir, are you able to reproduce the problem?
>>>
>>>Thanks,
>>>-Junfeng
>>>
>>>On Sat, 5 Mar 2005, Junfeng Yang wrote:
>>>
>>>      
>>>
>>>>>I just made the follong test on reiserfs (2.6.11-rc4-mm1):
>>>>>mkreiserfs /dev/hda6
>>>>>mount /dev/hda6 /mnt -o sync
>>>>>touch /mnt/file
>>>>>mkdir /mnt/d
>>>>>echo Hello > /mnt/hello
>>>>>reboot -f -n
>>>>>          
>>>>>
>>>>Here is what I do to reproduce the same problem:
>>>>
>>>>1. mkreiserfs on a partition
>>>>2. issue several file system operations
>>>>3. "crash" and resart the machine
>>>>4. run reiserfsck --fix-fixable --yes to recover
>>>>5. mount the recovered partition.
>>>>
>>>>It appears that step 4 is _important_ in reproducing the problem.  If I
>>>>just mount the crashed disk, everything appears to be fine.  However,
>>>>attempt to recover the crashed image using reiserfsck result in
>>>>metadata/data loss.
>>>>
>>>>Details are attached below.  Let me know if you need any more information.
>>>>
>>>>The script I use (run as root)
>>>>#!/bin/sh
>>>>umount /dev/hda9
>>>>/sbin/mkreiserfs -f /dev/hda9
>>>>mount -t reiserfs /dev/hda9 /mnt/sbd1 -o sync,dirsync
>>>>ln -s /mnt/sbd1 /mnt/sbd1/0001
>>>>touch /mnt/sbd1/0002
>>>>mkdir /mnt/sbd1/0003
>>>>reboot -f -n
>>>>
>>>>uname -a shows:
>>>>Linux notus 2.6.11 #1 Sat Mar 5 04:39:12 PST 2005 i686 GNU/Linux
>>>>
>>>>reiserfsck output is:
>>>>reiserfsck 3.6.19 (2003 www.namesys.com)
>>>>
>>>>*************************************************************
>>>>** If you are using the latest reiserfsprogs and  it fails **
>>>>** please  email bug reports to reiserfs-list@namesys.com, **
>>>>** providing  as  much  information  as  possible --  your **
>>>>** hardware,  kernel,  patches,  settings,  all reiserfsck **
>>>>** messages  (including version),  the reiserfsck logfile, **
>>>>** check  the  syslog file  for  any  related information. **
>>>>** If you would like advice on using this program, support **
>>>>** is available  for $25 at  www.namesys.com/support.html. **
>>>>*************************************************************
>>>>
>>>>Will check consistency of the filesystem on /dev/hda9
>>>>and will fix what can be fixed without --rebuild-tree
>>>>Will put log info to 'stdout'
>>>>###########
>>>>reiserfsck --fix-fixable started at Sat Mar  5 12:16:12 2005
>>>>###########
>>>>Replaying journal..
>>>>No transactions found
>>>>Checking internal tree..finished
>>>>Comparing bitmaps..finished
>>>>Checking Semantic tree:
>>>>finished
>>>>No corruptions found
>>>>There are on the filesystem:
>>>>        Leaves 1
>>>>        Internal nodes 0
>>>>        Directories 1
>>>>        Other files 0
>>>>        Data block pointers 0 (0 of them are zero)
>>>>        Safe links 0
>>>>###########
>>>>reiserfsck finished at Sat Mar  5 12:16:15 2005
>>>>###########
>>>>
>>>>second mount of the crashed disk shows:
>>>>ReiserFS: hda9: found reiserfs format "3.6" with standard journal
>>>>ReiserFS: hda9: using ordered data mode
>>>>ReiserFS: hda9: journal params: device hda9, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
>>>>ReiserFS: hda9: checking transaction log (hda9)
>>>>ReiserFS: hda9: Using r5 hash to sort names
>>>>
>>>>
>>>>        
>>>>
>>>      
>>>
>>    
>>
>
>
>
>  
>

