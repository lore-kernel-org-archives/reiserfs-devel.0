From: hanasaki <hanasaki@hanaden.com>
Subject: Re: --rebuild-tree always finds errors --check is ok
Date: Tue, 04 Jan 2005 11:25:41 -0600
Message-ID: <41DAD195.1080306@hanaden.com>
References: <41D71C4E.6000209@hanaden.com> <1104849038.32178.54.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070809080704020001080601"
Return-path: <reiserfs-list-return-23037-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1104849038.32178.54.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--------------070809080704020001080601
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Version of reiserfsk
======================
== From debian sarge
/sbin/reiserfsck -V
reiserfsck 3.6.19 (2003 www.namesys.com)
== also used the version in knoppix 3.7 with similar results

the output of two consecutive runs of --rebuild-tree on the same 
unmounted partition are attached.  Below is the diff

diff data00-run1 data00-run0
14c14
< 172168 directory entries were hashed with "r5" hash.
---
 > 172167 directory entries were hashed with "r5" hash.


Vladimir Saveliev wrote:
> Hello
> 
> On Sun, 2005-01-02 at 00:55, hanasaki wrote:
> 
>>Running reiser3 on kernel 2.6.10 and 2.6.9 with Debian sarge and unstable.
>>
>>the --rebuild-tree always finds errors and corrects them.  even when run
>>more than once consecutively without mounting the partition in between.
>>
> 
> Please provide reiserfsck --rebuild-tree output.
> What is version of your reiserfsck? (reiserfsck -V)
> 
> 
>>--check says all is good.
>>
>>
>>
>>
> 
> 


--------------070809080704020001080601
Content-Type: text/plain;
 name="data00-run0"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="data00-run0"

####### Pass 0 #######
block 254411: The number of items (21) is incorrect, should be (1) - corrected
block 254411: The free space (1) is incorrect, should be (2256) - corrected
pass0: vpf-10110: block 254411, item (0): Unknown item type found [0 251658496 0x1001800 ??? (15)] - deleted
block 1574493: The number of items (18) is incorrect, should be (0) - corrected
block 1574493: The free space (1184) is incorrect, should be (4072) - corrected
block 2206239: The number of items (1) is incorrect, should be (0) - corrected
block 2206239: The free space (0) is incorrect, should be (4072) - corrected
block 2844875: The number of items (2) is incorrect, should be (1) - corrected
block 2844875: The free space (0) is incorrect, should be (4048) - corrected
pass0: vpf-10110: block 2844875, item (0): Unknown item type found [16777472 16780544 0x200 ??? (15)] - deleted
block 3326501: The number of items (1) is incorrect, should be (0) - corrected
block 3326501: The free space (0) is incorrect, should be (4072) - corrected
172167 directory entries were hashed with "r5" hash.
####### Pass 1 #######
####### Pass 2 #######
####### Pass 3 #########
####### Pass 3a (lost+found pass) #########

--------------070809080704020001080601
Content-Type: text/plain;
 name="data00-run1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="data00-run1"

####### Pass 0 #######
block 254411: The number of items (21) is incorrect, should be (1) - corrected
block 254411: The free space (1) is incorrect, should be (2256) - corrected
pass0: vpf-10110: block 254411, item (0): Unknown item type found [0 251658496 0x1001800 ??? (15)] - deleted
block 1574493: The number of items (18) is incorrect, should be (0) - corrected
block 1574493: The free space (1184) is incorrect, should be (4072) - corrected
block 2206239: The number of items (1) is incorrect, should be (0) - corrected
block 2206239: The free space (0) is incorrect, should be (4072) - corrected
block 2844875: The number of items (2) is incorrect, should be (1) - corrected
block 2844875: The free space (0) is incorrect, should be (4048) - corrected
pass0: vpf-10110: block 2844875, item (0): Unknown item type found [16777472 16780544 0x200 ??? (15)] - deleted
block 3326501: The number of items (1) is incorrect, should be (0) - corrected
block 3326501: The free space (0) is incorrect, should be (4072) - corrected
172168 directory entries were hashed with "r5" hash.
####### Pass 1 #######
####### Pass 2 #######
####### Pass 3 #########
####### Pass 3a (lost+found pass) #########

--------------070809080704020001080601--
