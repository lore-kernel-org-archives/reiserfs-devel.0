From: "mack ragan" <gtcoldfire@gmail.com>
Subject: reiserfs v3.6 problems
Date: Mon, 21 Aug 2006 20:38:56 -0400
Message-ID: <5b4b34380608211738n4ec479cbraed2df60c622ab1e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_36114_23634981.1156207136311"
Return-path: <reiserfs-list-return-29649-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_Part_36114_23634981.1156207136311
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

My root partition will not mount...strange problems have built up to this,
like not being able to read files as root...and I get the following output
frim "debugreiserfs /dev/hdb2":

debugreiserfs 3.6.19 (2003 www.namesys.com)


Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x342 of format 3.6 with standard
journal
Count of blocks on the device: 6359728
Number of bitmaps: 195
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 6359728
Root block: 0
Filesystem is clean
Tree height: 0
Hash function used to sort names: "r5"
Objectid map size 968, max 972
Journal parameters:
        Device [0x0]
        Magic [0x482c3fa]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x3:
        FATAL corruptions exist.
         some corruptions exist.
sb_version: 2
inode generation number: 49892980
UUID: 3eeff8ac-8c07-4a98-b126-7bcebd4480c1
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN

I have run "reiserfsck --rebuild-sb" and "reiserfsck --rebuild-tree" based
on some forum/message boards regarding similar symptoms/issues, but still no
good.  Is there anyway I can recover?  I'm not very experienced with
reiserfs, so any help is very appreciated.

Thanks!

------=_Part_36114_23634981.1156207136311
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,<br><br>My root partition will not mount...strange problems have built up to this, like not being able to read files as root...and I get the following output frim &quot;debugreiserfs /dev/hdb2&quot;: <br><br>debugreiserfs 
3.6.19 (2003 <a href="http://www.namesys.com">www.namesys.com</a>)<br><br><br>Filesystem state: consistency is not checked after last mounting<br><br>Reiserfs super block in block 16 on 0x342 of format 3.6 with standard journal
<br>Count of blocks on the device: 6359728<br>Number of bitmaps: 195<br>Blocksize: 4096<br>Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 6359728<br>Root block: 0<br>Filesystem is clean<br>
Tree height: 0<br>Hash function used to sort names: &quot;r5&quot;<br>Objectid map size 968, max 972<br>Journal parameters:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Device [0x0]<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Magic [0x482c3fa]<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Size 8193 blocks (including 1 for journal header) (first block 18)
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Max transaction length 1024 blocks<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Max batch size 900 blocks<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Max commit age 30<br>Blocks reserved by journal: 0<br>Fs state field: 0x3:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FATAL corruptions exist.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; some corruptions exist.
<br>sb_version: 2<br>inode generation number: 49892980<br>UUID: 3eeff8ac-8c07-4a98-b126-7bcebd4480c1<br>LABEL:<br>Set flags in SB:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ATTRIBUTES CLEAN<br><br>I have run &quot;reiserfsck --rebuild-sb&quot; and &quot;reiserfsck --rebuild-tree&quot; based on some forum/message boards regarding similar symptoms/issues, but still no good.&nbsp; Is there anyway I can recover?&nbsp; I'm not very experienced with reiserfs, so any help is very appreciated.
<br><br>Thanks!<br><br>

------=_Part_36114_23634981.1156207136311--
