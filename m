From: Martin Gasthuber <Martin.Gasthuber@desy.de>
Subject: plugins - examples and (more) docs
Date: Sat, 25 Sep 2004 14:30:58 +0200
Message-ID: <41556502.6030505@desy.de>
Reply-To: Martin.Gasthuber@desy.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21917-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs-List@namesys.com

Hi,

   for our large storage system holding half a petabyte of experimental 
physics data, we are looking for a new nameservice implementation. 
Roughly this means - just store filenames in a hierarchical fashion (as 
usual) but only store metadata (from the other storage system components 
i.g. disk-cache and tape store) and no real data (this is in the cache - 
one or more times, and the 'real' copy is on tape). Right now we have a 
DB (simple key/value) system with a faked NFS server code on top.
While looking at other ways and making proof of concept implementation i 
'traped' into reiser4 with the important plugin feature. For our system 
we need 'unique + persistent' IDs for files with the ability to map in 
both directions (name -> id, id -> name), extended attributes and 
virtual files. From what i understand, reading the reiser4 docs i've 
found, all this should be feasible by creating new plugins for files and 
IDs. Because i like 'real' stuff - im' looking for plugin example code 
and more docs related to plugin creation and integration. Any idea where 
i can find that ???

Regards,
   Martin
