From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Apache2 problems
Date: Mon, 9 Aug 2004 23:59:47 +0400
Message-ID: <20040809195947.GK9811@backtop.namesys.com>
References: <cd32a06204080910256de4cc0e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20106-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <cd32a06204080910256de4cc0e@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Lanyon <tomlanyon@gmail.com>
Cc: reiserfs-list@namesys.com

On Tue, Aug 10, 2004 at 02:55:55AM +0930, Tom Lanyon wrote:
> Hello,
> 
> Can someone please inform me of how to stop the dreaded sendfile
> issues while using reiser4 and apache2?
> 
> I just setup reiser4 on a nice new hard drive and tried to run apache2
> and ended up with many kernel panics and then the machine locked up.
> 
> I thought this issue was fixed in reiser4? If not, how can I go about
> stopping this from happening?

> This is reiser4-2004.07.23-19.37-linux-2.6.8-rc2-bk4.diff  on a
> 2.6.8-rc2 kernel.

it seems to me there is no reiser4-2004.07.23-19.37-linux-2.6.8-rc2-bk4.diff on
the namesys web site.

> I'm about to try the latest snapshot on a vanilla 2.6.8-rc3 and see if
> it helps..

the snapshot is for linux-2.6.8-rc2-mm2, not -rc2.
latest auto-snapshots is for linux-2.6.8-rc3-mm1

> Thanks for any help,
> Tom.

-- 
Alex.
