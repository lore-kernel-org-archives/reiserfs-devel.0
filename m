From: Cyrille Chepelov <cyrille@chepelov.org>
Subject: FIFO files
Date: Tue, 17 Jun 2003 18:21:27 +0200
Message-ID: <20030617162127.GA14124@chepelov.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14583-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi all,

I recently encountered a need for such a contraption as file-backed FIFOs.
These are files where one process can append records at one end, and one
other process can read records from the beginning of the file, chopping off
the head of the file once it's not needed anymore. As I had to implement
something right now on existing systems, I worked around the general absence
for such a facility, but still, I'm wondering how difficult it would to
write a reiserfs4 plug-in which would allow one to do the equivalent of a
truncate() but truncating what's between the position 0 and the current
cursor (effectively shifting all subsequent file positions), rather than
truncating what's between the cursor and the end of file.
(network considerations are explicitly out of the scope of this musing)

	-- Cyrille

-- 
