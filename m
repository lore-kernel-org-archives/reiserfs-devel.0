From: Oleg Drokin <green@namesys.com>
Subject: Re: How to break a reiserfs on Linux 2.4.20
Date: Tue, 14 Jan 2003 20:53:22 +0300
Message-ID: <20030114205322.A19107@namesys.com>
References: <avprcs$bfi$1@satsuki.furryterror.org> <b01ff1$sp0$1@genki.hungrycats.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12340-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <b01ff1$sp0$1@genki.hungrycats.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Jan 14, 2003 at 04:56:01PM +0000, Zygo Blaxell wrote:

> rm and occasionally cp will frequently complain about "No such file
> or directory".  This is normal.  After about 3 hours, the following
> non-normal messages appear:

Are these normal too?
building file list ... building file list ... building file list ... done
mkdir foo/var/. : No such file or directory (1)
unexpected EOF in read_timeout
done
mkdir foo/etc/. : No such file or directory (1)
unexpected EOF in read_timeout
done
mkdir foo/usr/. : No such file or directory (1)
unexpected EOF in read_timeout

If they are normal, then I am going to wait for a few hours ;)

Bye,
    Oleg
