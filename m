From: Marcus Better <marcus@better.se>
Subject: Re: Partition full after deleting a large file
Date: Fri, 02 Feb 2007 12:25:09 +0100
Message-ID: <epv72l$e8n$1@sea.gmane.org>
References: <eptjl6$dd5$1@sea.gmane.org> <20070202083533.GA27851@cumulus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-list-return-30518-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Sander wrote:
> The .xsession-errors file is still open, and therefor not deleted from
> disk (although you can't see it anymore).

Oh, that explains it. Thanks!

> I think you should get your space back if you exit X.

I unmounted and then mounted the partition, which also solved it.

Thanks for you help,

Marcus


