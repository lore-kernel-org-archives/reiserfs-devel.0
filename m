From: PFC <lists@boutiquenumerique.com>
Subject: Re: [2.6 patch] fs/reiser4/: possible cleanups
Date: Sat, 29 Oct 2005 11:58:01 +0200
Message-ID: <op.szejazspth1vuj@localhost>
References: <20051028223547.GF4180@stusta.de> <df47b87a0510282058t37e8393o60e7f592ea5b19e5@mail.gmail.com> <20051029092250.GG4180@stusta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-26704-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051029092250.GG4180@stusta.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: reiserfs-list@namesys.com


	Remember my message where I said reiser4 was preventing my laptop from  
shutting down itself ?

	Well it turned out that, in fact, it was a stupid shfs-mount process  
which would refuse to die. Adding a "killall ssh" in the local.stop script  
is a bit violent, but perfectly functional way, to bring it back to  
reason. Everything now works.

	But still, I had to fsck --rebuild-tree just because my battery ran out...

