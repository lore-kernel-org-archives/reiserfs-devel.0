From: Grant Miner <mine0057@mrs.umn.edu>
Subject: testing/questions about latest Reiser4
Date: Sun, 04 Apr 2004 23:48:52 -0500
Message-ID: <4070E534.9010509@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17705-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Does Reiser4 store stat data in real files, or some special way?  Are 
pseudo files just representation of stat data stored a special way?  Is 
it possible to do streams/forks with a plugin easily?

I mounted latest Reiser4 snapshot + linux 2.6.4 with acl and xattr 
options but when I tried "getfattr" I received "operation not supported"?

I'm using Reiser4 as root fs for some days now, and it is great!  Only 
problem is whenever I run 'make' it always recompiles everything; 
perhaps this has to do with time stamps?  Oh and fibration is cool :) 
How do I switch to the other fibration plugins for a directory?
