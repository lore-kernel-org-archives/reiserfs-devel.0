From: J.Strohschnitter <svebu@gmx.de>
Subject: Kernel Oplocks and ReiserFS
Date: Mon, 10 Jun 2002 12:02:54 +0200
Message-ID: <E17HM0l-0007xZ-00@m-fra02.rhg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10706-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi there,

are there any problems with Kernel Oplocks, activated in samba 2.2.4 and 
ReiserFS (3.x.0b) ?
When I activate kernel oplocks in the globat section of smb.conf, all DOS- 
applications will hang, when two or more clients uses the same file to
write/read.
What can I do to make samba work with reiserFS - or is this no reiserFS
problem ? 
My environment:

SuSE - Linux 7.2
Kernel 2.4.16
samba 2.2.4
reiserfs-3.x.1b-32



-- 

SET THE CONTROLS 
	FOR THE HEART OF THE SUN

Jens
