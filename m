From: Chris Mason <mason@suse.com>
Subject: Re: data-logging & -pre-20+  merge?!
Date: 03 Sep 2002 07:45:50 -0400
Message-ID: <1031053550.1684.17.camel@tiny>
References: <3D745EA6.1050501@mb.tu-ilmenau.de>
	<20020903111448.A1649@namesys.com> <3D747166.1060105@mb.tu-ilmenau.de> 
	<3D74865E.3020704@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11362-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D74865E.3020704@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, Oleg Drokin <green@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>

On Tue, 2002-09-03 at 05:52, Hans Reiser wrote:
> Well, I had hoped that Chris would do the merge, but if we can't get 
> Chris to do the merge (it may be that he is extremely busy right now) 
> then I guess Oleg will do it.  I agree that the patches are needed urgently.

The merge was pending resolution of a data=ordered + direct io bug I
found last week.  I had been trying to find a clever resolution, but
they are all too expensive in either CPU time or memory given that
almost nobody wants direct io and data=ordered at the same time.

So, I'm back to working on the merge with direct io disabled when
data=ordered is on.  The port to 2.5 won't have this problem.

-chris

