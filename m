From: Hans Reiser <reiser@namesys.com>
Subject: Re: Atomic filesystem or not
Date: Thu, 15 Jul 2004 12:52:11 -0700
Message-ID: <40F6E06B.1080505@namesys.com>
References: <200407151434.23082.marcel@hilzinger.hu> <200407151354.47063.ctpm@ist.utl.pt> <40F6DE4A.2070103@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19647-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40F6DE4A.2070103@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Claudio Martins <ctpm@ist.utl.pt>, reiserfs-list@namesys.com, Marcel Hilzinger <marcel@hilzinger.hu>

David Masover wrote:

>
> doing atomic operations -- because a system call named "reiser4"

Maybe I should call it sys_reiser and not sys_reiser4? ;-) What about 
the name is not portable? ;-)

> is not
> portable to other filesystems. For instance, I believe someone's done a
> filesystem based on MySQL, which has atomic operations -- but would
> probably want a whole different interface for doing them.
>
> If such a library were developed, and had at least one stable backend
> (reiser4), then I think it'd be very likely for standard utils such as
> 'cp' to support it.
>
>
>
