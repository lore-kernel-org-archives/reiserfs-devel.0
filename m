From: Hans Reiser <reiser@namesys.com>
Subject: I think your dynamic bitmap loading code should go in
Date: Tue, 20 Sep 2005 20:13:59 -0700
Message-ID: <4330CFF7.9090900@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26189-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>, Andrew Morton <akpm@osdl.org>

I have been thinking about it for quite a while, and while I would be
interested in seeing if it was still needed after the elevator code gets
fixed to not congest, it should go in until then.

Hans
