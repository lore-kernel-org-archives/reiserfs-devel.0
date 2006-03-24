From: Andreas =?iso-8859-1?Q?Sch=E4fer?= <gentryx@gmx.de>
Subject: Re: lost partition table
Date: Fri, 24 Mar 2006 16:28:47 +0100
Message-ID: <20060324152847.GB5286@wintermute>
References: <1142439481.27675.ezmlm@namesys.com> <20060324135549.GB13979@raven.londonmet.ac.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28337-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060324135549.GB13979@raven.londonmet.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ild0012@raven.londonmet.ac.uk
Cc: reiserfs-list@namesys.com

Hi

On 13:55 Fri 24 Mar     , ild0012@raven.londonmet.ac.uk wrote:
> now the question is how to recover that file ?

I had a similar problem. For me TestDisk saved the day. It can recover
most, if not all, partitions even without the partition table:

  http://www.cgsecurity.org/wiki/TestDisk

Last update was March 2nd. Really a great tool.

Hope this helps
-Andreas

ps: anyway, you do have a backup, don't you? If not, none of the data
is vital, right?
