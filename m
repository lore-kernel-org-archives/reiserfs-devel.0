From: Hans Reiser <reiser@namesys.com>
Subject: Using symlinks to implement views
Date: Wed, 27 Apr 2005 07:05:28 -0700
Message-ID: <426F9C28.60405@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23927-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nate Diller <ndiller@namesys.com>, Reiserfs List <reiserfs-list@namesys.com>
Cc: Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>

I propose that if a mask contains a symlink, that it be a fallthru to 
where the link points to, and that it transform the name being looked up 
in the manner usual for symlinks that are followed.

I believe the result will be a small amount of code, and it will 
effectively implement views.  Am I right?  If yes, send me back a more 
rigorous definition for it so that I can confirm I was understood.

Hans
