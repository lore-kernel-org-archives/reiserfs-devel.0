From: Yiannis Mavroukakis <jander@darthvader.us>
Subject: mount issue with kernels >2.6.11
Date: Wed, 07 Sep 2005 13:24:16 +0100
Message-ID: <431EDBF0.3080701@darthvader.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25890-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

I'm running reiser4 on 2.6.11-mm4 at the moment. I compiled 2.6.13-mm1 
(and subsequently a few more kernel version in-between)  as a 
replacement, only to find out that it blows up in my face when the root 
fs is due to be mounted:

VFS: Cannot open root device "801" or unknown-block
Unable to mount root fs on unknown-block (8,1)

Now, I am not sure this is due to reiser4, I suspect some change in the 
LSI MegaRaid legacy driver
that may be the culprit, but I wanted the opinion of the list first, 
before I go crying to someone else :)

Thank you,

Yiannis.

______________________________________________________________________
This email has been scanned by the MessageLabs Email Security System.
For more information please visit http://www.messagelabs.com/email 
______________________________________________________________________
