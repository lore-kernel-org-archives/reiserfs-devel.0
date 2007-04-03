From: sbenni@gmx.de
Subject: reiser4 causes system freeze for 1-2 seconds
Date: Tue, 3 Apr 2007 15:37:55 +0200
Message-ID: <20070403153755.1fc7bc4b@pluto.milky.way>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30627-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello,

I have a 120Gb partition with reiser4. If I start a command like "cp <500mb file> dd" within it the system frequently freezes for 1-2 seconds and ent:hda8! uses nearly 100% cpu. This causes the sound output from xmms to be interrupted and my mouse freezes also. If i renice X and xmms to -10 it is okay. 

Is this the desired behaviour ?

Can I do sth. else than renicing all time critical programs ?

My system is a debian amd64 with linux-2.6.16-mm2.


Best Regards

Benni
