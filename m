From: Dirk Mueller <dmuell@gmx.net>
Subject: Re: access beyond end of device again
Date: Mon, 24 Jun 2002 16:45:01 +0200
Message-ID: <20020624144501.GA28013@matrix.wg>
References: <1951319530634.20020624073524@redefine.org> <20020624183557.A2171@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10816-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020624183557.A2171@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, 24 Jun 2002, Oleg Drokin wrote:

> 
>    Do you get these during normal operations? 
>    Then it seems some of unformatted pointers were corrupted and you need
>    to run reiserfsck to clear these.

most lilely the partition is indeed to small (played with fsck lately ?)


Dirk
