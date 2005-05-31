From: Aaron Porter <atporter@lbl.gov>
Subject: reiser4 on large block devices
Date: Tue, 31 May 2005 11:42:41 -0700
Message-ID: <20050531184241.GJ30437@lbl.gov>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24245-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


	I'm trying to create a reiser4 filesystem on a ~4tb block device,
but I'm getting the error "Fatal: The partition size is too big." The FAQ
seems to list a max filesystem size of 16tb. Am I missing something?

diablo:~# mkreiser4 /dev/sda3
mkreiser4 1.0.4
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by 
reiser4progs/COPYING. 

Block size 4096 will be used.                                                 
Linux 2.6.11.8 is detected.                                                   
Uuid f22c4f94-4fcd-4655-b4e0-6665048db8ce will be used.                       
Fatal: The partition size is too big.                                         
Reiser4 is going to be created on /dev/sda3.                                  
(Yes/No): no
diablo:~#
