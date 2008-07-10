From: validator <carlosemilio@hotmail.com>
Subject: What is fixable and what isn't? reiserfsck
Date: Thu, 10 Jul 2008 08:08:14 -0700 (PDT)
Message-ID: <18384832.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


Hello, I've benn trying to find a definition of a "fixable corruption" (or
minor corruption) versus a "non fixable" corruption. I just know that the
first kind can be fixed by using reiserfsck --fix-fixable and the second
kind with --rebuild-tree. I also know that there is a third type that
affects the superblock and that can be fixed with --rebuild-sb. Could
someone address me to a more technical definition of what is "fixable" and
what isn't.

Thanks.

-- 
View this message in context: http://www.nabble.com/What-is-fixable-and-what-isn%27t--reiserfsck-tp18384832p18384832.html
Sent from the ReiserFS - General mailing list archive at Nabble.com.

