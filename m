From: David <lists@edeca.net>
Subject: --rebuild-tree with no free space and not an md
Date: Mon, 11 Dec 2006 14:00:20 +0000
Message-ID: <20061211140020.p1ifuqdeb4o8sgcg@my.pengus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30313-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

I have a problem very similar to the thread below.  A runaway file  
filled my disk, my machine became unresponsive and then I needed to do  
a --rebuild-tree (as instructed by --check in the init script).

http://marc.theaimsgroup.com/?l=reiserfs&m=115830875615699&w=2

However, I'm not using md or LVM so I cannot grow the underlying  
partition.  It is possible that I will be able to get a bigger disk  
and dd (or ddrescue) an image onto it.  However, will I be able to  
"add" space to the image in order that --rebuild-tree can succeed?

I don't particularly care about shrinking it again after or copying it  
back to the original disk, if I can save (some of) the files off of  
the disk I will be very happy.

I cannot at present mount it and remove a file (though there are  
plenty which I don't need that would free up space) because it  
refuses, due to the failed --rebuild-tree.

Thanks,

David
