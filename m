From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Apache2 problems
Date: Tue, 10 Aug 2004 15:31:21 +0400
Message-ID: <20040810113120.GP9811@backtop.namesys.com>
References: <cd32a06204080910256de4cc0e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20119-reiserfs=m.gmane.org@namesys.com>
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

I used ab2 test tool, apache2 from SuSE9.1 and the latest reiser4 code.
It works fine for me.

> 
> I thought this issue was fixed in reiser4? If not, how can I go about
> stopping this from happening?
> 
> This is reiser4-2004.07.23-19.37-linux-2.6.8-rc2-bk4.diff  on a
> 2.6.8-rc2 kernel.
> I'm about to try the latest snapshot on a vanilla 2.6.8-rc3 and see if
> it helps..
> 
> 
> Thanks for any help,
> 
> Tom.

-- 
Alex.
