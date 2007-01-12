From: Eriberto <eriberto@eriberto.pro.br>
Subject: Re: tail packing don't works with tails
Date: Fri, 12 Jan 2007 07:22:46 -0200
Message-ID: <eo7k16$cvv$1@sea.gmane.org>
References: <eo6puj$eao$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30375-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <eo6puj$eao$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

A mistake in:

Eriberto escreveu:
> I think a file with 5 KB must occupy one block only (4 KB) and 3 KB must
> be put in the BTree. I would like to know if I am right.

The correct is:

I think a file with 5 KB must occupy one block only (4 KB) and 1 KB must
be put in the BTree. I would like to know if I am right.

Thanks

