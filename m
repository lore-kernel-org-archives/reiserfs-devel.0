From: <doiggl@velocitynet.com.au>
Subject: Re: What can I do next to use R4 partition  sdb
Date: Tue, 24 Feb 2015 11:00:01 +1100
Message-ID: <11452a5895b13e048a9dfde9697daaaa@mail.velocitynet.com.au>
References: <114fff4391af47417e806586fb761345@mail.velocitynet.com.au> <24322648.R9GnluWRk3@intelfx-laptop> <423b30bd605b0d88aa19a88a74ca2940@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <423b30bd605b0d88aa19a88a74ca2940@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org, Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, Vladimir Shebordaev <vladimir.shebordaev@gmail.com>

Hello,
The reiser4/progs would have been one of the earlier versions from:

http://sourceforge.net/projects/reiser4/files/reiser4-utils/reiser4progs/

Edward indicated that:
This is a bug in fsck: it jumps to wrong branch for some reasons.
Not yet fixed.

Question:
- Is there a patch to fix "it jumps to wrong branch" problem.
I could apply that to reiser4progs-1.0.9 and see if that works on a 'dd'
image copy of the disk sdb first and use that to see what happens.

I have no experience with the debugging side though. 

--Glenn

References:
http://www.spinics.net/lists/reiserfs-devel/msg04662.html
http://www.spinics.net/lists/reiserfs-devel/msg04206.html
