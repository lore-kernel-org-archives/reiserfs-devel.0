From: Oleg Drokin <green@namesys.com>
Subject: Re: About Reiser4 release date ...
Date: Fri, 30 May 2003 09:34:09 +0400
Message-ID: <20030530053409.GA26643@namesys.com>
References: <006101c32565$d0e837b0$b300a8c0@xpstation> <20030529132724.GA14458@namesys.com> <002b01c32619$57c4a990$b300a8c0@xpstation>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14324-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <002b01c32619$57c4a990$b300a8c0@xpstation>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fred -- Speed Up -- <speedup@free.fr>
Cc: ReiserFS ML <reiserfs-list@namesys.com>

He
llo!
On Thu, May 29, 2003 at 09:34:37PM +0200, Fred -- Speed Up -- wrote:

> I'd just like to ask you : when I download the whole bk tree, it takes about
> 400Mb for the kernel source & reiserprogs. I'd like to clean the bk files
> out, how can I do that ? I just need the source files that I can further
> compile, and do not care about all that bk stuff that takes too much room on
> my HD ;)

if you have local repository, you can do just that with
bk export -tplain destdir

Only you need full repository for that.

Bye,
    Oleg
