From: Chris Mason <mason@suse.com>
Subject: Re: Fsck over Telnet is slow.
Date: 31 May 2002 08:21:40 -0400
Message-ID: <1022847700.22886.1683.camel@tiny>
References: <1073646515.20020531102130@tnonline.net> 
	<wv66147i4l.fsf@freeze.oslo.dnmi.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10466-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <wv66147i4l.fsf@freeze.oslo.dnmi.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Phillips <a.phillips@dnmi.no>
Cc: reiserfs-list@namesys.com

On Fri, 2002-05-31 at 05:59, Adrian Phillips wrote:
> >>>>> "Anders" == Anders Widman <andewid@tnonline.net> writes:
> 
>     Anders>    Is it just me, but I think reiserfsck is slow over
>     Anders> telnet, or even slower over ssh. It seems as it would be
>     Anders> better to not print the progress as fast, if the
>     Anders> connection to the terminal is slow.
> 
>     Anders>    Of course, I could use a log file instead.
> 
> Try with -q (I think) instead,

Yes, that works pretty well.  I use it over a serial console without
problems.

-chris


