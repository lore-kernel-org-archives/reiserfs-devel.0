From: Ed Walker <ewalker@surfcity.net>
Subject: Fastest way to "find / -mtime +7".....
Date: Tue, 19 Jul 2005 10:55:42 -0700
Message-ID: <FD5AA849-D432-4881-B70F-E71369520749@surfcity.net>
Mime-Version: 1.0 (Apple Message framework v733)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25201-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: reiserfs-list@namesys.com

I've got a lot of small maildir files stored on a reiser-fs  
partition.  Currently we expire out the old stuff using
     find /mail -mtime +7 -type f -print0 | xargs -0 rm -rf

this is pretty slow on reiser, at least compared with ext2/3, and I  
understand that it may be because the find command returns the names  
in a non-optimal order (ie readdir order?).

Is there something we can do to speed it up?  Any suggestions?

Thanks-

Ed
