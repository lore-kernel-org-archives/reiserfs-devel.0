From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Working Reiser4 patch for kernel 2.6.6(-mm2)?
Date: Wed, 2 Jun 2004 19:23:48 +0300
Message-ID: <20040602162348.GH4990@nysv.org>
References: <200406021554.11690.rmeijer@internet.gr> <20040602125602.GC8091@backtop.namesys.com> <200406021603.46918.rmeijer@internet.gr> <20040602160234.GF8091@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18975-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040602160234.GF8091@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Zarochentsev <zam@namesys.com>
Cc: "Raymond A. Meijer" <rmeijer@internet.gr>, reiserfs-list@namesys.com

On Wed, Jun 02, 2004 at 08:02:34PM +0400, Alex Zarochentsev wrote:
>> But there was a kernel Oops and something like:
>> "page_extent: trying to read past end of device. Want=23252123 Limit=83380"
>It would be fine to see a (decoded) stack trace.

Not that I would have had this problem, but are there some general
guidelines/FAQ-like answer on how to acquire this?

>> I can try again and write down the messages if you want...
>Does the snapshot from 2004.04.21 or from 2004.03.26 work still ?

It's against 2.6.5, not 2.6.6, and I think that was the general idea...

-- 
mjt

