From: Kristian Koehntopp <kris@xn--khntopp-90a.de>
Subject: Hard errors, trying to recover
Date: Tue, 29 Jun 2004 21:39:43 +0200
Message-ID: <20040629193943.GA15481@p15104972.pureserver.info>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19447-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


I have a 160 GB disk that has at least one hard read-error.

I tried reiserfsck'ing that disk, in order to salvage data on that disk by
copying it to a safe location one last time. Unfortunately, reiserfsck
--rebuild-tree runs into that read-error and stops, lecturing me on disk
quality (I knew that!). Now I cannot even mount that disk, because
reiserfsck zeroed root block 0 during the rebuild-tree.

I am at the moment dd'ing that disk with conv=noerrors, hoping that I will
get an image (which will be truncated by 4 GB, because my scratch disk is
somewhat smaller than the source disk). I tried to reiserfsck --rebuild-tree
the partial image, but I reiserfsck breaks down, because it is unable to
read the last block of the images (it is a partial image).

What can I do to salvage the data on my broken disk?

Kristian
