From: Oleg Drokin <green@namesys.com>
Subject: Re: Will Reisefs have "undo"?
Date: Mon, 16 Jun 2003 10:39:32 +0400
Message-ID: <20030616063932.GB12592@namesys.com>
References: <1055615895.698.129.camel@localhost> <000d01c332ac$a94e23a0$0200a8c0@xpstation> <1055670615.671.106.camel@localhost> <200306151409.41970.d.nuetzel@wearabrain.de> <1055705365.24613.15.camel@Thief>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14554-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1055705365.24613.15.camel@Thief>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Malinovich <demonbane@the-love-shack.net>
Cc: ReiserFS ML <reiserfs-list@namesys.com>

Hello!

On Sun, Jun 15, 2003 at 02:29:26PM -0500, Alex Malinovich wrote:

> I don't think snapshots are really needed. I would be perfectly content
> with a "semi-intelligent" filesystem that would mark files as deleted in
> the journal while leaving the file intact on the HD. As soon as the file
> has actually been overwritten, it is marked "purged" and cannot be
> recovered. But up to that point, it would be a relatively simple task to
> just tell the journal to mark the file as not-deleted again.

Hm. You seem to confuse journal with log of operations.
The journal just holds copies of the blocks we are going to overwrite
to achieve atomic block overwrite. So we cannot mark something "deleted in journal".

Bye,
    Oleg
