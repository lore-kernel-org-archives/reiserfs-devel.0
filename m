From: "David R. Bergstein" <dbergstein@comcast.net>
Subject: reiserfsck question - session results
Date: Sun, 28 Jul 2002 23:13:13 -0400
Message-ID: <0GZZ00C5ZQAFLJ@mtaout05.icomcast.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_jUpCFKa8x4zKnWQLFQgBDg)"
Return-path: <reiserfs-list-return-11088-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list <reiserfs-list@namesys.com>
Cc: dbergstein@comcast.net

--Boundary_(ID_jUpCFKa8x4zKnWQLFQgBDg)
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

I recently encountered some issues on my boot partition on a system running 
the linux 2.4.19-rc3 kernel.  There were some corruptions that were reported 
by reiserfsck version 3.6.2 that could be repaired using the fix-fixable 
option.  To ensure that this could be done with the partition completely 
unmounted I built a rescure CD with the appropriate kernel, modules, and 
statically linked copies of the reiserfsprogs 3.6.2 utilities.

I had to back the partition up to an image file, so I was able to replay what 
happened next.  Apparently, when I boot up the system in normal mode. I get a 
message indicating the boot partition was NOT cleanly unmounted, which is in 
conflict with checking the partition offline (says it was cleanly unmounted), 
i.e.: here is a copy of the on-line message I see in /var/log/boot.log:

Jul 28 22:49:56 rebel fsck: Reiserfs super block in block 16 on 0x815 of 
format 3.6 with standard journal
Jul 28 22:49:56 rebel fsck: Blocks (total/free): 126496/75295 by 4096 bytes
Jul 28 22:49:56 rebel fsck: Filesystem is NOT cleanly umounted

Below is a replay of what I did offline using a test copy of the partition 
dump (also attached are copies of the check.log and rebuild.log files in case 
they are any help):

[root@rebel tmp]# cp -v sdb5.img sdb5-test.img
`sdb5.img' -> `sdb5-test.img'
[root@rebel tmp]# v
total 1011969
drwxr-xr-x    2 root     root          104 Jul 28 22:53 ./
drwxr-xr-x   17 root     root          432 Jul 28 17:10 ../
- -rw-r--r--    1 root     root     518127616 Jul 28 17:11 sdb5.img
- -rw-r--r--    1 root     root     518127616 Jul 28 22:53 sdb5-test.img
[root@rebel tmp]# reiserfsck sdb5-test.img --logfile check.log

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.2

Will read-only check consistency of the filesystem on sdb5-test.img
Will put log info to 'check.log'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Sun Jul 28 22:54:21 2002
###########
Replaying journal..
No transactions found
Checking S+tree..ok
Comparing bitmaps..ok
Checking Semantic tree...
ok
There were found 2 corruptions which can be fixed with --fix-fixable
###########
reiserfsck finished at Sun Jul 28 22:54:26 2002
###########
[root@rebel tmp]# ls
check.log  sdb5.img  sdb5-test.img
[root@rebel tmp]# cat check.log
bad_stat_data: block 8278, [68 86 0x0 SD (0)], SD has bad nlink number
bad_stat_data: block 8305, [68 95 0x0 SD (0)], SD has bad nlink number
[root@rebel tmp]# reiserfsck sdb5-test.img --fix-fixable --logfile fix.log

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.2

Will check consistency of the filesystem on sdb5-test.img
Will fix what can be fixed w/o --rebuild-tree
Will put log info to 'fix.log'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --fix-fixable started at Sun Jul 28 22:55:06 2002
###########
Replaying journal..
No transactions found
Checking S+tree..ok
Comparing bitmaps..ok
Checking Semantic tree...
ok
No corruptions found
There are on the filesystem:
        Leaves 1062
        Internal nodes 8
        Directories 1101
        Other files 21788
        Data block pointers 42347 (5 of them are zero)
        Safe links 0
###########
reiserfsck finished at Sun Jul 28 22:55:09 2002
###########
[root@rebel tmp]# ls
check.log  fix.log  sdb5.img  sdb5-test.img
[root@rebel tmp]# v
total 1011973
drwxr-xr-x    2 root     root          160 Jul 28 22:55 ./
drwxr-xr-x   17 root     root          432 Jul 28 17:10 ../
- -rw-r--r--    1 root     root          142 Jul 28 22:54 check.log
- -rw-r--r--    1 root     root            0 Jul 28 22:55 fix.log
- -rw-r--r--    1 root     root     518127616 Jul 28 17:11 sdb5.img
- -rw-r--r--    1 root     root     518127616 Jul 28 22:55 sdb5-test.img
[root@rebel tmp]# view check.log
[root@rebel tmp]# reiserfsck sdb5-test.img --rebuild-tree --logfile 
rebuild.log
<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.2

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

Will rebuild the filesystem (sdb5-test.img) tree
Will put log info to 'rebuild.log'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
Replaying journal..
No transactions found
###########
reiserfsck --rebuild-tree started at Sun Jul 28 22:56:02 2002
###########

Pass 0:
Loading on-disk bitmap .. ok, 51626 blocks marked used
Skipping 8214 blocks (super block, journal, bitmaps) 43412 blocks will be read
0%....20%....40%....60%....80%....100%                        left 0, 6201 
/sec         "r5" hash is selected
Flushing..done
        Read blocks (but not data blocks) 43412
                Leaves among those 1062
                Objectids found 22885

Pass 1 (will try to insert 1062 leaves):
Looking for allocable blocks .. ok
0%....20%....40%....60%....80%....100%                        left 0, 1062 
/sec Flushing..done
        1062 leaves read
                1059 inserted
                3 not inserted

Pass2:
0%....20%....40%....60%....80%....100%                           left 0, 0 
/sec Flushing..done
        Leaves inserted item by item 3
Pass 3 (semantic):
Flushing..done
        Files found: 6342
        Directories found: 1102
        Symlinks found: 659
        Others: 14780
Pass 3a (looking for lost dir/files):
Looking for lost directories:
Looking for lost files:0 /sec
Flushing..done done 0, 0 /sec
        Objects without names 2
        Empty lost dirs removed 2
        Files linked to /lost+found 2
Pass 4 - done           done 0, 0 /sec
Flushing..done
Syncing..done
###########
reiserfsck finished at Sun Jul 28 22:56:12 2002
###########
[root@rebel tmp]# ls
check.log  fix.log  rebuild.log  sdb5.img  sdb5-test.img
[root@rebel tmp]# v
total 1011977
drwxr-xr-x    2 root     root          192 Jul 28 22:56 ./
drwxr-xr-x   17 root     root          432 Jul 28 17:10 ../
- -rw-r--r--    1 root     root          142 Jul 28 22:54 check.log
- -rw-r--r--    1 root     root            0 Jul 28 22:55 fix.log
- -rw-r--r--    1 root     root          458 Jul 28 22:56 rebuild.log
- -rw-r--r--    1 root     root     518127616 Jul 28 17:11 sdb5.img
- -rw-r--r--    1 root     root     518127616 Jul 28 22:56 sdb5-test.img
[root@rebel tmp]# view rebuild.log
[root@rebel tmp]# reiserfsck sdb5-test.img --logfile check2.log

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.2

Will read-only check consistency of the filesystem on sdb5-test.img
Will put log info to 'check2.log'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Sun Jul 28 22:57:19 2002
###########
Replaying journal..
No transactions found
Checking S+tree..ok
Comparing bitmaps..ok
Checking Semantic tree...
ok
No corruptions found
There are on the filesystem:
        Leaves 1061
        Internal nodes 9
        Directories 1102
        Other files 21790
        Data block pointers 42347 (5 of them are zero)
        Safe links 0
###########
reiserfsck finished at Sun Jul 28 22:57:22 2002
###########
[root@rebel tmp]# ls
check2.log  check.log  fix.log  rebuild.log  sdb5.img  sdb5-test.img
[root@rebel tmp]# v
total 1011977
drwxr-xr-x    2 root     root          224 Jul 28 22:57 ./
drwxr-xr-x   17 root     root          432 Jul 28 17:10 ../
- -rw-r--r--    1 root     root            0 Jul 28 22:57 check2.log
- -rw-r--r--    1 root     root          142 Jul 28 22:54 check.log
- -rw-r--r--    1 root     root            0 Jul 28 22:55 fix.log
- -rw-r--r--    1 root     root          458 Jul 28 22:56 rebuild.log
- -rw-r--r--    1 root     root     518127616 Jul 28 17:11 sdb5.img
- -rw-r--r--    1 root     root     518127616 Jul 28 22:57 sdb5-test.img
 
- -- 

David R. Bergstein
Systems Engineer and Blues Musician - 
http://mywebpages.comcast.net/dbergstein/
Heart of Blue - bookings on-line at http://www.heartofblue.com
OpenPGP Public Key 0xE1F138CA - For info see http://www.gnupg.org
Key fingerprint = C86E CA2A 4171 AC73 91D7  3DCE 8832 D764 E1F1 38CA
________________________________________________________________________

I am an optimist.  It does not seem too much use being anything else.
		-- Winston Churchill
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9RLLQiDLXZOHxOMoRAsBXAJ43cCmYnpm0Q8JT6cJEigtppdr38QCgoV4g
XUjJKoXWfp5jFToKixYJNQo=
=ecds
-----END PGP SIGNATURE-----

--Boundary_(ID_jUpCFKa8x4zKnWQLFQgBDg)
Content-type: text/plain; charset=iso-8859-1; name=rebuild.log
Content-transfer-encoding: 7BIT
Content-disposition: attachment; filename=rebuild.log

####### Pass 0 #######
"r5" got 22888 hits
####### Pass 1 #######
####### Pass 2 #######
####### Pass 3 #########
are_file_items_correct: convert the indirect item back to direct 486 17077
are_file_items_correct: convert the indirect item back to direct 486 17078
are_file_items_correct: convert the indirect item back to direct 486 17076
are_file_items_correct: convert the indirect item back to direct 619 17027
####### Pass 3a (lost+found pass) #########

--Boundary_(ID_jUpCFKa8x4zKnWQLFQgBDg)
Content-type: text/plain; charset=iso-8859-1; name=check.log
Content-transfer-encoding: 7BIT
Content-disposition: attachment; filename=check.log

bad_stat_data: block 8278, [68 86 0x0 SD (0)], SD has bad nlink number
bad_stat_data: block 8305, [68 95 0x0 SD (0)], SD has bad nlink number

--Boundary_(ID_jUpCFKa8x4zKnWQLFQgBDg)--
