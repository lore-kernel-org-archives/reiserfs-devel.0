From: Chris Dukes <pakrat@www.uk.linux.org>
Subject: Re: Can ReiserFS solve this?
Date: Mon, 28 Apr 2003 15:52:25 +0100
Sender: <pakrat@www.linux.org.uk>
Message-ID: <20030428145225.GF665@parcelfarce.linux.theplanet.co.uk>
References: <3EAD34D5.8030108@solidcode.net> <20030428143231.GA11226@namesys.com> <200304281442.h3SEgVdA003758@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13866-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200304281442.h3SEgVdA003758@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: Oleg Drokin <green@namesys.com>, Erik Terpstra <erik@solidcode.net>, reiserfs-list@namesys.com

On Mon, Apr 28, 2003 at 10:42:30AM -0400, Valdis.Kletnieks@vt.edu wrote:
> 
> Oleg:  A very good solution, except there are chucklehead admins at the
> remote site that refuse to make changes to their end, and this solution
> would require a change at the remote end to do a FTP rename.. ;)

Technology is never a good solution to social problems.

As a gut feeling, I suspect that FTP is the wrong tool for the job.
Something like rsync would be a better choice.
If you must go with FTP, you might be able to peruse the logs for
truncated transfers.

-- 
Chris Dukes
I tried being reasonable once--I didn't like it.
