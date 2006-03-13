From: John Gilmore <jgilmore@glycou.com>
Subject: Encryption/Compression and meta data (like file names)
Date: Mon, 13 Mar 2006 13:41:11 -0700
Message-ID: <200603131341.11327.jgilmore@glycou.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28245-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I seem to recall several people saying that the compression/encryption plugins 
will only encrypt items, and not the filesystems metadata. And then saying 
that this might be useless for their purposes, because being able to see the 
filename might be enough for the attacker.

However, I don't think that is correct. The only thing visible to an attacker 
would be the tree structure, not the item, which contains the directory 
information including the filenames.

So at most an attacker would be able to browse the tree structure, and see the 
keys used and the size of the item pointed to. If this is true, selection of 
a good hash should entirely prevent the giving information away problem, 
leaving only useless key->size->location data for an attacker.

Is my understanding correct?
