From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck  error
Date: Wed, 5 Jun 2002 09:41:38 +0400
Message-ID: <20020605094138.A15556@namesys.com>
References: <12761801616.20020604135440@redefine.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10512-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <12761801616.20020604135440@redefine.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin <coggy@redefine.org>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Jun 04, 2002 at 01:54:40PM -0700, Kevin wrote:
> Wondering if anyone has found out what causes this?

Yes, the cause is missing code to deal with such cases. Hence the assertion.
This problem is fixed in latest pre version of reiserfsprogs.

(ftp://namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.x.1c-pre4.tar.gz)

Bye,
    Oleg
