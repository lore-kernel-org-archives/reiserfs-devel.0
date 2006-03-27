From: Joe Feise <jfeise@feise.com>
Subject: Reiser4 crash 2.6.16-mm1
Date: Mon, 27 Mar 2006 13:41:32 -0800
Message-ID: <20060327214132.4074.qmail@pv105234.reshsg.uci.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28364-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi, 

I had an interesting crash on my 2.6.16-mm1 machine earlier today.
I usually mount /usr/local readonly:
/dev/sda6 on /usr/local type reiser4 (ro)
However, since I wanted to update a sw package, I remounted it r/w.
The installation of the sw package failed with reiser4 errors. Sorry, I 
don't have a dmesg output at this point, I'll send that tonight when I'm 
back at the machine.
But anyway, it reported index errors, and suggested running fsck.
I then ran an fsck.reiser4 --build-fs, which finished without reporting 
errors.
In further tests, I mounted /usr/local rw from the start, and saw the 
installation fail again. After that, /usr/local/lib was no longer 
accessible.
To me, this looks like corruption of some in-memory data structures.
Sorry to not be of more help wrt dmesg output. But I was hoping this is 
already known somewhere... 

 -Joe
