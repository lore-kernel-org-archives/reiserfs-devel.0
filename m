From: Jonson Player <jonsonplayer@gmail.com>
Subject: Trouble with reiserfs.
Date: Fri, 30 Sep 2005 23:57:43 +0300
Message-ID: <f28212bb0509301357i58986a3em52525c99d8cfb53d@mail.gmail.com>
Reply-To: Jonson Player <jonsonplayer@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_5949_6422738.1128113863040"
Return-path: <reiserfs-list-return-26365-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: vitaly@namesys.com
Cc: reiserfs-list@namesys.com

------=_Part_5949_6422738.1128113863040
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,
i just made an img copy with dd_rescue from a broken software raid system
(mirror style). I obtained an img from one of hard drive and i wanted to
check this img with reiserfs tool, but he told me the following message:

#reiserfsck ./ISO1.img --rebuild-tree

reiserfsck 3.6.18 (2003 www.namesys.com <http://www.namesys.com>)

*************************************************************
** Do not run the program with --rebuild-tree unless **
** something is broken and MAKE A BACKUP before using it. **
** If you have bad sectors on a drive it is usually a bad **
** idea to continue using it. Then you probably should get **
** a working hard drive, copy the file system from the bad **
** drive to the good one -- dd_rescue is a good tool for **
** that -- and only then run this program. **
** If you are using the latest reiserfsprogs and it fails **
** please email bug reports to reiserfs-list@namesys.com, **
** providing as much information as possible -- your **
** hardware, kernel, patches, settings, all reiserfsck **
** messages (including version), the reiserfsck logfile, **
** check the syslog file for any related information. **
** If you would like advice on using this program, support **
** is available for $25 at
www.namesys.com/support.html<http://www.namesys.com/support.html>.
**
*************************************************************

Will rebuild the filesystem (./ISO1.img) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
Replaying journal..
Reiserfs journal './ISO1.img' in blocks [18..8211]: 0 transactions replayed
###########
reiserfsck --rebuild-tree started at Fri Sep 30 23:35:09 2005
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 4662095 blocks marked used
Skipping 8353 blocks (super block, journal, bitmaps) 4653742 blocks will be
read
0%....20%....40%....60%...block 3387084: The free space (259) is incorrect,
should be (4072) - corrected
.80%....100% left 0, 10747 /sec
320888 directory entries were hashed with "r5" hash.
"r5" hash is selected
Flushing..finished
Read blocks (but not data blocks) 4653742
Leaves among those 1870645
- leaves all contents of which could not be saved and deleted 1
Objectids found 317925

Pass 1 (will try to insert 1870644 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finishedLooking for allocable blocks ..
finished
0%....20%....40%....60%....80%....100% left 0, 5755 /sec
Flushing..finished
1870644 leaves read
82000 inserted
1788644 not inserted
####### Pass 2 #######

Pass 2:
0%Not enough allocable blocks, checking bitmap...there are 0 allocable
blocks, btw

out of disk space
Aborted




Another set of observations:




# debugreiserfs -d ./ISO1.img
debugreiserfs 3.6.18 (2003 www.namesys.com <http://www.namesys.com>)


Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x0 of format 3.6 with standard journal
Count of blocks on the device: 4662096
Number of bitmaps: 143
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 4662096
Root block: 0
Filesystem is NOT clean
Tree height: 65535
Hash function used to sort names: "r5"
Objectid map size 252, max 972
Journal parameters:
Device [0x0]
Magic [0x7209dda7]
Size 8193 blocks (including 1 for journal header) (first block 18)
Max transaction length 1024 blocks
Max batch size 900 blocks
Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0xfa02:
FATAL corruptions exist.
sb_version: 2
inode generation number: 222595
UUID: 676801db-67b0-4032-a264-4aeaa7036e8d
LABEL:
Set flags in SB:
ATTRIBUTES CLEAN
65534 expected, 18667 found in 0
Block 0 contains unformatted data
print_disk_tree: bad block type (level=3D18667, nr_items=3D144, free_space=
=3D0
rdkey)
The internal reiserfs tree has:
0 internal + 0 leaves + 0 unformatted nodes =3D 0 blocks


Any ideea to help me?
Thank you very much.

Jonson.

------=_Part_5949_6422738.1128113863040
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,<br>
i just made an img copy with dd_rescue from a broken software raid
system (mirror style). I obtained an img from one of hard drive and i
wanted to check this img with reiserfs tool, but he told me the
following message:<br>
<br>
#reiserfsck ./ISO1.img --rebuild-tree<br>
<br>
reiserfsck 3.6.18 (2003 <a href=3D"http://www.namesys.com">www.namesys.com<=
/a>)<br>
<br>
*************************************************************<br>
** Do not&nbsp; run&nbsp; the&nbsp; program&nbsp; with&nbsp; --rebuild-tree=
&nbsp; unless **<br>
** something is broken and MAKE A BACKUP&nbsp; before using it. **<br>
** If you have bad sectors on a drive&nbsp; it is usually a bad **<br>
** idea to continue using it. Then you probably should get **<br>
** a working hard drive, copy the file system from the bad **<br>
** drive&nbsp; to the good one -- dd_rescue is&nbsp; a good tool for **<br>
** that -- and only then run this
program.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
**<br>
** If you are using the latest reiserfsprogs and&nbsp; it fails **<br>
** please&nbsp; email bug reports to <a href=3D"mailto:reiserfs-list@namesy=
s.com">reiserfs-list@namesys.com</a>, **<br>
** providing&nbsp; as&nbsp; much&nbsp; information&nbsp; as&nbsp; possible =
--&nbsp; your **<br>
** hardware,&nbsp; kernel,&nbsp; patches,&nbsp; settings,&nbsp; all reiserf=
sck **<br>
** messages&nbsp; (including version),&nbsp; the reiserfsck logfile, **<br>
** check&nbsp; the&nbsp; syslog file&nbsp; for&nbsp; any&nbsp; related info=
rmation. **<br>
** If you would like advice on using this program, support **<br>
** is available&nbsp; for $25 at&nbsp; <a href=3D"http://www.namesys.com/su=
pport.html">www.namesys.com/support.html</a>. **<br>
*************************************************************<br>
<br>
Will rebuild the filesystem (./ISO1.img) tree<br>
Will put log info to 'stdout'<br>
<br>
Do you want to run this program?[N/Yes] (note need to type Yes if you do):Y=
es<br>
Replaying journal..<br>
Reiserfs journal './ISO1.img' in blocks [18..8211]: 0 transactions replayed=
<br>
###########<br>
reiserfsck --rebuild-tree started at Fri Sep 30 23:35:09 2005<br>
###########<br>
<br>
Pass 0:<br>
####### Pass 0 #######<br>
Loading on-disk bitmap .. ok, 4662095 blocks marked used<br>
Skipping 8353 blocks (super block, journal, bitmaps) 4653742 blocks will be=
 read<br>
0%....20%....40%....60%...block 3387084: The free space (259) is incorrect,=
 should be (4072) - corrected<br>
.80%....100%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
left 0, 10747 /sec<br>
320888 directory entries were hashed with &quot;r5&quot; hash.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;r5&quot; hash is selected<=
br>
Flushing..finished<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Read blocks (but not data blocks=
) 4653742<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; Leaves among those 1870645<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
- leaves all contents of which could not be saved and deleted 1<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; Objectids found 317925<br>
<br>
Pass 1 (will try to insert 1870644 leaves):<br>
####### Pass 1 #######<br>
Looking for allocable blocks .. finishedLooking for allocable blocks .. fin=
ished<br>
0%....20%....40%....60%....80%....100%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;
left 0, 5755 /sec<br>
Flushing..finished<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1870644 leaves read<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 82000 inserted<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 1788644 not inserted<br>
####### Pass 2 #######<br>
<br>
Pass 2:<br>
0%Not enough allocable blocks, checking bitmap...there are 0 allocable bloc=
ks, btw<br>
<br>
out of disk space<br>
Aborted<br>
<br>
<br>
<br>
<br>
Another set of observations:<br>
<br>
<br>
<br>
<br>
# debugreiserfs -d ./ISO1.img<br>
debugreiserfs 3.6.18 (2003 <a href=3D"http://www.namesys.com">www.namesys.c=
om</a>)<br>
<br>
<br>
Filesystem state: consistency is not checked after last mounting<br>
<br>
Reiserfs super block in block 16 on 0x0 of format 3.6 with standard journal=
<br>
Count of blocks on the device: 4662096<br>
Number of bitmaps: 143<br>
Blocksize: 4096<br>
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] bloc=
ks): 4662096<br>
Root block: 0<br>
Filesystem is NOT clean<br>
Tree height: 65535<br>
Hash function used to sort names: &quot;r5&quot;<br>
Objectid map size 252, max 972<br>
Journal parameters:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Device [0x0]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Magic [0x7209dda7]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Size 8193 blocks (including 1 fo=
r journal header) (first block 18)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Max transaction length 1024 bloc=
ks<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Max batch size 900 blocks<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Max commit age 30<br>
Blocks reserved by journal: 0<br>
Fs state field: 0xfa02:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FATAL corruptions exist.<br>
sb_version: 2<br>
inode generation number: 222595<br>
UUID: 676801db-67b0-4032-a264-4aeaa7036e8d<br>
LABEL:<br>
Set flags in SB:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ATTRIBUTES CLEAN<br>
65534 expected, 18667 found in 0<br>
Block 0 contains unformatted data<br>
print_disk_tree: bad block type (level=3D18667, nr_items=3D144, free_space=
=3D0 rdkey)<br>
The internal reiserfs tree has:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 internal + 0 leaves + 0 unform=
atted nodes =3D 0 blocks<br>
<br>
<br>
Any ideea to help me?<br>
Thank you very much.<br>
<br>
Jonson.<br>

------=_Part_5949_6422738.1128113863040--
