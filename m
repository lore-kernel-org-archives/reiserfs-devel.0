From: "Roger James" <rogerjames99@btinternet.com>
Subject: Newbiw question on write barriers and ordered write barriers
Date: Mon, 1 Sep 2003 21:06:37 +0100
Message-ID: <000501c370c4$94165ba0$fe0aa8c0@lancaster.beardandsandals.co.uk>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0006_01C370CC.F5DC4A40"
Return-path: <reiserfs-list-return-15506-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_0006_01C370CC.F5DC4A40
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

 

Ever since I updated my SuSE Linux 8.1 set up with the latest patches
from SuSE I have been seeing the following messages at boot up time
(once only for each drive).

 

<4>hda: drive_cmd: status=0x51 { DriveReady SeekComplete Error }

<4>hda: drive_cmd: error=0x04 { DriveStatusError }

<4>hda:saw err in ide_end_drive_cmd, disabling write barriers

<4>hda: drive_cmd: status=0x51 { DriveReady SeekComplete Error }

<4>hda: drive_cmd: error=0x04 { DriveStatusError }

<4>hda:saw err in ide_end_drive_cmd, disabling write barriers

<4>reiserfs: using ordered data mode

<4>Using r5 hash to sort names

 

I have struggled to find out whether I should be worried about this. I
guess this is something to do with journaling and ordered writes, but
the messages are somewhat cryptic. Is this the kernel detecting a
problem with the drive based controllers (they are both Maxtor 6Y120L0s)
or the motherboard chipset (Nvidia NForce) and disabling the
functionality? I don't see the message again, but one of the reasons I
did upgrade the kernel was that I was having occasional disk
corruptions. Are there any switches/parameters I should be setting?

 

Can anyone give me a heads up on this.

 

Roger


------=_NextPart_000_0006_01C370CC.F5DC4A40--


