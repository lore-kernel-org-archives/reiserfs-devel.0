From: Chris Wedgwood <cw@f00f.org>
Subject: Re: XFS corruption during power-blackout
Date: Wed, 29 Jun 2005 10:02:09 -0700
Message-ID: <556815.441dd7d1ebc32b4a80e049e0ddca5d18e872c6e8a722b2aefa7525e9504533049d801014.ANY@taniwha.stupidest.org>
References: <20050629001847.GB850@frodo> <200506290453.HAA14576@raad.intranet>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24801-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200506290453.HAA14576@raad.intranet>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Boldi <a1426z@gawab.com>
Cc: 'Nathan Scott' <nathans@sgi.com>, linux-xfs@oss.sgi.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

On Wed, Jun 29, 2005 at 07:53:09AM +0300, Al Boldi wrote:

> What I found were 4 things in the dest dir:
> 1. Missing Dirs,Files. That's OK.
> 2. Files of size 0. That's acceptable.
> 3. Corrupted Files. That's unacceptable.
> 4. Corrupted Files with original fingerprint. That's ABSOLUTELY
> unacceptable.

disk usually default to caching these days and can lose data as a
result, disable that
