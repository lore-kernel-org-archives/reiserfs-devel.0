From: Pallavi Dalya <pallavidalya@yahoo.com>
Subject: in reiser4 can extent pointer exist at any level
Date: Thu, 20 Jan 2005 17:18:34 +0000 (GMT)
Message-ID: <20050120171834.54511.qmail@web60108.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-23181-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

      In reiser4 only the node pointer items are
present throughout the tree except for the leaves of
the tree and the other items like the tail policy
item,directory entry items and stat data items are
present in the leaf nodes.
      But recently I came accross a extent pointer
present in the root of the tree in reiser4. Is this
possible.
      But according to the theory all the data should
be present at the lower level (i.e the leaf level) of
the tree. Then how can an extent pointer exist at any
level but the leaf of the tree.

Pallavi
 

________________________________________________________________________
Yahoo! Messenger - Communicate instantly..."Ping" 
your friends today! Download Messenger Now 
http://uk.messenger.yahoo.com/download/index.html
