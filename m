From: Viktors Rotanovs <viktors@rotanovs.com>
Subject: filesystem <-> database
Date: Mon, 12 Jan 2004 23:33:38 +0200
Message-ID: <400312B2.9040301@rotanovs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16464-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

I recently converted filesystem (reiser3.6) containing lots of small 
files (400000 files, about 10 bytes each, Cyrus IMAP quota files) to CDB 
database format (http://cr.yp.to/cdb.html plus some patching to make it 
read-write), thus gaining significant performance improvement (load avg 
was 5, became 3).
What is the best way to do the same for other similar small files, using 
Reiser4? As far as I can understand, I could:
1) just put everything on Reiser4, with no changes
2) write some plugin for Reiser4
Is it possible to reduce file size on disk by not saving file ownership, 
modification time, etc.?
How much kernel's VFS interface, switching to kernel and back, directory 
caching, etc. does slow down these operations?

Best Wishes,
Viktors



