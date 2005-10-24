From: John Gilmore <jgilmore@glycou.com>
Subject: Re: Reiser4 documentation & specifically current status of repacker, compression, and semantics
Date: Mon, 24 Oct 2005 12:25:45 +0000
Message-ID: <200510241225.45686.jgilmore@glycou.com>
References: <200510231850.45209.jgilmore@glycou.com> <435CF334.9040805@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26612-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <435CF334.9040805@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 24 October 2005 14:44, Edward Shishkin wrote:
> John Gilmore wrote:
> >There is a 'compress' directory in in my reiser4 source tree. So is the
> >compression plugin done? Is my disk/files compressed?
>
> not yet,
> this is under construction..
>
> > And if it was/wasn't
> >how would I know the difference, and change it?
>
> I guess reiser4progs will be able to dump the attributes then
>
> Edward.
I thought the ability to muck around with the plugins assigned to  a 
particular file was implemented as file-as-directory? I've tried to re-enable 
that ability, but haven't been able to get it to work. How are plugin/file 
relationships handled without it?
