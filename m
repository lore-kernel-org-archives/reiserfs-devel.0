From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4: mount -o remount,ro / causes error on reboot
Date: Wed, 13 Sep 2006 14:49:05 +0400
Message-ID: <200609131449.05193.vs@namesys.com>
References: <ee1gcu$dgb$1@sea.gmane.org> <ee77ng$3o1$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29864-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ee77ng$3o1$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter <sw98234@hotmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Wednesday 13 September 2006 01:10, Peter wrote:
> On Sun, 10 Sep 2006 17:01:18 +0000, Peter wrote:
> all snip...
>
> To Vladimir and David:
>
> This appears to be a nasty gentoo issue. After perusing the forums and
> bugzilla, it appears that we are not alone in having difficulties with the
> baselayout. Nonetheless, as the reporter did, I downgraded baselayout from
> 1.12.4-r7-r7 to 1.11.15-r3 and the reboot problem I noted went away. It is
> interesting to note that it may be a C program startstop-daemon.c that may
> be the culprit. I don't expect much help from the gentoo devs since they
> won't support reiser4, but thought I would throw this out.
>
> Sorry to report this as an r4 bug, although it's interesting to note that
> the 1.12.4 baselayout did NOT cause this problem in reiserfs3.6
>

I still think that the problem is in reiser4. When the system fails on boot it 
usually outputs something which may help to understand the problem. Do you 
see anything like that on faulty startups? You can use either serial or 
network console to catch kernel output.
