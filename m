From: Nathan Scott <nathans@sgi.com>
Subject: Re: XFS corruption during power-blackout
Date: Thu, 30 Jun 2005 07:10:28 +1000
Message-ID: <20050630071027.A2559808@wobbly.melbourne.sgi.com>
References: <20050629001847.GB850@frodo> <200506290453.HAA14576@raad.intranet> <556815.441dd7d1ebc32b4a80e049e0ddca5d18e872c6e8a722b2aefa7525e9504533049d801014.ANY@taniwha.stupidest.org> <42C2E0BC.8040508@xfs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24814-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <42C2E0BC.8040508@xfs.org>; from lord@xfs.org on Wed, Jun 29, 2005 at 12:56:12PM -0500
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Lord <lord@xfs.org>
Cc: Chris Wedgwood <cw@f00f.org>, Al Boldi <a1426z@gawab.com>, linux-xfs@oss.sgi.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

On Wed, Jun 29, 2005 at 12:56:12PM -0500, Steve Lord wrote:
> I did spend a bunch of time once ensuring that when you typed
> sync on xfs you could pull the power right after that and
> everything from before the sync survived. There have been a
> lot of changes both in xfs and the surrounding kernel since
> then. I do not know if anyone has attempted this effort
> again recently.

Yep, someone has, a number of times.  And as Homer would say
"its still good!".

cheers.

-- 
Nathan
