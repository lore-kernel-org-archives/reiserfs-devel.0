From: Oleg Drokin <green@namesys.com>
Subject: Re: Feature request: online fsync disable
Date: Fri, 23 Aug 2002 15:56:58 +0400
Message-ID: <20020823155658.A962@namesys.com>
References: <3D661C89.C8A805D7@baldauf.org> <15718.8710.244926.960377@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11310-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <15718.8710.244926.960377@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Xuan Baldauf <xuan--reiserfs@baldauf.org>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello!

On Fri, Aug 23, 2002 at 03:52:38PM +0400, Nikita Danilov wrote:
>  > I have a server running which sometimes gets very busy. The
>  > running application issues lots of fsync() calls. If it gets
>  > very busy, it sometimes is not as fast as required. I
>  > believe that most of the time is spent in processing fsync()
>  > (commit journal, etc.). In such a situation, I'd like to
>  > switch off all fsync()s and risk data loss instead of hours
>  > of processing time, which in my case is more important.
>  > 
>  > Is implementing such a feature possible? It may be used as
>  > follows:
>  > 
>  > mount /partition -o remount,disableFsync
>  > 
>  > and undone as follows:
>  > 
>  > mount /partition -o remount,enableFsync
> I don't know your particulars, but one way to do such thing is to write
> small shared library implementing no-op fsync() function and to use
> LD_PRELOAD.

Also there is http://namesys.com/support.html page that describes how one
can get NAMESYS to write virtually any reiserfs feature ;)

Bye,
    Oleg
