From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: [Bug 14927] New: reiserfs: circular locking dependency
 detected
Date: Mon, 28 Dec 2009 19:28:04 -0800 (PST)
Message-ID: <alpine.DEB.2.01.0912281925100.3483@bogon.housecafe.de>
References: <bug-14927-695@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-14927-695@http.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: reiserfs-devel@vger.kernel.org

On Tue, 29 Dec 2009 at 00:31, bugzilla-daemon@bugzilla.kernel.org wrote:
> http://bugzilla.kernel.org/show_bug.cgi?id=14927

Thanks for tracking this, Rafael. I was planning to do this if I hear 
nothing back from reiserfs-devel. Also, I'm not sure this is a regression 
from 2.6.32, as I did not have LOCKDEP_* enabled in earlier kernels. I'll 
see if I can reproduce this with earlier kernels....

Christian.
-- 
BOFH excuse #134:

because of network lag due to too many people playing deathmatch
