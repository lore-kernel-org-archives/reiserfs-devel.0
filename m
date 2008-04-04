From: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
Subject: Reiser4: errors AFTER fsck
Date: Fri, 4 Apr 2008 19:38:18 +0200
Message-ID: <200804041938.18418.volker.armin.hemmann@tu-clausthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ReiserFS List <reiserfs-devel@vger.kernel.org>

Hi,

I have /var on reiser4 with compression plugin. /var contains the usual=
 stuff=20
+ gentoo portage tree + kernel-sources.

An hour ago I wanted to emerge --sync, which failed. I got fs errors.
I rebooted into busybox and did fsck.reiser4 /dev/sda6

It ran and told me that  --build-fs was needed.

So I ran it. It fixed lots of stuff (mostly lenght correction) and put =
222=20
files into lost+found.

After boot, I tried to access some of the files there, to figure out wh=
at I=20
lost:

[  566.765093] reiser4[ls(4761)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[  566.765094] WARNING: Error for inode 248375 (-2)
[  566.765109] reiser4[ls(4761)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[  566.765111] WARNING: Error for inode 248373 (-2)
[  566.765125] reiser4[ls(4761)]: key_warning=20
(fs/reiser4/plugin/file_plugin_common.c:514)[nikita-717]:
[  566.765127] WARNING: Error for inode 248374 (-2)


ls -lh /var/lost+found/
ls: Zugriff auf /var/lost+found/lost_name_3c43c:6f6964656e7464:3c440 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c43c:6f6964656e7464:3c43d ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c43c:6f6964656e7464:3c43e ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c43c:6f6964656e7464:3c43f ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c46a:16f70656e6e7470:3c46c n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c46a:6f70656e6e7470:3c46b ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c46a:c86f70656e6e7470:3c46d =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c493:12e6f70656e7377:7309e n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c493:12e6f70656e7377:7309f n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c493:16f70656e737761:3c495 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c493:16f70656e737761:3c496 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c493:69707365630000:3c494 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c49c:12e6f70656e7670:730a2 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c49c:12e6f70656e7670:b9a46 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c49c:2e6f70656e7670:730a3 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c49c:16f70656e76706e:3c4a3 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c49c:2e646f776e2e73:776b2 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c49c:6f70656e76706e:3c49e ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c49c:6f70656e76706e:3c49f ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c49c:2e75702e73682e:776b3 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c518:70757474792e78:3c51a ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c537:66696c65730000:3c53a ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c537:2e4d616e696665:7de99 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c537:4368616e67654c:3c538 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c556:72646174652d63:3c557 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c556:72646174652d69:3c558 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c556:72646174652d69:3c559 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c556:72646174652d69:3c55a ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c581:c87273796e63642e:3c589 =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c581:c87273796e63642e:3c58a =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c581:17273796e632d32:3c584 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c581:17273796e632d32:3c585 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c581:17273796e632d32:3c586 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c581:17273796e632d32:3c587 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c581:17273796e632d32:3c588 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c581:12e7273796e6364:d418a1 =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c581:12e7273796e632d:255c66 =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c581:12e7273796e632d:23e034 =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c581:12e7273796e632d:23e035 =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c581:12e7273796e632d:23e036 =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c581:7273796e63642e:3c582 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c581:7273796e63642e:3c583 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c597:727762732e636f:3c598 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c597:727762732e7263:3c599 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c5de:1736572326e6574:3c5df n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c6a0:17374756e6e656c:3c6a4 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c6a0:17374756e6e656c:3c6a5 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c6a0:17374756e6e656c:3c6a6 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c6a0:7374756e6e656c:3c6a1 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c6a0:7374756e6e656c:3c6a2 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c6bb:17461796c6f722d:3c6bc n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c6e9:2e74696e63642e:d9e70b n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c6e9:2e74696e632e6e:d9e70a n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c736:1756e69736f6e2d:3c738 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c736:1756e69736f6e2d:3c739 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c736:12e756e69736f6e:6a546 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c736:16f63616d6c2d33:3c737 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c797:766e632d342e31:3c798 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c797:766e632e636f6e:3c799 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c797:766e632e696e69:3c79a ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c797:766e6376696577:3c79b ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c7eb:7468726f74746c:3c7ec ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c818:7832355f757469:3c819 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8d3:6c64617076692d:3c8d7 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8d3:2e4d616e696665:7defc ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8d3:4368616e67654c:3c8d4 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8d3:6d657461646174:3c8d8 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8d9:6c65642d312e37:3c8dd ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8d9:2e4d616e696665:7defd ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8d9:4368616e67654c:3c8da ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8d9:6d657461646174:3c8de ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8df:6c756d612d322e:3c8e3 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8df:6c756d612d322e:3c8e4 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8df:6c756d612d322e:3c8e5 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8df:2e4d616e696665:7defe ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8df:4368616e67654c:3c8e0 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8df:6d657461646174:3c8e6 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8e8:16e69732d757469:3c8f0 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8e8:16e69732d757469:3c8f1 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8e8:12e6e69732d7574:1b183a =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8e8:66696c65730000:3c8eb ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8e8:6d657461646174:3c8ef ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8e8:2e4d616e696665:1b1839 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c8e8:2e4368616e6765:1b1838 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c909:706f7374696e73:3c90a ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c910:12e706f72746d61:c16d7 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c910:706f72746d6170:3c923 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c910:66696c65730000:3c913 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c910:2e4d616e696665:c16d6 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c910:4368616e67654c:3c911 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c910:6d657461646174:3c920 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c924:66696c65730000:3c927 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c924:72706362696e64:3c92b ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c924:2e4d616e696665:7df03 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c924:4368616e67654c:3c925 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c924:6d657461646174:3c92a ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c92c:12e736d626c6461:21f856 =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c92c:1736d626c646170:3c932 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c92c:1736d626c646170:3c933 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c92c:6d657461646174:3c930 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c92c:2e4d616e696665:21f855 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c92c:2e4368616e6765:21f854 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c934:2e4368616e6765:ce746 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c934:66696c65730000:3c937 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c934:2e4d616e696665:ce747 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c934:6d657461646174:3c93b ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c934:12e7461635f706c:ce748 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c934:12e7461635f706c:ce749 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c93d:66696c65730000:3c940 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c93d:2e4d616e696665:7df06 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c93d:4368616e67654c:3c93e ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c93d:6d657461646174:3c942 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c93d:79702d746f6f6c:3c943 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c93d:79702d746f6f6c:3c944 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c93d:79702d746f6f6c:3c945 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c946:66696c65730000:3c949 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c946:2e4d616e696665:7df07 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c946:4368616e67654c:3c947 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c946:6d657461646174:3c94c ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c946:797062696e642d:3c94d ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c946:797062696e642d:3c94e ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c94f:66696c65730000:3c952 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c94f:2e4d616e696665:7df08 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c94f:4368616e67654c:3c950 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c94f:6d657461646174:3c959 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c94f:7970736572762d:3c95a ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c94f:7970736572762d:3c95b ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c969:1626c616d2d312e:3c96a n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c969:1626c616d2d312e:3c96b n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c96d:2e4d616e696665:7df0b ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c96d:4368616e67654c:3c96e ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c974:2e6d6574616461:218bf6 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c974:66696c65730000:3c977 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c974:16576656e747761:3c97a n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c974:16576656e747761:3c97b n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c974:16576656e747761:3c97c n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c974:2e4d616e696665:218bf5 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c974:2e4368616e6765:218bf4 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c97d:66696c65730000:3c980 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c97d:6d657461646174:3c987 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c97d:2e4d616e696665:d418a3 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c97d:2e4368616e6765:d418a2 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c97d:12e6c6966657265:d418a4 =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c97d:12e6c6966657265:d418a5 =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c97d:12e6c6966657265:d418a6 =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c97d:12e6c6966657265:d418a7 =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c97d:12e6c6966657265:d418a8 =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c97d:12e6c6966657265:d418a9 =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c98a:2e4368616e6765:6a54f ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c98a:66696c65730000:3c98d ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c98a:12e6e6577736265:6a551 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c98a:12e6e6577736265:6a552 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c98a:2e4d616e696665:7df0e ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c98a:6d657461646174:3c98e ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c990:726167676c652d:3c995 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c990:726167676c652d:3c996 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c990:726167676c652d:3c997 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c990:2e4d616e696665:7df0f ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c990:4368616e67654c:3c991 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c990:6d657461646174:3c994 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c998:726177646f672d:3c99e ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c998:12e726177646f67:16bc33 =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c998:6d657461646174:3c99c ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c998:2e4d616e696665:16bc32 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c998:2e4368616e6765:16bc31 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c99f:2e4d616e696665:7df11 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c99f:4368616e67654c:3c9a0 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c99f:6d657461646174:3c9a3 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c99f:7273737461696c:3c9a4 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c99f:7273737461696c:3c9a5 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9a6:66696c65730000:3c9a9 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9a6:2e4d616e696665:7df12 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9a6:4368616e67654c:3c9a7 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9a6:6d657461646174:3c9ac ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9a6:1727373746f6f6c:3c9ad n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9a6:1727373746f6f6c:3c9ae n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9a6:1727373746f6f6c:3c9af n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9b0:1736e6f776e6577:3c9b8 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9b0:736e6f776e6577:3c9b7 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9b0:12e736e6f776e65:17235f =
nicht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9b0:66696c65730000:3c9b3 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9b0:6d657461646174:3c9b6 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9b0:2e4d616e696665:17235e n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9b0:2e4368616e6765:17235d n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9b9:73747261772d30:3c9c0 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9b9:73747261772d30:3c9c1 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9b9:73747261772d30:3c9c2 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9b9:66696c65730000:3c9bc ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9b9:2e4d616e696665:7df14 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9b9:4368616e67654c:3c9ba ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9b9:6d657461646174:3c9bf ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9c6:17961727373722d:3c9c7 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9c6:17961727373722d:3c9c8 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9cb:79656e636f6465:3c9d0 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9cb:2e4d616e696665:7df16 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9cb:4368616e67654c:3c9cc ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9cb:6d657461646174:3c9cf ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9d1:2e4d616e696665:7df17 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9d1:4368616e67654c:3c9d2 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9d1:6d657461646174:3c9d5 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9d1:79796465636f64:3c9d6 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9d1:79796465636f64:3c9d7 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9f6:696e6e64000000:3c9f8 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9f6:1696e6e2d322e34:3c9f9 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3c9f6:1696e6e2d322e34:3c9fa n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3ca31:6e7a626765742d:3ca3a ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3ca31:6e7a626765742d:3ca3b ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3ca34:1302e322e332d69:3ca37 n=
icht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3ca34:302e322e332d64:3ca35 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
ls: Zugriff auf /var/lost+found/lost_name_3ca34:302e322e332d67:3ca36 ni=
cht=20
m=F6glich: Datei oder Verzeichnis nicht gefunden
insgesamt 4,0K
lrwxrwxrwx 1 root root   24 15. Feb 23:18=20
lost_name_14c796:636169726f2d31:14cc01 -> ../All/cairo-1.4.12.tbz2
?????????? ? ?    ?       ?             ? lost_name_3c43c:6f6964656e746=
4:3c43d
?????????? ? ?    ?       ?             ? lost_name_3c43c:6f6964656e746=
4:3c43e
?????????? ? ?    ?       ?             ? lost_name_3c43c:6f6964656e746=
4:3c43f
?????????? ? ?    ?       ?             ? lost_name_3c43c:6f6964656e746=
4:3c440
?????????? ? ?    ?       ?             ?=20
lost_name_3c46a:16f70656e6e7470:3c46c
?????????? ? ?    ?       ?             ? lost_name_3c46a:6f70656e6e747=
0:3c46b
?????????? ? ?    ?       ?             ?=20
lost_name_3c46a:c86f70656e6e7470:3c46d
?????????? ? ?    ?       ?             ?=20
lost_name_3c493:12e6f70656e7377:7309e
?????????? ? ?    ?       ?             ?=20
lost_name_3c493:12e6f70656e7377:7309f
?????????? ? ?    ?       ?             ?=20
lost_name_3c493:16f70656e737761:3c495
?????????? ? ?    ?       ?             ?=20
lost_name_3c493:16f70656e737761:3c496
?????????? ? ?    ?       ?             ? lost_name_3c493:6970736563000=
0:3c494
?????????? ? ?    ?       ?             ?=20
lost_name_3c49c:12e6f70656e7670:730a2
?????????? ? ?    ?       ?             ?=20
lost_name_3c49c:12e6f70656e7670:b9a46
?????????? ? ?    ?       ?             ?=20
lost_name_3c49c:16f70656e76706e:3c4a3
?????????? ? ?    ?       ?             ? lost_name_3c49c:2e646f776e2e7=
3:776b2
?????????? ? ?    ?       ?             ? lost_name_3c49c:2e6f70656e767=
0:730a3
?????????? ? ?    ?       ?             ? lost_name_3c49c:2e75702e73682=
e:776b3
?????????? ? ?    ?       ?             ? lost_name_3c49c:6f70656e76706=
e:3c49e
?????????? ? ?    ?       ?             ? lost_name_3c49c:6f70656e76706=
e:3c49f
?????????? ? ?    ?       ?             ? lost_name_3c518:70757474792e7=
8:3c51a
?????????? ? ?    ?       ?             ? lost_name_3c537:2e4d616e69666=
5:7de99
?????????? ? ?    ?       ?             ? lost_name_3c537:4368616e67654=
c:3c538
?????????? ? ?    ?       ?             ? lost_name_3c537:66696c6573000=
0:3c53a
?????????? ? ?    ?       ?             ? lost_name_3c556:72646174652d6=
3:3c557
?????????? ? ?    ?       ?             ? lost_name_3c556:72646174652d6=
9:3c558
?????????? ? ?    ?       ?             ? lost_name_3c556:72646174652d6=
9:3c559
?????????? ? ?    ?       ?             ? lost_name_3c556:72646174652d6=
9:3c55a
?????????? ? ?    ?       ?             ?=20
lost_name_3c581:12e7273796e632d:23e034
?????????? ? ?    ?       ?             ?=20
lost_name_3c581:12e7273796e632d:23e035
?????????? ? ?    ?       ?             ?=20
lost_name_3c581:12e7273796e632d:23e036
?????????? ? ?    ?       ?             ?=20
lost_name_3c581:12e7273796e632d:255c66
?????????? ? ?    ?       ?             ?=20
lost_name_3c581:12e7273796e6364:d418a1
?????????? ? ?    ?       ?             ?=20
lost_name_3c581:17273796e632d32:3c584
?????????? ? ?    ?       ?             ?=20
lost_name_3c581:17273796e632d32:3c585
?????????? ? ?    ?       ?             ?=20
lost_name_3c581:17273796e632d32:3c586
?????????? ? ?    ?       ?             ?=20
lost_name_3c581:17273796e632d32:3c587
?????????? ? ?    ?       ?             ?=20
lost_name_3c581:17273796e632d32:3c588
?????????? ? ?    ?       ?             ? lost_name_3c581:7273796e63642=
e:3c582
?????????? ? ?    ?       ?             ? lost_name_3c581:7273796e63642=
e:3c583
?????????? ? ?    ?       ?             ?=20
lost_name_3c581:c87273796e63642e:3c589
?????????? ? ?    ?       ?             ?=20
lost_name_3c581:c87273796e63642e:3c58a
?????????? ? ?    ?       ?             ? lost_name_3c597:727762732e636=
f:3c598
?????????? ? ?    ?       ?             ? lost_name_3c597:727762732e726=
3:3c599
?????????? ? ?    ?       ?             ?=20
lost_name_3c5de:1736572326e6574:3c5df
?????????? ? ?    ?       ?             ?=20
lost_name_3c6a0:17374756e6e656c:3c6a4
?????????? ? ?    ?       ?             ?=20
lost_name_3c6a0:17374756e6e656c:3c6a5
?????????? ? ?    ?       ?             ?=20
lost_name_3c6a0:17374756e6e656c:3c6a6
?????????? ? ?    ?       ?             ? lost_name_3c6a0:7374756e6e656=
c:3c6a1
?????????? ? ?    ?       ?             ? lost_name_3c6a0:7374756e6e656=
c:3c6a2
?????????? ? ?    ?       ?             ?=20
lost_name_3c6bb:17461796c6f722d:3c6bc
?????????? ? ?    ?       ?             ?=20
lost_name_3c6e9:2e74696e632e6e:d9e70a
?????????? ? ?    ?       ?             ?=20
lost_name_3c6e9:2e74696e63642e:d9e70b
?????????? ? ?    ?       ?             ?=20
lost_name_3c736:12e756e69736f6e:6a546
?????????? ? ?    ?       ?             ?=20
lost_name_3c736:16f63616d6c2d33:3c737
?????????? ? ?    ?       ?             ?=20
lost_name_3c736:1756e69736f6e2d:3c738
?????????? ? ?    ?       ?             ?=20
lost_name_3c736:1756e69736f6e2d:3c739
?????????? ? ?    ?       ?             ? lost_name_3c797:766e632d342e3=
1:3c798
?????????? ? ?    ?       ?             ? lost_name_3c797:766e632e636f6=
e:3c799
?????????? ? ?    ?       ?             ? lost_name_3c797:766e632e696e6=
9:3c79a
?????????? ? ?    ?       ?             ? lost_name_3c797:766e637669657=
7:3c79b
?????????? ? ?    ?       ?             ? lost_name_3c7eb:7468726f74746=
c:3c7ec
?????????? ? ?    ?       ?             ? lost_name_3c818:7832355f75746=
9:3c819
?????????? ? ?    ?       ?             ? lost_name_3c8d3:2e4d616e69666=
5:7defc
?????????? ? ?    ?       ?             ? lost_name_3c8d3:4368616e67654=
c:3c8d4
?????????? ? ?    ?       ?             ? lost_name_3c8d3:6c64617076692=
d:3c8d7
?????????? ? ?    ?       ?             ? lost_name_3c8d3:6d65746164617=
4:3c8d8
?????????? ? ?    ?       ?             ? lost_name_3c8d9:2e4d616e69666=
5:7defd
?????????? ? ?    ?       ?             ? lost_name_3c8d9:4368616e67654=
c:3c8da
?????????? ? ?    ?       ?             ? lost_name_3c8d9:6c65642d312e3=
7:3c8dd
?????????? ? ?    ?       ?             ? lost_name_3c8d9:6d65746164617=
4:3c8de
?????????? ? ?    ?       ?             ? lost_name_3c8df:2e4d616e69666=
5:7defe
?????????? ? ?    ?       ?             ? lost_name_3c8df:4368616e67654=
c:3c8e0
?????????? ? ?    ?       ?             ? lost_name_3c8df:6c756d612d322=
e:3c8e3
?????????? ? ?    ?       ?             ? lost_name_3c8df:6c756d612d322=
e:3c8e4
?????????? ? ?    ?       ?             ? lost_name_3c8df:6c756d612d322=
e:3c8e5
?????????? ? ?    ?       ?             ? lost_name_3c8df:6d65746164617=
4:3c8e6
?????????? ? ?    ?       ?             ?=20
lost_name_3c8e8:12e6e69732d7574:1b183a
?????????? ? ?    ?       ?             ?=20
lost_name_3c8e8:16e69732d757469:3c8f0
?????????? ? ?    ?       ?             ?=20
lost_name_3c8e8:16e69732d757469:3c8f1
?????????? ? ?    ?       ?             ?=20
lost_name_3c8e8:2e4368616e6765:1b1838
?????????? ? ?    ?       ?             ?=20
lost_name_3c8e8:2e4d616e696665:1b1839
?????????? ? ?    ?       ?             ? lost_name_3c8e8:66696c6573000=
0:3c8eb
?????????? ? ?    ?       ?             ? lost_name_3c8e8:6d65746164617=
4:3c8ef
?????????? ? ?    ?       ?             ? lost_name_3c909:706f7374696e7=
3:3c90a
?????????? ? ?    ?       ?             ?=20
lost_name_3c910:12e706f72746d61:c16d7
?????????? ? ?    ?       ?             ? lost_name_3c910:2e4d616e69666=
5:c16d6
?????????? ? ?    ?       ?             ? lost_name_3c910:4368616e67654=
c:3c911
?????????? ? ?    ?       ?             ? lost_name_3c910:66696c6573000=
0:3c913
?????????? ? ?    ?       ?             ? lost_name_3c910:6d65746164617=
4:3c920
?????????? ? ?    ?       ?             ? lost_name_3c910:706f72746d617=
0:3c923
?????????? ? ?    ?       ?             ? lost_name_3c924:2e4d616e69666=
5:7df03
?????????? ? ?    ?       ?             ? lost_name_3c924:4368616e67654=
c:3c925
?????????? ? ?    ?       ?             ? lost_name_3c924:66696c6573000=
0:3c927
?????????? ? ?    ?       ?             ? lost_name_3c924:6d65746164617=
4:3c92a
?????????? ? ?    ?       ?             ? lost_name_3c924:72706362696e6=
4:3c92b
?????????? ? ?    ?       ?             ?=20
lost_name_3c92c:12e736d626c6461:21f856
?????????? ? ?    ?       ?             ?=20
lost_name_3c92c:1736d626c646170:3c932
?????????? ? ?    ?       ?             ?=20
lost_name_3c92c:1736d626c646170:3c933
?????????? ? ?    ?       ?             ?=20
lost_name_3c92c:2e4368616e6765:21f854
?????????? ? ?    ?       ?             ?=20
lost_name_3c92c:2e4d616e696665:21f855
?????????? ? ?    ?       ?             ? lost_name_3c92c:6d65746164617=
4:3c930
?????????? ? ?    ?       ?             ?=20
lost_name_3c934:12e7461635f706c:ce748
?????????? ? ?    ?       ?             ?=20
lost_name_3c934:12e7461635f706c:ce749
?????????? ? ?    ?       ?             ? lost_name_3c934:2e4368616e676=
5:ce746
?????????? ? ?    ?       ?             ? lost_name_3c934:2e4d616e69666=
5:ce747
?????????? ? ?    ?       ?             ? lost_name_3c934:66696c6573000=
0:3c937
?????????? ? ?    ?       ?             ? lost_name_3c934:6d65746164617=
4:3c93b
?????????? ? ?    ?       ?             ? lost_name_3c93d:2e4d616e69666=
5:7df06
?????????? ? ?    ?       ?             ? lost_name_3c93d:4368616e67654=
c:3c93e
?????????? ? ?    ?       ?             ? lost_name_3c93d:66696c6573000=
0:3c940
?????????? ? ?    ?       ?             ? lost_name_3c93d:6d65746164617=
4:3c942
?????????? ? ?    ?       ?             ? lost_name_3c93d:79702d746f6f6=
c:3c943
?????????? ? ?    ?       ?             ? lost_name_3c93d:79702d746f6f6=
c:3c944
?????????? ? ?    ?       ?             ? lost_name_3c93d:79702d746f6f6=
c:3c945
?????????? ? ?    ?       ?             ? lost_name_3c946:2e4d616e69666=
5:7df07
?????????? ? ?    ?       ?             ? lost_name_3c946:4368616e67654=
c:3c947
?????????? ? ?    ?       ?             ? lost_name_3c946:66696c6573000=
0:3c949
?????????? ? ?    ?       ?             ? lost_name_3c946:6d65746164617=
4:3c94c
?????????? ? ?    ?       ?             ? lost_name_3c946:797062696e642=
d:3c94d
?????????? ? ?    ?       ?             ? lost_name_3c946:797062696e642=
d:3c94e
?????????? ? ?    ?       ?             ? lost_name_3c94f:2e4d616e69666=
5:7df08
?????????? ? ?    ?       ?             ? lost_name_3c94f:4368616e67654=
c:3c950
?????????? ? ?    ?       ?             ? lost_name_3c94f:66696c6573000=
0:3c952
?????????? ? ?    ?       ?             ? lost_name_3c94f:6d65746164617=
4:3c959
?????????? ? ?    ?       ?             ? lost_name_3c94f:7970736572762=
d:3c95a
?????????? ? ?    ?       ?             ? lost_name_3c94f:7970736572762=
d:3c95b
?????????? ? ?    ?       ?             ?=20
lost_name_3c969:1626c616d2d312e:3c96a
?????????? ? ?    ?       ?             ?=20
lost_name_3c969:1626c616d2d312e:3c96b
?????????? ? ?    ?       ?             ? lost_name_3c96d:2e4d616e69666=
5:7df0b
?????????? ? ?    ?       ?             ? lost_name_3c96d:4368616e67654=
c:3c96e
?????????? ? ?    ?       ?             ?=20
lost_name_3c974:16576656e747761:3c97a
?????????? ? ?    ?       ?             ?=20
lost_name_3c974:16576656e747761:3c97b
?????????? ? ?    ?       ?             ?=20
lost_name_3c974:16576656e747761:3c97c
?????????? ? ?    ?       ?             ?=20
lost_name_3c974:2e4368616e6765:218bf4
?????????? ? ?    ?       ?             ?=20
lost_name_3c974:2e4d616e696665:218bf5
?????????? ? ?    ?       ?             ?=20
lost_name_3c974:2e6d6574616461:218bf6
?????????? ? ?    ?       ?             ? lost_name_3c974:66696c6573000=
0:3c977
?????????? ? ?    ?       ?             ?=20
lost_name_3c97d:12e6c6966657265:d418a4
?????????? ? ?    ?       ?             ?=20
lost_name_3c97d:12e6c6966657265:d418a5
?????????? ? ?    ?       ?             ?=20
lost_name_3c97d:12e6c6966657265:d418a6
?????????? ? ?    ?       ?             ?=20
lost_name_3c97d:12e6c6966657265:d418a7
?????????? ? ?    ?       ?             ?=20
lost_name_3c97d:12e6c6966657265:d418a8
?????????? ? ?    ?       ?             ?=20
lost_name_3c97d:12e6c6966657265:d418a9
?????????? ? ?    ?       ?             ?=20
lost_name_3c97d:2e4368616e6765:d418a2
?????????? ? ?    ?       ?             ?=20
lost_name_3c97d:2e4d616e696665:d418a3
?????????? ? ?    ?       ?             ? lost_name_3c97d:66696c6573000=
0:3c980
?????????? ? ?    ?       ?             ? lost_name_3c97d:6d65746164617=
4:3c987
?????????? ? ?    ?       ?             ?=20
lost_name_3c98a:12e6e6577736265:6a551
?????????? ? ?    ?       ?             ?=20
lost_name_3c98a:12e6e6577736265:6a552
?????????? ? ?    ?       ?             ? lost_name_3c98a:2e4368616e676=
5:6a54f
?????????? ? ?    ?       ?             ? lost_name_3c98a:2e4d616e69666=
5:7df0e
?????????? ? ?    ?       ?             ? lost_name_3c98a:66696c6573000=
0:3c98d
?????????? ? ?    ?       ?             ? lost_name_3c98a:6d65746164617=
4:3c98e
?????????? ? ?    ?       ?             ? lost_name_3c990:2e4d616e69666=
5:7df0f
?????????? ? ?    ?       ?             ? lost_name_3c990:4368616e67654=
c:3c991
?????????? ? ?    ?       ?             ? lost_name_3c990:6d65746164617=
4:3c994
?????????? ? ?    ?       ?             ? lost_name_3c990:726167676c652=
d:3c995
?????????? ? ?    ?       ?             ? lost_name_3c990:726167676c652=
d:3c996
?????????? ? ?    ?       ?             ? lost_name_3c990:726167676c652=
d:3c997
?????????? ? ?    ?       ?             ?=20
lost_name_3c998:12e726177646f67:16bc33
?????????? ? ?    ?       ?             ?=20
lost_name_3c998:2e4368616e6765:16bc31
?????????? ? ?    ?       ?             ?=20
lost_name_3c998:2e4d616e696665:16bc32
?????????? ? ?    ?       ?             ? lost_name_3c998:6d65746164617=
4:3c99c
?????????? ? ?    ?       ?             ? lost_name_3c998:726177646f672=
d:3c99e
?????????? ? ?    ?       ?             ? lost_name_3c99f:2e4d616e69666=
5:7df11
?????????? ? ?    ?       ?             ? lost_name_3c99f:4368616e67654=
c:3c9a0
?????????? ? ?    ?       ?             ? lost_name_3c99f:6d65746164617=
4:3c9a3
?????????? ? ?    ?       ?             ? lost_name_3c99f:7273737461696=
c:3c9a4
?????????? ? ?    ?       ?             ? lost_name_3c99f:7273737461696=
c:3c9a5
?????????? ? ?    ?       ?             ?=20
lost_name_3c9a6:1727373746f6f6c:3c9ad
?????????? ? ?    ?       ?             ?=20
lost_name_3c9a6:1727373746f6f6c:3c9ae
?????????? ? ?    ?       ?             ?=20
lost_name_3c9a6:1727373746f6f6c:3c9af
?????????? ? ?    ?       ?             ? lost_name_3c9a6:2e4d616e69666=
5:7df12
?????????? ? ?    ?       ?             ? lost_name_3c9a6:4368616e67654=
c:3c9a7
?????????? ? ?    ?       ?             ? lost_name_3c9a6:66696c6573000=
0:3c9a9
?????????? ? ?    ?       ?             ? lost_name_3c9a6:6d65746164617=
4:3c9ac
?????????? ? ?    ?       ?             ?=20
lost_name_3c9b0:12e736e6f776e65:17235f
?????????? ? ?    ?       ?             ?=20
lost_name_3c9b0:1736e6f776e6577:3c9b8
?????????? ? ?    ?       ?             ?=20
lost_name_3c9b0:2e4368616e6765:17235d
?????????? ? ?    ?       ?             ?=20
lost_name_3c9b0:2e4d616e696665:17235e
?????????? ? ?    ?       ?             ? lost_name_3c9b0:66696c6573000=
0:3c9b3
?????????? ? ?    ?       ?             ? lost_name_3c9b0:6d65746164617=
4:3c9b6
?????????? ? ?    ?       ?             ? lost_name_3c9b0:736e6f776e657=
7:3c9b7
?????????? ? ?    ?       ?             ? lost_name_3c9b9:2e4d616e69666=
5:7df14
?????????? ? ?    ?       ?             ? lost_name_3c9b9:4368616e67654=
c:3c9ba
?????????? ? ?    ?       ?             ? lost_name_3c9b9:66696c6573000=
0:3c9bc
?????????? ? ?    ?       ?             ? lost_name_3c9b9:6d65746164617=
4:3c9bf
?????????? ? ?    ?       ?             ? lost_name_3c9b9:73747261772d3=
0:3c9c0
?????????? ? ?    ?       ?             ? lost_name_3c9b9:73747261772d3=
0:3c9c1
?????????? ? ?    ?       ?             ? lost_name_3c9b9:73747261772d3=
0:3c9c2
?????????? ? ?    ?       ?             ?=20
lost_name_3c9c6:17961727373722d:3c9c7
?????????? ? ?    ?       ?             ?=20
lost_name_3c9c6:17961727373722d:3c9c8
?????????? ? ?    ?       ?             ? lost_name_3c9cb:2e4d616e69666=
5:7df16
?????????? ? ?    ?       ?             ? lost_name_3c9cb:4368616e67654=
c:3c9cc
?????????? ? ?    ?       ?             ? lost_name_3c9cb:6d65746164617=
4:3c9cf
?????????? ? ?    ?       ?             ? lost_name_3c9cb:79656e636f646=
5:3c9d0
?????????? ? ?    ?       ?             ? lost_name_3c9d1:2e4d616e69666=
5:7df17
?????????? ? ?    ?       ?             ? lost_name_3c9d1:4368616e67654=
c:3c9d2
?????????? ? ?    ?       ?             ? lost_name_3c9d1:6d65746164617=
4:3c9d5
?????????? ? ?    ?       ?             ? lost_name_3c9d1:79796465636f6=
4:3c9d6
?????????? ? ?    ?       ?             ? lost_name_3c9d1:79796465636f6=
4:3c9d7
?????????? ? ?    ?       ?             ?=20
lost_name_3c9f6:1696e6e2d322e34:3c9f9
?????????? ? ?    ?       ?             ?=20
lost_name_3c9f6:1696e6e2d322e34:3c9fa
?????????? ? ?    ?       ?             ? lost_name_3c9f6:696e6e6400000=
0:3c9f8
?????????? ? ?    ?       ?             ? lost_name_3ca31:6e7a626765742=
d:3ca3a
?????????? ? ?    ?       ?             ? lost_name_3ca31:6e7a626765742=
d:3ca3b
?????????? ? ?    ?       ?             ?=20
lost_name_3ca34:1302e322e332d69:3ca37
?????????? ? ?    ?       ?             ? lost_name_3ca34:302e322e332d6=
4:3ca35
?????????? ? ?    ?       ?             ? lost_name_3ca34:302e322e332d6=
7:3ca36
-rw-r--r-- 1 root root    0  4. Apr 2008  lost_name_3d0e4:4356452d32303=
0:3d0e5
lrwxrwxrwx 1 root root   24 22. Jan 16:20=20
lost_name_3d579:6b6f706574652d:441e6 -> ../All/kopete-3.5.7.tbz2
lrwxrwxrwx 1 root root   34 22. Jan 16:20=20
lost_name_3d57b:1616c7361706c61:441e5 -> ../All/alsaplayer-0.99.80_rc3.=
tbz2
lrwxrwxrwx 1 root root   33 22. Jan 16:20=20
lost_name_3d57d:1626173656c6179:441e4 -> ../All/baselayout-1.12.10-r4.t=
bz2
lrwxrwxrwx 1 root root   33 22. Jan 16:20=20
lost_name_3d57f:162696e7574696c:441e2 -> ../All/binutils-2.17.50.0.16.t=
bz2
lrwxrwxrwx 1 root root   28 22. Jan 16:20=20
lost_name_3d57f:62696e7574696c:441e3 -> ../All/binutils-2.17-r1.tbz2
lrwxrwxrwx 1 root root   23 22. Jan 16:20=20
lost_name_3d582:676c6962632d32:441e1 -> ../All/glibc-2.6.1.tbz2
-rw-r--r-- 1 root root  802 21. M=E4r 07:37=20
lost_name_d5c51b:12e706c6f6e6534:d5cb83
-rw-r--r-- 1 root root  377 21. M=E4r 07:37=20
lost_name_d5c51b:2e4368616e6765:d5cb80
-rw-r--r-- 1 root root 1,1K 21. M=E4r 07:37=20
lost_name_d5c51b:2e4d616e696665:d5cb81
-rw-r--r-- 1 root root 2,0K 21. M=E4r 07:37=20
lost_name_d5c51b:2e6d6574616461:d5cb82

Zugriff nicht m=F6glich =3D access not possible
Datei oder Verzeichniss nicht gefunden =3D file or directory not found.

debugfs.reiser4 -f /dev/sda6
debugfs.reiser4 1.0.6
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by=20
reiser4progs/COPYING.

Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           741ab423-a0a4-4678-898b-0c2e1ebf0b2d
label:          <none>

=46ormat super block (17):
plugin:         format40
description:    Disk-format plugin.
version:        0
magic:          ReIsEr40FoRmAt
mkfs id:        0x1e5b75fb
flushes:        0
blocks:         5373728
free blocks:    3727181
root block:     662978
tail policy:    0x2 (smart)
next oid:       0xdb9f2c
file count:     494886
tree height:    5
key policy:     LARGE

=46S status block (21):
=46S marked consistent

Kernel is 2.6.24.3, with latest 'unified' patch.

System is amd64.=20

Gl=FCck Auf,
Volker
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
