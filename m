From: Jared Warren <warren@cs.queensu.ca>
Subject: Recommended Journal Size for Small FS?
Date: Sat, 6 Mar 2004 18:35:15 -0500
Message-ID: <200403061835.15983.warren@cs.queensu.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17107-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

(Please excuse me if this has already been answered, I couldn't find anything 
pertinent in a brief archive search.)

I would like to use ReiserFS on my / filesystem, which includes bin, etc, lib, 
sbin, and root. Right now the files on that partition only take up 40 MB, so 
it seems like a 32 MB journal is overkill. Some comments I've read recommend 
using ext3 on small file systems because supposedly the journal is 
proportional (I have been unable to find out what proportion), however I 
trust I need not defend a preference for ReiserFS on this list. Can someone 
recommend a minimum journal size for, say, an 80 MB filesystem with 
infrequent and small writes?

Also, I'd like to confirm that 2.6.x kernels should be able to mount a fs with 
a resized journal as easily as one with the default size?
 
~ Jared Warren <warren@cs.queensu.ca>
Computing Science, Queen's University

