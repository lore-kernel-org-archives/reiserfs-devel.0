From: Hans Reiser <reiser@namesys.com>
Subject: precise characterization of ext3 atomicity
Date: Thu, 04 Sep 2003 18:20:57 +0400
Message-ID: <3F574A49.7040900@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15548-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS <reiserfs-list@namesys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Is it correct to say of ext3 that it guarantees and only guarantees 
atomicity of writes that do not cross page boundaries?

I am trying to define the difference between "Atomic Reiser4" and ext3, 
as it seems to be a frequently asked question, and I am thinking of 
saying something like:

    Reiser4 allows you to define a set of up to A separate arbitrary 
filesystem operations (where A by default is not allowed to exceed 64) 
that are to be committed to disk atomically.  Every individual 
filesystem operation is atomic without the need to specify it.

    By contrast, ext3 only guarantees the atomicity of a single write 
that does not span a page boundary, and it guarantees that its internal 
metadata will not be corrupted even if your applications data is 
corrupted after the crash.

-- 
Hans


