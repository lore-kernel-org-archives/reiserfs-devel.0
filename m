From: malcolm.agnew@t-online.de (Malcolm Agnew)
Subject: Re: A few questions of ReiserFS
Date: Fri, 7 Nov 2003 02:53:41 +0100
Message-ID: <200311070253.41040.malcolm.agnew@t-online.de>
References: <Pine.GSO.4.58.0311061302240.23244@bingsun2.cc.binghamton.edu> <20031106200657.GN11516@backtop.namesys.com>
Reply-To: malcolm.agnew@t-online.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16002-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031106200657.GN11516@backtop.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 06 November 2003 21:06, Alex Zarochentsev wrote:
 > On Thu, Nov 06, 2003 at 01:25:11PM -0500, Zhihui Zhang wrote:
....
....
>
> The design of two bitmaps was invented for keeping transactions separate
> even they alter one bitmap block.  For other blocks we have a rule that one
> block belongs only to one transaction.
>
If you had three bitmaps you could implement an undo.

Malcolm Agnew


