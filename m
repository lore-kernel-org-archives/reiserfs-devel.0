From: Kevin <coggy@redefine.org>
Subject: Re: access beyond end of device again
Date: Tue, 25 Jun 2002 07:46:32 +0000 (UTC)
Message-ID: <0819468.20020627004746@redefine.org>
References: <Pine.LNX.4.44.0206250044360.28871-100000@avon.timetraveller.org>
 <661330051733.20020624103045@redefine.org> <20020625095409.A6209@namesys.com>
 <1141375583133.20020626230935@redefine.org> <20020625101503.A878@namesys.com>
Reply-To: Kevin <coggy@redefine.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10830-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020625101503.A878@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

> --fix-fixable can fix such errors. (it just zeroes offending pointers),
> It would be nice if you first run reiserfsck --check and show us the output,
> though. Because you may have other kinds corruptions as well.

> Bye,
>     Oleg

I put the log here as its somewhat long:
http://redefine.org/~coggy/hdi.txt

Maxtor diags found nothing wrong with the driver itself.

