From: Michael Carmack <karmak@karmak.org>
Subject: Benchmarks from Guru Labs
Date: Thu, 18 Jul 2002 11:53:27 +0000
Message-ID: <20020718115327.GE3841@ariel.karmak.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11043-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


I didn't see any mention of this in the archives. There are some
ReiserFS benchmarks at

    http://www.gurulabs.com/ext3-reiserfs.html

The first set of tests (for small files) show a significant performance
advantage with 'notail' turned on. Assuming disk space is not an issue,
are there any performance advantages to 'notail' that are not reflected
in these tests?

Also, can anyone comment on why Ext3 has a significant edge over ReiserFS
in the small-file tests, but the situation reverses as file-size 
increases? There's not much commentary in the article.

m.


