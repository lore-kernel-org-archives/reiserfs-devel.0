From: Bingner Sam J Contractor PACAF CSS/SCHE <Sam.Bingner@hickam.af.mil>
Subject: FW: Problem with reiserfsck --rebuild-tree
Date: Fri, 30 Aug 2002 08:19:46 -0000
Message-ID: <5C13D527041B9145AB3E6D5D040494AD09CB74@himl07.hickam.pacaf.ds.af.mil>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C24FFD.F4250193"
Return-path: <reiserfs-list-return-11347-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: "'reiserfs-list@namesys.com '" <reiserfs-list@namesys.com>
Cc: "'sam@dhs.org '" <sam@dhs.org>

------_=_NextPart_000_01C24FFD.F4250193
Content-Type: text/plain

 <<rebuild.log.gz>> 
I had some corruption on my drive, and it hammered the FS (and alot of
the files I'm sure) ... so I had to run reiserfsck --rebuild-tree ...
I'm attaching the output as well as the logfile, it looks like it's
finding alot of good dirs etc, but it's getting a segfault...  any help
would be greatly appreciated...

my tape drive is FUBAR, so unfortunately, no I don't have a backup of
everything ;)

Lastly, I'm not subscribed to the list. Please CC me at either this
address or sam@dhs.org on all replies... thanks :)

Sam

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.3

  **********************************************************
  ** This  is  an  experimental  version  of  reiserfsck, **
  **              !! MAKE A BACKUP FIRST !!               **
  ** Don't run this program unless something  is  broken. **
  ** Some types of random FS damage can be recovered from **
  ** by  this  program,   which  basically   throws  away **
  ** the internal nodes of the tree and then reconstructs **
  ** them. This program is for use only by the desperate, **
  ** and is  of only beta quality.  If you are using  the **
  ** latest  reiserfsprogs  and  it  fails  please  email **
  ** bug reports to reiserfs-list@namesys.com.            **
  **********************************************************

Will rebuild the filesystem (/dev/md0) tree
Will put log info to 'rebuild.log'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Thu Aug 29 21:15:47 2002
###########

Pass 0:
Whole device (6297344 blocks) is to be scanned
Skipping 8403 blocks (super block, journal, bitmaps) 6288941 blocks will
be read
0%2_99145 - will be deleted                                left 6288904,
0 /sec
2_99146 - will be deleted
2_99147 - will be deleted
....20%....40%....60%....80%....100%                        left 0, 4142
/sec
        "r5" hash is selected
Flushing..done
        Read blocks (but not data blocks) 6288941
                Leaves among those 19238
                        - corrected leaves 19
                        - leaves all contents of which could not be
saved and deleted 2
                Objectids found 71848

Pass 1 (will try to insert 19236 leaves):
Looking for allocable blocks .. ok
0%....20%....40%....60%....80%....100%                        left 0,
1282 /sec
Flushing..done
        19236 leaves read
                16832 inserted
                        - pointers in indirect items pointing to
metadata 3 (zeroed)
                2404 not inserted
        non-unique pointers in indirect items (zeroed) 10208

Pass2:
0%....20%....40%....60%....80%....100%                         left 0,
686 /sec
Flushing..done
        Leaves inserted item by item 2404
Pass 3 (semantic):
Flushing..done

        Files found: 5309
        Directories found: 1629
        Symlinks found: 9
        Names pointing to nowhere (removed): 493
Pass 3a (looking for lost dir/files):
Looking for lost directories:
/7577_9001Segmentation fault (core dumped)                      
 <<rebuild.log.gz>> 

------_=_NextPart_000_01C24FFD.F4250193--
