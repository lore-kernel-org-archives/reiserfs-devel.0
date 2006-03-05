From: Harald Weigl <Harald@weiglwelt.de>
Subject: Problem: --rebuild-tree failed
Date: Sun, 5 Mar 2006 20:07:37 +0100
Message-ID: <200603052007.37471.Harald@weiglwelt.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_5bzCE60umCUDO60"
Return-path: <reiserfs-list-return-28215-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: 
Cc: reiserfs-list@namesys.com

--Boundary-00=_5bzCE60umCUDO60
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

I ended up in quite a mess. What has happened was:
- The file system ran full while copying CF-Card with pictures I took and
  started to give a lot of error messages, some of them telling me that
  fixing can only be done using "--rebuild-tree".
- I freed 10GB of disk space and first ran a --check and then a
  --fix-fixable on the (unmounted) partition.
- As that went fine, I started a --rebuild-tree, which aborted twice.

Please find the logs for the correction runs attached.

reiserfsck -V says:
	reiserfsck 3.6.19 (2003 www.namesys.com)

I'm running a Debian Etch (up to date) with the Debian standard kernel
	Linux sydney 2.6.8-2-686 #1 Thu May 19 17:53:30 JST 2005 i686 GNU/Linux

The system itself is a 1 GHz P3 with 512MB RAM used as a server with an 
average load about 0.2. Hard disks are in pairs (RAID0) through a 3Ware 
Escalade 8508 SATA Controller. The failing partition is located on a pair new 
300GB SATA-Drives, the Controller does not report any problems.

The partition is about 300GB in size and holds a lot of big files (~50MBytes).

I hope you can make sense of what I send you. If I shall provide further 
information, please reply.

In the end I have two questions:
- Is there a way to regain access to the partition again to save as much of
  the contents as possible (I'll be getting me another set of harddisks this
  week)?
- I simply copied about 900M of pictures from a CF-card. Is there anything I
  should have considered (or consider in the future)?

Thanks in advance
Harry

--Boundary-00=_5bzCE60umCUDO60
Content-Type: text/x-log;
  charset="iso-8859-15";
  name="fix-fixable.sdc1.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="fix-fixable.sdc1.log"

bad_path: The left delimiting key [382 443 0x47001 IND (1)] of the node (1048577) must be equal to the first element's key [55089 55093 0x0 SD (0)] within the node.
bad_path: The left delimiting key [689 1227 0x79d54100 DIR (3)] of the node (950294) must be equal to the first element's key [13914 13919 0x2675001 IND (1)] within the node.
bad_path: The left delimiting key [1475 1497 0x96001 IND (1)] of the node (425985) must be equal to the first element's key [55878 55885 0xf001 IND (1)] within the node.
bad_path: The left delimiting key [1475 1518 0x157001 IND (1)] of the node (425990) must be equal to the first element's key [57874 57884 0x188001 IND (1)] within the node.
bad_path: The left delimiting key [1475 1526 0x1 DIR (3)] of the node (426000) must be equal to the first element's key [11777 11795 0x73c001 IND (1)] within the node.
bad_path: The left delimiting key [1475 1527 0x1 DRCT (2)] of the node (425992) must be equal to the first element's key [57874 57897 0x0 SD (0)] within the node.
bad_path: The left delimiting key [1475 1530 0x481 DRCT (2)] of the node (425994) must be equal to the first element's key [57874 57906 0x8e001 IND (1)] within the node.
bad_path: The left delimiting key [1475 1532 0x359 DRCT (2)] of the node (425995) must be equal to the first element's key [57874 57910 0x0 SD (0)] within the node.
bad_path: The left delimiting key [1475 1535 0x1 DRCT (2)] of the node (425996) must be equal to the first element's key [57874 57916 0x1 DRCT (2)] within the node.
bad_path: The left delimiting key [1475 1536 0x6d9 DRCT (2)] of the node (425997) must be equal to the first element's key [57874 57921 0x351 DRCT (2)] within the node.
bad_path: The left delimiting key [1475 1538 0x419 DRCT (2)] of the node (425998) must be equal to the first element's key [57874 57929 0x13a001 IND (1)] within the node.
bad_path: The left delimiting key [1475 1542 0x1 DRCT (2)] of the node (426001) must be equal to the first element's key [57874 57950 0x1ec001 IND (1)] within the node.
bad_path: The left delimiting key [1475 1543 0x649 DRCT (2)] of the node (426002) must be equal to the first element's key [57874 57939 0x0 SD (0)] within the node.
bad_path: The left delimiting key [4807 4808 0x39001 IND (1)] of the node (327681) must be equal to the first element's key [60535 62641 0x1 DRCT (2)] within the node.
bad_path: The left delimiting key [4814 4823 0x1 IND (1)] of the node (327682) must be equal to the first element's key [58483 58489 0x1 DIR (3)] within the node.
bad_path: The left delimiting key [6599 6601 0x1e8001 IND (1)] of the node (327684) must be equal to the first element's key [58483 58506 0x1 IND (1)] within the node.
bad_path: The left delimiting key [6599 6607 0x42001 IND (1)] of the node (327686) must be equal to the first element's key [58483 58511 0x2d9 DRCT (2)] within the node.
bad_path: The left delimiting key [6599 6608 0xd1001 IND (1)] of the node (327687) must be equal to the first element's key [58483 58520 0x0 SD (0)] within the node.
bad_path: The left delimiting key [6599 6644 0x223001 IND (1)] of the node (327705) must be equal to the first element's key [58483 58583 0x1 DRCT (2)] within the node.
bad_path: The left delimiting key [6599 6662 0x4001 IND (1)] of the node (327712) must be equal to the first element's key [11714 11777 0x0 SD (0)] within the node.
bad_path: The left delimiting key [6599 6667 0x267001 IND (1)] of the node (360449) must be equal to the first element's key [61704 61708 0x1 IND (1)] within the node.
bad_path: The left delimiting key [6599 6672 0xc7001 IND (1)] of the node (360450) must be equal to the first element's key [10289 10294 0x112001 IND (1)] within the node.
bad_path: The left delimiting key [6599 6681 0x1d9001 IND (1)] of the node (360453) must be equal to the first element's key [9080 9092 0x1ec001 IND (1)] within the node.
bad_path: The left delimiting key [6599 6768 0x2ce001 IND (1)] of the node (393217) must be equal to the first element's key [61553 61556 0x1 IND (1)] within the node.
bad_stat_data: The objectid (9093) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (9094) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (9095) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (9096) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (10298) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (10299) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (10300) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (10301) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (10302) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (10303) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (10304) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (11777) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (11899) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (11936) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (11937) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (11766) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (11838) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_path: The left delimiting key [12465 12470 0x2a9001 IND (1)] of the node (1015809) must be equal to the first element's key [55640 55642 0x42001 IND (1)] within the node.
bad_stat_data: The objectid (14263) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (14276) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (14292) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (41670) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (41671) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57964) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (64788) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (11778) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (11779) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (11780) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_path: The left delimiting key [20360 20398 0x76001 IND (1)] of the node (1605643) must be equal to the first element's key [11737 11776 0x26001 IND (1)] within the node.
bad_path: The left delimiting key [25014 25019 0x1a2001 IND (1)] of the node (1245185) must be equal to the first element's key [58954 59643 0x0 SD (0)] within the node.
block 1246988: The level of the node (38377) is not correct, (1) expected
 the problem in the internal node occured (1246988), whole subtree is skipped
bad_path: The left delimiting key [25038 25040 0xe26001 IND (1)] of the node (917505) must be equal to the first element's key [61522 61526 0x0 SD (0)] within the node.
bad_path: The left delimiting key [25543 25547 0x6c9001 IND (1)] of the node (1376257) must be equal to the first element's key [64518 64527 0x0 SD (0)] within the node.
bad_path: The left delimiting key [25543 25547 0xabd001 IND (1)] of the node (1376258) must be equal to the first element's key [64531 64569 0x149 DRCT (2)] within the node.
bad_path: The left delimiting key [26819 26822 0x1862001 IND (1)] of the node (1507329) must be equal to the first element's key [56914 56918 0xe1001 IND (1)] within the node.
bad_path: The left delimiting key [26819 26822 0x1c56001 IND (1)] of the node (1507330) must be equal to the first element's key [60534 60547 0x1 DRCT (2)] within the node.
bad_path: The left delimiting key [27062 27067 0x3e3001 IND (1)] of the node (1736705) must be equal to the first element's key [59955 59975 0x1 DRCT (2)] within the node.
bad_path: The left delimiting key [27062 27067 0x7d7001 IND (1)] of the node (1736706) must be equal to the first element's key [59955 60001 0x0 SD (0)] within the node.
bad_path: The left delimiting key [27062 27067 0xbcb001 IND (1)] of the node (1736707) must be equal to the first element's key [59955 59956 0x69c85880 DIR (3)] within the node.
bad_path: The left delimiting key [27062 27067 0xfbf001 IND (1)] of the node (1736721) must be equal to the first element's key [59955 60348 0x0 SD (0)] within the node.
bad_path: The left delimiting key [27318 27320 0x5c5001 IND (1)] of the node (1802241) must be equal to the first element's key [37677 37682 0x2e9 DRCT (2)] within the node.
bad_path: The left delimiting key [27318 27320 0x9b9001 IND (1)] of the node (1802242) must be equal to the first element's key [37677 37691 0x591 DRCT (2)] within the node.
bad_path: The left delimiting key [27318 27320 0xdad001 IND (1)] of the node (1802243) must be equal to the first element's key [37677 37702 0x514d1500 DIR (3)] within the node.
bad_path: The left delimiting key [27318 27320 0x11a1001 IND (1)] of the node (1802244) must be equal to the first element's key [37677 37714 0x514d1500 DIR (3)] within the node.
bad_path: The left delimiting key [27598 27604 0xca2001 IND (1)] of the node (1900547) must be equal to the first element's key [59661 59665 0x221 DRCT (2)] within the node.
block 1978753: The level of the node (60352) is not correct, (1) expected
 the problem in the internal node occured (1978753), whole subtree is skipped
bad_stat_data: The objectid (37683) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37684) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37685) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37686) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37687) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37688) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37689) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37690) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37691) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37692) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37693) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37694) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37695) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37696) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37697) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37698) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37699) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37700) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37701) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37702) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37703) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37704) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37705) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37706) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37707) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37708) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37709) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37710) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37711) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37712) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37713) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37714) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37715) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37716) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37717) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37718) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37719) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37720) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37721) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37722) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37723) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37724) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37725) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37727) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (37728) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_path: The left delimiting key [52785 52810 0x1 DRCT (2)] of the node (98307) must be equal to the first element's key [40 21328 0x7956001 IND (1)] within the node.
block 98308: The level of the node (44102) is not correct, (1) expected
 the problem in the internal node occured (98308), whole subtree is skipped
bad_stat_data: The objectid (55093) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55094) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55095) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55643) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55644) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55645) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55646) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55647) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55648) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55649) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55650) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55651) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55652) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55653) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55654) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55655) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55886) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55887) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55889) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55891) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55900) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55922) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55938) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55965) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (55890) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (56919) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (56920) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (56921) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (56922) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57885) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57886) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57887) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57888) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57897) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57898) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57899) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57900) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57901) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57902) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57903) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57904) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57905) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57906) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57907) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57908) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57909) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57910) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57911) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57912) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57913) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57914) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57915) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57916) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57917) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57918) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57919) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57920) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57921) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57922) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57923) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57924) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57925) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57926) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57927) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57928) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57929) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57930) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57931) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57932) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57933) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57934) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57935) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57936) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57937) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57938) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57939) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57940) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57941) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57942) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57943) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57948) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57949) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (57951) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58060) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58063) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58064) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58065) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58490) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58507) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58508) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58509) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58510) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58512) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58513) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58514) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58515) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58516) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58517) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58518) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58519) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58520) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58521) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58522) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58523) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58524) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58525) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58526) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58527) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58528) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58529) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58530) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58584) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58585) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58586) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59643) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58956) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (58957) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59666) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59668) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59669) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59671) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59674) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59686) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59957) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59958) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59959) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59960) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59961) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59962) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59963) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59964) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59965) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59966) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59967) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59968) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59969) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59970) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59971) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59972) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59973) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59974) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59975) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59976) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59977) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59978) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59979) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59980) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59981) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59982) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59983) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59984) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59985) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59986) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59987) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59988) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59989) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59990) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59991) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59992) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59993) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59994) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59995) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59996) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59997) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59998) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (59999) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60000) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60001) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60002) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60003) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60004) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60005) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60006) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60007) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60008) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60009) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60010) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60011) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60012) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60013) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60014) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60015) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60016) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60017) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60018) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60019) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60020) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60021) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60022) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60023) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60024) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60025) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60348) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60349) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60350) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60351) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60352) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60353) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60354) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60355) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60356) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60357) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60358) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60359) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60360) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60361) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60362) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60363) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60364) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60365) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60366) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60367) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60368) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60369) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60370) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60371) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60372) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60548) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60549) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60550) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60551) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60552) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60553) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60554) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60555) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (60556) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (62642) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (62643) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (62644) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (62645) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61154) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61158) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61526) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61528) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61529) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61530) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61531) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61533) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61534) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61535) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61536) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61538) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61539) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61540) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61541) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61543) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61544) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61545) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61546) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61548) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61549) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61550) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61551) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61552) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61554) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61555) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61556) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61557) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61559) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61560) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61561) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61562) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61564) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61565) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61566) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61567) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61569) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61570) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61571) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61572) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61574) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61575) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61576) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61577) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61579) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61580) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61581) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61582) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61584) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61585) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61586) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61710) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61711) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61712) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61713) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61715) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61716) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61717) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61718) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61720) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61721) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61722) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61723) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61725) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61726) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61727) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61728) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61730) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61731) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61732) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61733) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61735) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61736) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (61737) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (64527) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (64559) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (64562) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (64563) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (64564) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (64569) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (64570) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (64573) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (64575) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (64576) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (64578) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (64537) is shared by at least two files. Can be fixed with --rebuild-tree only.
bad_stat_data: The objectid (64538) is shared by at least two files. Can be fixed with --rebuild-tree only.
vpf-10630: The on-disk and the correct bitmaps differs. Will be fixed later.

--Boundary-00=_5bzCE60umCUDO60
Content-Type: text/x-log;
  charset="iso-8859-15";
  name="rebuild-tree.sdc1.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="rebuild-tree.sdc1.log"

####### Pass 0 #######
block 9312245: The number of items (58902) is incorrect, should be (1) - corrected
block 9312245: The free space (0) is incorrect, should be (4048) - corrected
pass0: vpf-10110: block 9312245, item (0): Unknown item type found [25344 1073768712 0x608e6e6e6e61de6 ??? (14)] - deleted
68711 directory entries were hashed with "r5" hash.
####### Pass 1 #######

--Boundary-00=_5bzCE60umCUDO60
Content-Type: text/x-log;
  charset="iso-8859-15";
  name="rebuild-tree.sdc1-2.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="rebuild-tree.sdc1-2.log"

####### Pass 0 #######
verify_directory_item: block 1736723, item 59955 60398 0x1 DIR (3), len 128, location 3968 entry count 5, fsck need 0, format old: All entries were deleted from the directory
pass0: block 1736723, item 1: The file [59955 60399] has the wrong mode (?--x--xr--), corrected to (---x--xr--)
pass0: block 1736723, item 3: The file [59955 60400] has the wrong mode (brw-rwx-w-), corrected to (-rw-rwx-w-)
pass0: block 1736723, item 5: Not the directory [59955 60401] has the wrong mode (dr-x-wx-wx), corrected to (-r-x-wx-wx)
pass0: block 1736723, item 7: The directory [59955 60402] has the wrong mode (?----wx---), corrected to (d----wx---)
verify_directory_item: block 1736723, item 59955 60402 0x1 DIR (3), len 104, location 3748 entry count 4, fsck need 0, format old: All entries were deleted from the directory
pass0: block 1736723, item 10: The directory [59955 60404] has the wrong mode (?--xrw-rw-), corrected to (d--xrw-rw-)
verify_directory_item: block 1736723, item 59955 60404 0x1 DIR (3), len 128, location 3548 entry count 5, fsck need 0, format old: All entries were deleted from the directory
pass0: block 1736723, item 11: The file [59955 60405] has the wrong mode (crwxrwx-wx), corrected to (-rwxrwx-wx)
pass0: block 1736723, item 13: The file [59955 60406] has the wrong mode (l-w-r--r--), corrected to (--w-r--r--)
pass0: block 1736723, item 15: The file [59955 60407] has the wrong mode (?r---wx---), corrected to (-r---wx---)
pass0: block 1736723, item 17: The directory [59955 60408] has the wrong mode (?r-xr-x-wx), corrected to (dr-xr-x-wx)
verify_directory_item: block 1736723, item 59955 60408 0x1 DIR (3), len 104, location 3328 entry count 4, fsck need 0, format old: All entries were deleted from the directory
pass0: block 1736723, item 20: The directory [59955 60410] has the wrong mode (c-wx-w-r--), corrected to (d-wx-w-r--)
verify_directory_item: block 1736723, item 59955 60410 0x1 DIR (3), len 96, location 3128 entry count 4, fsck need 0, format old: All entries were deleted from the directory
pass0: block 1736723, item 21: The file [59955 60411] has the wrong mode (lrwxr-xr--), corrected to (-rwxr-xr--)
pass0: block 1736723, item 23: The file [59955 60412] has the wrong mode (cr-xr--rw-), corrected to (-r-xr--rw-)
pass0: block 1736723, item 25: The directory [59955 60413] has the wrong mode (c-w-r--rw-), corrected to (d-w-r--rw-)
verify_directory_item: block 1736723, item 59955 60413 0x1 DIR (3), len 104, location 2924 entry count 4, fsck need 0, format old: All entries were deleted from the directory
pass0: block 1736723, item 26: Not the directory [59955 60414] has the wrong mode (dr-xrw----), corrected to (-r-xrw----)
pass0: block 1736723, item 28: The directory [59955 60415] has the wrong mode (?--xrwx--x), corrected to (d--xrwx--x)
verify_directory_item: block 1736723, item 59955 60415 0x1 DIR (3), len 96, location 2716 entry count 4, fsck need 0, format old: All entries were deleted from the directory
pass0: block 1998873, item 2: The directory [49184 43] has the wrong mode (?-w-r-xr-x), corrected to (d-w-r-xr-x)
verify_directory_item: block 1998873, item 49184 43 0x1 DIR (3), len 224, location 3112 entry count 6, fsck need 0, format old: All entries were deleted from the directory
pass0: block 1998873, item 3: Not the directory [49184 46] has the wrong mode (drwx-wxrw-), corrected to (-rwx-wxrw-)
pass0: block 1998873, item 5: The directory [49184 48] has the wrong mode (?-wx-w--w-), corrected to (d-wx-w--w-)
verify_directory_item: block 1998873, item 49184 48 0x1 DIR (3), len 96, location 2728 entry count 4, fsck need 0, format old: All entries were deleted from the directory
block 9312245: The number of items (58902) is incorrect, should be (1) - corrected
block 9312245: The free space (0) is incorrect, should be (4048) - corrected
pass0: vpf-10110: block 9312245, item (0): Unknown item type found [25344 1073768712 0x608e6e6e6e61de6 ??? (14)] - deleted
69094 directory entries were hashed with "r5" hash.
####### Pass 1 #######

--Boundary-00=_5bzCE60umCUDO60--
