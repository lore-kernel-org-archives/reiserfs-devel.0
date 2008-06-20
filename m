From: Steven Noonan <steven.noonan@uplinklabs.net>
Subject: Minor but irritating Reiser4 problem
Date: Thu, 19 Jun 2008 23:02:08 -0700
Message-ID: <000001c8d29b$2dfdc9f0$89f95dd0$@net>
References: <1CCA8592-A78B-4DC8-AF53-ACD69CAE14C4@jasonandannette.us> <485AD5FA.7090809@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0001_01C8D260.819EF1F0"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <485AD5FA.7090809@gmail.com>
Content-Language: en-us
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

This is a multipart message in MIME format.

------=_NextPart_000_0001_01C8D260.819EF1F0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I've been using Reiser4 on a 2.6.25 kernel and I've noticed that file sizes
and disk space usage are incorrectly reported (impossibly large). The
problem -seemed- to be temporarily resolved by running fsck.reiser4 on the
filesystem or after switching to 2.6.26-rc5-mm3 (not sure which), and fsck
reported lots of these:

FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item (21), 
[2a:c66170725f646264:10332] (stat40): wrong bytes (65536), Fixed to (10181).

In every case, it says "wrong bytes (65536)" and corrects the number. Any
idea which "bytes" it's referring to? It seems too small to be a file size
(since 16-bit file size descriptors would be ridiculously small). I would
expect -at least- a 64-bit number to represent a file size.

I'd try debugging it myself, but I'm afraid of touching (and unfamiliar
with) Reiser4's internals.

- Steven


------=_NextPart_000_0001_01C8D260.819EF1F0
Content-Type: text/plain;
	name="fsck.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="fsck.txt"

*******************************************************************=0A=
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.=0A=
*******************************************************************=0A=
=0A=
Fscking the /dev/sda8 block device. =0A=
Will fix minor corruptions of the Reiser4 SuperBlock. =0A=
Will fix minor corruptions of the Reiser4 FileSystem. =0A=
***** fsck.reiser4 started at Thu Jun 19 22:43:34 2008=0A=
Reiser4 fs was detected on /dev/sda8. =0A=
Master super block (16): =0A=
magic:		ReIsEr4 =0A=
blksize:	4096 =0A=
format:		0x0 (format40) =0A=
uuid:		2a8956ea-2ad1-4a65-8f51-277e3859c5a9 =0A=
label:		<none> =0A=
 =0A=
Format super block (17): =0A=
plugin:		format40 =0A=
description:	Disk-format plugin. =0A=
version:	0 =0A=
magic:		ReIsEr40FoRmAt =0A=
mkfs id:	0x24a1ff7f =0A=
flushes:	0 =0A=
blocks:		1048240 =0A=
free blocks:	619370 =0A=
root block:	428061 =0A=
tail policy:	0x2 (smart) =0A=
next oid:	0x1034e =0A=
file count:	825 =0A=
tree height:	4 =0A=
key policy:	LARGE =0A=
 =0A=
 =0A=
CHECKING THE STORAGE TREE =0A=
	Read nodes 19660 =0A=
	Nodes left in the tree 19660 =0A=
		Leaves of them 19421, Twigs of them 233 =0A=
	Time interval: Thu Jun 19 22:43:35 2008 - Thu Jun 19 22:43:39 2008 =0A=
CHECKING EXTENT REGIONS. =0A=
	Read twigs 233 =0A=
	Time interval: Thu Jun 19 22:43:39 2008 - Thu Jun 19 22:43:39 2008 =0A=
CHECKING THE SEMANTIC TREE =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428120), item =
(1), =0A=
[2a:41726368697665:10001] (stat40): wrong bytes (65536), Fixed to =
(42406). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428120), item =
(2), =0A=
[2a:41757468656e2d:10002] (stat40): wrong bytes (65536), Fixed to =
(42783). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428120), item =
(9), =0A=
[2a:4572726f722d30:10009] (stat40): wrong bytes (65536), Fixed to =
(16825). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428120), item =
(12), =0A=
[2a:48544d4c2d5461:1000c] (stat40): wrong bytes (65536), Fixed to =
(8102). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428120), item =
(14), =0A=
[2a:494f2d53747269:1000e] (stat40): wrong bytes (65536), Fixed to =
(7480). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428120), item =
(15), =0A=
[2a:494f2d5a6c6962:1000f] (stat40): wrong bytes (65536), Fixed to =
(9820). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428120), item =
(20), =0A=
[2a:4e65742d446165:10014] (stat40): wrong bytes (65536), Fixed to =
(28553). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428120), item =
(24), =0A=
[2a:506c5250432d30:10018] (stat40): wrong bytes (65536), Fixed to =
(18229). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428120), item =
(32), =0A=
[2a:5379732d537973:10020] (stat40): wrong bytes (65536), Fixed to =
(52066). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428120), item =
(33), =0A=
[2a:5465726d526561:10021] (stat40): wrong bytes (65536), Fixed to =
(37006). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428120), item =
(38), =0A=
[2a:584d4c2d534158:10026] (stat40): wrong bytes (65536), Fixed to =
(59411). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (1), =0A=
[2a:61637069642d31:1002b] (stat40): wrong bytes (65536), Fixed to =
(24226). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (4), =0A=
[2a:616e64616c6533:1002e] (stat40): wrong bytes (262144), Fixed to =
(155871). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (10), =0A=
[2a:617269616c3332:10034] (stat40): wrong bytes (589824), Fixed to =
(513499). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (11), =0A=
[2a:617269616c6233:10035] (stat40): wrong bytes (196608), Fixed to =
(125441). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (29), =0A=
[2a:6261736833322d:10047] (stat40): wrong bytes (65536), Fixed to (724). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (30), =0A=
[2a:6261736833322d:10048] (stat40): wrong bytes (65536), Fixed to (710). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (31), =0A=
[2a:6261736833322d:10049] (stat40): wrong bytes (65536), Fixed to =
(1965). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (32), =0A=
[2a:6261736833322d:1004a] (stat40): wrong bytes (65536), Fixed to =
(1109). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (33), =0A=
[2a:6261736833322d:1004b] (stat40): wrong bytes (65536), Fixed to =
(2296). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (34), =0A=
[2a:6261736833322d:1004c] (stat40): wrong bytes (65536), Fixed to (680). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (35), =0A=
[2a:6261736833322d:1004d] (stat40): wrong bytes (65536), Fixed to (689). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (36), =0A=
[2a:6261736833322d:1004e] (stat40): wrong bytes (65536), Fixed to (650). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (37), =0A=
[2a:6261736833322d:1004f] (stat40): wrong bytes (65536), Fixed to (726). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (38), =0A=
[2a:6261736833322d:10050] (stat40): wrong bytes (65536), Fixed to =
(2198). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (39), =0A=
[2a:6261736833322d:10051] (stat40): wrong bytes (65536), Fixed to =
(1593). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (40), =0A=
[2a:6261736833322d:10052] (stat40): wrong bytes (65536), Fixed to =
(1105). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (27), item (41), =0A=
[2a:6261736833322d:10053] (stat40): wrong bytes (65536), Fixed to (853). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item (0), =0A=
[2a:6261736833322d:10054] (stat40): wrong bytes (65536), Fixed to =
(3116). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item (1), =0A=
[2a:6261736833322d:10055] (stat40): wrong bytes (65536), Fixed to =
(1084). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item (2), =0A=
[2a:6261736833322d:10056] (stat40): wrong bytes (65536), Fixed to (818). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item (3), =0A=
[2a:6261736833322d:10057] (stat40): wrong bytes (65536), Fixed to =
(1032). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item (4), =0A=
[2a:6261736833322d:10058] (stat40): wrong bytes (65536), Fixed to (973). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item (5), =0A=
[2a:6261736833322d:10059] (stat40): wrong bytes (65536), Fixed to =
(2755). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item (6), =0A=
[2a:6261736833322d:1005a] (stat40): wrong bytes (65536), Fixed to =
(1966). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item (7), =0A=
[2a:6261736833322d:1005b] (stat40): wrong bytes (65536), Fixed to (826). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item (8), =0A=
[2a:6261736833322d:1005c] (stat40): wrong bytes (65536), Fixed to =
(1261). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item (9), =0A=
[2a:6261736833322d:1005d] (stat40): wrong bytes (65536), Fixed to (643). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item =
(10), =0A=
[2a:6261736833322d:1005e] (stat40): wrong bytes (65536), Fixed to =
(1372). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item =
(11), =0A=
[2a:6261736833322d:1005f] (stat40): wrong bytes (65536), Fixed to (919). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item =
(12), =0A=
[2a:6261736833322d:10060] (stat40): wrong bytes (65536), Fixed to (950). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item =
(13), =0A=
[2a:6261736833322d:10061] (stat40): wrong bytes (65536), Fixed to =
(1112). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item =
(14), =0A=
[2a:6261736833322d:10062] (stat40): wrong bytes (65536), Fixed to (690). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item =
(15), =0A=
[2a:6261736833322d:10063] (stat40): wrong bytes (65536), Fixed to (710). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item =
(16), =0A=
[2a:6261736833322d:10064] (stat40): wrong bytes (65536), Fixed to (750). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item =
(17), =0A=
[2a:6261736833322d:10065] (stat40): wrong bytes (65536), Fixed to (939). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item =
(18), =0A=
[2a:6261736833322d:10066] (stat40): wrong bytes (65536), Fixed to (627). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item =
(19), =0A=
[2a:6261736833322d:10067] (stat40): wrong bytes (65536), Fixed to =
(1042). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item =
(29), =0A=
[2a:6272696467652d:10071] (stat40): wrong bytes (65536), Fixed to =
(32261). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item =
(38), =0A=
[2a:636f646532636f:1007a] (stat40): wrong bytes (262144), Fixed to =
(31649). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (9705), item =
(39), =0A=
[2a:636f6d69633332:1007b] (stat40): wrong bytes (262144), Fixed to =
(209842). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (34008), item =
(0), =0A=
[2a:636f7572696533:1007d] (stat40): wrong bytes (655360), Fixed to =
(610120). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (34008), item =
(6), =0A=
[2a:63767370732d32:10083] (stat40): wrong bytes (65536), Fixed to =
(61634). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (34008), item =
(13), =0A=
[2a:6468636462642d:1008a] (stat40): wrong bytes (65536), Fixed to =
(56867). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (34008), item =
(15), =0A=
[2a:6468637063642d:1008c] (stat40): wrong bytes (65536), Fixed to =
(45030). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (34008), item =
(19), =0A=
[2a:646d696465636f:10090] (stat40): wrong bytes (65536), Fixed to =
(48158). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (34008), item =
(31), =0A=
[2a:656c696e6b732d:1009c] (stat40): wrong bytes (65536), Fixed to =
(5370). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (34009), item =
(1), =0A=
[2a:65766965657874:100a8] (stat40): wrong bytes (65536), Fixed to =
(37534). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (34009), item =
(6), =0A=
[2a:66616164322d70:100ad] (stat40): wrong bytes (65536), Fixed to =
(8667). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (34009), item =
(9), =0A=
[2a:66697865737072:100b0] (stat40): wrong bytes (65536), Fixed to =
(38550). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (34009), item =
(31), =0A=
[2a:67656e6c6f702d:100c6] (stat40): wrong bytes (65536), Fixed to =
(21315). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (34009), item =
(33), =0A=
[2a:67656f72676933:100c8] (stat40): wrong bytes (393216), Fixed to =
(356240). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (34009), item =
(35), =0A=
[2a:67657474657874:100ca] (stat40): wrong bytes (65536), Fixed to =
(7693). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (34009), item =
(41), =0A=
[2a:676c6578742e68:100d0] (stat40): wrong bytes (65536), Fixed to =
(36932). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (78238), item =
(5), =0A=
[2a:676c70726f746f:100d6] (stat40): wrong bytes (65536), Fixed to =
(57658). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (78238), item =
(6), =0A=
[2a:676c786578742e:100d7] (stat40): wrong bytes (65536), Fixed to =
(6234). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (78238), item =
(28), =0A=
[2a:68616c2d302e35:100ed] (stat40): wrong bytes (65536), Fixed to =
(4246). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (78238), item =
(34), =0A=
[2a:68746d6c326462:100f3] (stat40): wrong bytes (65536), Fixed to =
(6028). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (78238), item =
(40), =0A=
[2a:696d7061637433:100f9] (stat40): wrong bytes (196608), Fixed to =
(130834). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (111168), item =
(6), =0A=
[2a:6b6270726f746f:10101] (stat40): wrong bytes (65536), Fixed to =
(57435). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (111168), item =
(22), =0A=
[2a:6c61796d616e2d:10111] (stat40): wrong bytes (65536), Fixed to =
(46122). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (148221), item =
(6), =0A=
[2a:6c69626361702d:1012c] (stat40): wrong bytes (65536), Fixed to =
(26686). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (148221), item =
(7), =0A=
[2a:6c69626361705f:1012d] (stat40): wrong bytes (65536), Fixed to =
(12928). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (148222), item =
(10), =0A=
[2a:6c6f63616c6570:1015b] (stat40): wrong bytes (65536), Fixed to =
(4729). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (148222), item =
(11), =0A=
[2a:6c6f67726f7461:1015c] (stat40): wrong bytes (65536), Fixed to =
(33626). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (148222), item =
(22), =0A=
[2a:6d696d652d7479:10167] (stat40): wrong bytes (65536), Fixed to =
(6317). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (148222), item =
(23), =0A=
[2a:6d6b666f6e7464:10168] (stat40): wrong bytes (65536), Fixed to =
(62898). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (148222), item =
(36), =0A=
[2a:6e65746b69742d:10175] (stat40): wrong bytes (65536), Fixed to =
(58268). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (203006), item =
(24), =0A=
[2a:7070702d646863:10193] (stat40): wrong bytes (65536), Fixed to =
(33497). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (203006), item =
(33), =0A=
[2a:707974686f6e2d:1019c] (stat40): wrong bytes (65536), Fixed to =
(2422). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (203006), item =
(34), =0A=
[2a:70797864672d30:1019d] (stat40): wrong bytes (65536), Fixed to =
(36465). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (203006), item =
(35), =0A=
[2a:7163612d312e30:1019e] (stat40): wrong bytes (65536), Fixed to =
(30677). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (203006), item =
(36), =0A=
[2a:7163612d746c73:1019f] (stat40): wrong bytes (65536), Fixed to =
(23489). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (203006), item =
(40), =0A=
[2a:726561646c696e:101a3] (stat40): wrong bytes (65536), Fixed to (525). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (203006), item =
(41), =0A=
[2a:726561646c696e:101a4] (stat40): wrong bytes (65536), Fixed to (706). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222008), item =
(0), =0A=
[2a:726561646c696e:101a5] (stat40): wrong bytes (65536), Fixed to (665). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222008), item =
(1), =0A=
[2a:726561646c696e:101a6] (stat40): wrong bytes (65536), Fixed to (879). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222008), item =
(2), =0A=
[2a:726561646c696e:101a7] (stat40): wrong bytes (65536), Fixed to =
(2596). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222008), item =
(3), =0A=
[2a:726561646c696e:101a8] (stat40): wrong bytes (65536), Fixed to =
(1211). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222008), item =
(4), =0A=
[2a:726561646c696e:101a9] (stat40): wrong bytes (65536), Fixed to (761). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222008), item =
(5), =0A=
[2a:726561646c696e:101aa] (stat40): wrong bytes (65536), Fixed to (963). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222008), item =
(6), =0A=
[2a:726561646c696e:101ab] (stat40): wrong bytes (65536), Fixed to (530). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222008), item =
(7), =0A=
[2a:726561646c696e:101ac] (stat40): wrong bytes (65536), Fixed to (778). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222008), item =
(8), =0A=
[2a:726561646c696e:101ad] (stat40): wrong bytes (65536), Fixed to (471). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222008), item =
(9), =0A=
[2a:726561646c696e:101ae] (stat40): wrong bytes (65536), Fixed to =
(1265). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222008), item =
(10), =0A=
[2a:72657363616e2d:101af] (stat40): wrong bytes (65536), Fixed to =
(5298). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222008), item =
(11), =0A=
[2a:72657865632d31:101b0] (stat40): wrong bytes (65536), Fixed to =
(18469). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222008), item =
(13), =0A=
[2a:72706d32746172:101b2] (stat40): wrong bytes (65536), Fixed to =
(2639). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222008), item =
(26), =0A=
[2a:73706c6173682e:101bf] (stat40): wrong bytes (65536), Fixed to =
(33856). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222008), item =
(28), =0A=
[2a:73736d74705f32:101c1] (stat40): wrong bytes (65536), Fixed to =
(53339). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222009), item =
(1), =0A=
[2a:74696d65733332:101d0] (stat40): wrong bytes (720896), Fixed to =
(625450). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222009), item =
(5), =0A=
[2a:7472616365726f:101d4] (stat40): wrong bytes (65536), Fixed to =
(58960). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222009), item =
(6), =0A=
[2a:7472617070726f:101d5] (stat40): wrong bytes (65536), Fixed to =
(48785). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222009), item =
(7), =0A=
[2a:74726562756333:101d6] (stat40): wrong bytes (393216), Fixed to =
(321027). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222009), item =
(17), =0A=
[2a:76657264616e33:101e0] (stat40): wrong bytes (393216), Fixed to =
(315794). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222009), item =
(19), =0A=
[2a:76697869652d63:101e2] (stat40): wrong bytes (65536), Fixed to =
(54246). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222009), item =
(21), =0A=
[2a:77656264696e33:101e4] (stat40): wrong bytes (196608), Fixed to =
(142617). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222009), item =
(24), =0A=
[2a:77686f69735f34:101e7] (stat40): wrong bytes (65536), Fixed to =
(61416). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (222009), item =
(26), =0A=
[2a:786269746d6170:101e9] (stat40): wrong bytes (65536), Fixed to =
(55570). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (236236), item =
(16), =0A=
[2a:1436f6d70726573:10209] (stat40): wrong bytes (65536), Fixed to =
(62931). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (236236), item =
(18), =0A=
[2a:14578745574696c:1020b] (stat40): wrong bytes (65536), Fixed to =
(19260). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (236236), item =
(19), =0A=
[2a:14578745574696c:1020c] (stat40): wrong bytes (65536), Fixed to =
(25173). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (236236), item =
(22), =0A=
[2a:1494f2d536f636b:1020f] (stat40): wrong bytes (65536), Fixed to =
(52152). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (236236), item =
(25), =0A=
[2a:14e65742d534d54:10212] (stat40): wrong bytes (65536), Fixed to =
(1806). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (236236), item =
(31), =0A=
[2a:15363616c61722d:10218] (stat40): wrong bytes (65536), Fixed to =
(43620). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (236236), item =
(34), =0A=
[2a:1584d4c2d4c6962:1021b] (stat40): wrong bytes (65536), Fixed to =
(12930). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (236236), item =
(35), =0A=
[2a:1584d4c2d4e616d:1021c] (stat40): wrong bytes (65536), Fixed to =
(8036). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (388675), item =
(1), =0A=
[2a:162696772657173:10224] (stat40): wrong bytes (65536), Fixed to =
(36676). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (388675), item =
(2), =0A=
[2a:162696e7574696c:10225] (stat40): wrong bytes (65536), Fixed to =
(16956). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (388675), item =
(3), =0A=
[2a:16273642d66696e:10226] (stat40): wrong bytes (65536), Fixed to =
(25521). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (388675), item =
(5), =0A=
[2a:16275696c642d64:10228] (stat40): wrong bytes (65536), Fixed to =
(3094). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (388675), item =
(8), =0A=
[2a:1636f6d706f7369:1022b] (stat40): wrong bytes (65536), Fixed to =
(45390). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (388675), item =
(9), =0A=
[2a:1636f7265757469:1022c] (stat40): wrong bytes (65536), Fixed to =
(33326). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (388675), item =
(13), =0A=
[2a:164616d61676570:10230] (stat40): wrong bytes (65536), Fixed to =
(41449). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (388675), item =
(19), =0A=
[2a:164696666757469:10235] (stat40): wrong bytes (65536), Fixed to =
(4388). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (388675), item =
(23), =0A=
[2a:1656c667574696c:10239] (stat40): wrong bytes (65536), Fixed to =
(19950). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (388675), item =
(24), =0A=
[2a:16573642e657365:1023a] (stat40): wrong bytes (65536), Fixed to =
(1440). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (388675), item =
(25), =0A=
[2a:16573656c656374:1023b] (stat40): wrong bytes (65536), Fixed to =
(6597). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (388675), item =
(37), =0A=
[2a:1666f6e742d616c:10246] (stat40): wrong bytes (65536), Fixed to =
(42537). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (388675), item =
(39), =0A=
[2a:1666f6e742d6375:10248] (stat40): wrong bytes (65536), Fixed to =
(42656). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (388675), item =
(41), =0A=
[2a:1666f6e74636163:1024a] (stat40): wrong bytes (65536), Fixed to =
(38233). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (322879), item =
(0), =0A=
[2a:1666f6e74737072:1024b] (stat40): wrong bytes (65536), Fixed to =
(45202). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346867), item =
(0), =0A=
[2a:16763632d342e31:1024d] (stat40): wrong bytes (65536), Fixed to =
(50224). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346867), item =
(1), =0A=
[2a:16763632d342e31:1024e] (stat40): wrong bytes (65536), Fixed to =
(20980). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346867), item =
(4), =0A=
[2a:167646d2d322e38:10251] (stat40): wrong bytes (65536), Fixed to =
(3101). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346867), item =
(7), =0A=
[2a:167656e70617463:10254] (stat40): wrong bytes (65536), Fixed to =
(41696). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346867), item =
(8), =0A=
[2a:167656e746f6f2d:10255] (stat40): wrong bytes (65536), Fixed to =
(60183). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346867), item =
(9), =0A=
[2a:167656e746f6f2d:10256] (stat40): wrong bytes (65536), Fixed to =
(8168). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346867), item =
(11), =0A=
[2a:167656e746f6f6c:10258] (stat40): wrong bytes (65536), Fixed to =
(42664). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346867), item =
(14), =0A=
[2a:167686f73747363:1025b] (stat40): wrong bytes (65536), Fixed to =
(3916). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346867), item =
(16), =0A=
[2a:1676c69622d312e:1025d] (stat40): wrong bytes (65536), Fixed to =
(9099). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346867), item =
(23), =0A=
[2a:1676e6f6d652d63:10264] (stat40): wrong bytes (65536), Fixed to =
(64309). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346868), item =
(4), =0A=
[2a:1676e6f6d652d73:1027b] (stat40): wrong bytes (65536), Fixed to =
(1105). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346868), item =
(12), =0A=
[2a:1676e75636f6e66:10283] (stat40): wrong bytes (65536), Fixed to =
(40491). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346868), item =
(13), =0A=
[2a:167706d2d312e32:10284] (stat40): wrong bytes (65536), Fixed to =
(9045). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346868), item =
(14), =0A=
[2a:1677275622d302e:10285] (stat40): wrong bytes (65536), Fixed to =
(31190). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346868), item =
(23), =0A=
[2a:167746b2d736861:1028e] (stat40): wrong bytes (65536), Fixed to =
(479). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346868), item =
(29), =0A=
[2a:16869636f6c6f72:10294] (stat40): wrong bytes (65536), Fixed to =
(33330). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346868), item =
(30), =0A=
[2a:168746d6c746964:10295] (stat40): wrong bytes (65536), Fixed to =
(12636). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346868), item =
(32), =0A=
[2a:1696e7075747072:10297] (stat40): wrong bytes (65536), Fixed to =
(47636). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346868), item =
(35), =0A=
[2a:169707574696c73:1029a] (stat40): wrong bytes (65536), Fixed to =
(11796). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346868), item =
(36), =0A=
[2a:16a6176612d636f:1029b] (stat40): wrong bytes (65536), Fixed to =
(14362). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346868), item =
(37), =0A=
[2a:16a6176612d636f:1029c] (stat40): wrong bytes (65536), Fixed to =
(40527). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346868), item =
(38), =0A=
[2a:16a6176612d636f:1029d] (stat40): wrong bytes (65536), Fixed to =
(6362). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346868), item =
(39), =0A=
[2a:16a646b2d367536:1029e] (stat40): wrong bytes (70582272), Fixed to =0A=
(70113625). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346868), item =
(40), =0A=
[2a:16a7065672d3662:1029f] (stat40): wrong bytes (65536), Fixed to =
(22573). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (346868), item =
(41), =0A=
[2a:16b64652d332e35:102a0] (stat40): wrong bytes (65536), Fixed to =
(15049). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398197), item =
(2), =0A=
[2a:16b646562617365:102a3] (stat40): wrong bytes (65536), Fixed to =
(39328). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398197), item =
(4), =0A=
[2a:16b64656c696273:102a5] (stat40): wrong bytes (65536), Fixed to =
(23248). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398197), item =
(6), =0A=
[2a:16b64656e657477:102a7] (stat40): wrong bytes (65536), Fixed to =
(2986). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398197), item =
(9), =0A=
[2a:16b64657574696c:102aa] (stat40): wrong bytes (65536), Fixed to =
(3019). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398197), item =
(24), =0A=
[2a:16c696264762d31:102b9] (stat40): wrong bytes (65536), Fixed to =
(9771). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398197), item =
(26), =0A=
[2a:16c696267637279:102bb] (stat40): wrong bytes (65536), Fixed to =
(2944). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398197), item =
(40), =0A=
[2a:16c696269656565:102c9] (stat40): wrong bytes (65536), Fixed to =
(6607). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(1), =0A=
[2a:16c69626d696b6d:102cc] (stat40): wrong bytes (65536), Fixed to =
(2944). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(5), =0A=
[2a:16c69627574656d:102d0] (stat40): wrong bytes (65536), Fixed to =
(14588). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(9), =0A=
[2a:16c696e6b732d32:102d4] (stat40): wrong bytes (65536), Fixed to =
(4784). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(14), =0A=
[2a:16d6f64756c652d:102d9] (stat40): wrong bytes (65536), Fixed to =
(8819). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(17), =0A=
[2a:16d6f7a696c6c61:102dc] (stat40): wrong bytes (65536), Fixed to =
(9407). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(18), =0A=
[2a:16d6f7a696c6c61:102dd] (stat40): wrong bytes (65536), Fixed to =
(6298). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(21), =0A=
[2a:16e637572736573:102e0] (stat40): wrong bytes (65536), Fixed to =
(6196). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(23), =0A=
[2a:16e65746b69742d:102e2] (stat40): wrong bytes (65536), Fixed to =
(37396). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(24), =0A=
[2a:16e65746b69742d:102e3] (stat40): wrong bytes (65536), Fixed to =
(13612). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(27), =0A=
[2a:16e6574776f726b:102e6] (stat40): wrong bytes (65536), Fixed to =
(5006). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(29), =0A=
[2a:16f6f646963742e:102e8] (stat40): wrong bytes (65536), Fixed to =
(3804). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(30), =0A=
[2a:16f70656e676c2e:102e9] (stat40): wrong bytes (65536), Fixed to =
(3295). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(31), =0A=
[2a:16f70656e737368:102ea] (stat40): wrong bytes (131072), Fixed to =
(21566). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(32), =0A=
[2a:16f70656e737368:102eb] (stat40): wrong bytes (65536), Fixed to =
(20554). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(33), =0A=
[2a:170616d62617365:102ec] (stat40): wrong bytes (65536), Fixed to =
(2368). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(35), =0A=
[2a:17065726c2d636c:102ee] (stat40): wrong bytes (65536), Fixed to =
(5134). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(36), =0A=
[2a:17068702d706174:102ef] (stat40): wrong bytes (65536), Fixed to =
(6889). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(37), =0A=
[2a:17068702d746f6f:102f0] (stat40): wrong bytes (65536), Fixed to =
(5291). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(38), =0A=
[2a:1706f7274616765:102f1] (stat40): wrong bytes (65536), Fixed to =
(15469). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398198), item =
(40), =0A=
[2a:17070702d322e34:102f3] (stat40): wrong bytes (65536), Fixed to =
(49557). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428097), item =
(0), =0A=
[2a:17070702d322e34:1033d] (stat40): wrong bytes (65536), Fixed to =
(47912). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(0), =0A=
[2a:17072696e747072:102f4] (stat40): wrong bytes (65536), Fixed to =
(43560). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(4), =0A=
[2a:1707974686f6e2d:102f8] (stat40): wrong bytes (65536), Fixed to =
(11488). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(7), =0A=
[2a:172616e64727072:102fb] (stat40): wrong bytes (65536), Fixed to =
(54958). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(8), =0A=
[2a:17265636f726470:102fc] (stat40): wrong bytes (65536), Fixed to =
(39340). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(11), =0A=
[2a:172656e64657270:102ff] (stat40): wrong bytes (65536), Fixed to =
(40056). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(12), =0A=
[2a:17265736f757263:10300] (stat40): wrong bytes (65536), Fixed to =
(36859). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(14), =0A=
[2a:173616e652d312e:10302] (stat40): wrong bytes (65536), Fixed to =
(8192). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(16), =0A=
[2a:17363726e736176:10304] (stat40): wrong bytes (65536), Fixed to =
(38066). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(19), =0A=
[2a:1736d7065672d30:10307] (stat40): wrong bytes (65536), Fixed to =
(3893). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(24), =0A=
[2a:173797376696e69:1030c] (stat40): wrong bytes (65536), Fixed to =
(1703). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(25), =0A=
[2a:17463702d777261:1030d] (stat40): wrong bytes (65536), Fixed to =
(16128). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(26), =0A=
[2a:1746966662d332e:1030e] (stat40): wrong bytes (65536), Fixed to =
(8469). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(28), =0A=
[2a:1756d6c5f757469:10310] (stat40): wrong bytes (65536), Fixed to =
(60059). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(30), =0A=
[2a:17574696c2d6d61:10312] (stat40): wrong bytes (65536), Fixed to =
(47151). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(32), =0A=
[2a:1766964656f7072:10314] (stat40): wrong bytes (65536), Fixed to =
(42744). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(33), =0A=
[2a:176697869652d63:10315] (stat40): wrong bytes (65536), Fixed to =
(4204). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (398199), item =
(38), =0A=
[2a:178636d69736370:1031a] (stat40): wrong bytes (65536), Fixed to =
(36750). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item =
(2), =0A=
[2a:178663836626967:10320] (stat40): wrong bytes (65536), Fixed to =
(37450). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item =
(3), =0A=
[2a:178663836646761:10321] (stat40): wrong bytes (65536), Fixed to =
(43191). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item =
(4), =0A=
[2a:178663836647269:10322] (stat40): wrong bytes (65536), Fixed to =
(42828). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item =
(5), =0A=
[2a:1786638366d6973:10323] (stat40): wrong bytes (65536), Fixed to =
(38464). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item =
(6), =0A=
[2a:178663836727573:10324] (stat40): wrong bytes (65536), Fixed to =
(37695). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item =
(7), =0A=
[2a:178663836766964:10325] (stat40): wrong bytes (65536), Fixed to =
(39615). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item =
(8), =0A=
[2a:178696e6572616d:10326] (stat40): wrong bytes (65536), Fixed to =
(38413). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item =
(13), =0A=
[2a:178756c72756e6e:1032b] (stat40): wrong bytes (65536), Fixed to =
(61868). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item =
(15), =0A=
[2a:178756c72756e6e:10340] (stat40): wrong bytes (65536), Fixed to =
(5880). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item =
(14), =0A=
[2a:178756c72756e6e:1032c] (stat40): wrong bytes (65536), Fixed to =
(5230). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item =
(16), =0A=
[2a:1787669642d312e:1032d] (stat40): wrong bytes (65536), Fixed to =
(2426). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item =
(17), =0A=
[2a:6270617463682e34:1032e] (stat40): wrong bytes (65536), Fixed to =
(511). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item =
(18), =0A=
[2a:6470617463682e34:1032f] (stat40): wrong bytes (65536), Fixed to =
(683). =0A=
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (428111), item =
(21), =0A=
[2a:c66170725f646264:10332] (stat40): wrong bytes (65536), Fixed to =
(10181). =0A=
	Found 825 objects (some could be encountered more then once). =0A=
	Time interval: Thu Jun 19 22:43:39 2008 - Thu Jun 19 22:43:40 2008 =0A=
***** fsck.reiser4 finished at Thu Jun 19 22:43:40 2008=0A=
Closing fs...done=0A=
=0A=
FS is consistent.=0A=
=0A=

------=_NextPart_000_0001_01C8D260.819EF1F0--

