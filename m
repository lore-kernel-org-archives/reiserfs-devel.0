From: Julian Hall <jules@acris.co.uk>
Subject: Typo in reiserfsck
Date: Wed, 11 Dec 2002 17:00:35 +0000
Message-ID: <3DF76F33.2030101@acris.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12151-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

While rebuilding my file system's tree today, I noticed this message:

####### Pass 1 #######
Looking for allocable blocks .. fininshed

And a quick comment: the program doesn't really give much indication of 
how long rebuilding the tree will take.  When I started I certainly had 
no idea that it would take over 4 hours (it hasn't finished yet, but I 
think its getting close now...) to complete, and if I knew I would 
probably have left the operation until I had more time available. 
 Read-only access to the file system would have been useful, but 
unfortunately that option was not left open to me by the time I realised 
that the operation would take so long...


