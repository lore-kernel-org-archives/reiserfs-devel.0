From: Oleg Drokin <green@namesys.com>
Subject: Re: quotas in 2.4.20
Date: Tue, 3 Dec 2002 12:48:10 +0300
Message-ID: <20021203124810.A13658@namesys.com>
References: <01ca01c29a58$4784a4b0$4902a8c0@consensys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12087-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <01ca01c29a58$4784a4b0$4902a8c0@consensys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Zebchuk <jason@consensys.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Dec 02, 2002 at 06:12:25PM -0500, Jason Zebchuk wrote:
> I was trying to apply the reiserfs-quota-22 patch to a 2.4.20 kernel and it
> didn't work.  I tried to find out why failed, and to see if I could fix the
> problem, but it seems that significant changes were made to the file
> bitmap.c .  I couldn't even find some of the functions that were being
> patched.
> Does the 2.4.20 kernel require this patch, or a similar one to work with
> quota's?  Will such a patch me made?

I have a testing version available at
ftp://namesys.com/pub/reiserfs-for-2.4/testing/quota-2.4.20

You can try it and report to me if it breaks (but I hope it won't)

Bye,
    Oleg
