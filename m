From: Oleg Drokin <green@namesys.com>
Subject: Re: fsck in background?
Date: Mon, 31 Mar 2003 21:27:40 +0400
Message-ID: <20030331212740.B10370@namesys.com>
References: <3E8818CD.1000500@dotcom.pl> <20030331144609.B1430@namesys.com> <3E88775F.5070302@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13492-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E88775F.5070302@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: myciel <myciel@dotcom.pl>, reiserfs-list@namesys.com

Hello!

On Mon, Mar 31, 2003 at 09:14:07PM +0400, Hans Reiser wrote:
> >>Yes, I know this sounds strange, but if one have 1T filesystem full of 
> >>small files,
> >>reiserfsck estimates duration to be of order of months,
> >We have a patch that significantly speeds things up.
> >In the similar case 28+ years estimated for pass 0 turned into 208 hours 
> >total
> As I said before, 208 hours is unacceptable and Vitaly needs to do more 
> work on it. If Vitaly doesn't know how to fix it, then I need to review 
> his algorithms in detail.

Well, we have identified some other bottlenecks, and Vitaly will work on those,
when we will fix current problems we are dealing with.

Bye,
    Oleg
