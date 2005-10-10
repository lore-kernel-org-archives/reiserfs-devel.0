From: Yiannis Mavroukakis <jander@darthvader.us>
Subject: Reiser4 file recovery
Date: Mon, 10 Oct 2005 13:49:00 +0100
Message-ID: <434A633C.6030507@darthvader.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26444-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello :-)

I had an LVM setup of three disks, and one of them went belly 
up..Obvious thought is, use some
distro like R.I.P to reduce the volume to two disks and try and salvage 
what I could ..unfortunately reiser4 fsck could not find a superblock 
(surprise surprise the disk that died had it) nor could it build the FS 
because it cannot find the metadata..Under normal circumstances, I would 
not bother but my wife's mp3's are in those disks and she will have my 
head if I don't figure out some way to restore them :) Any suggestions?

Y.

______________________________________________________________________
This email has been scanned by the MessageLabs Email Security System.
For more information please visit http://www.messagelabs.com/email 
______________________________________________________________________
