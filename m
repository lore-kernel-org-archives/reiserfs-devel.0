From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 17:51:35 +0100
Message-ID: <20041230165135.GA14103@merlin.emma.line.org>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local> <m38y7gx8kq.fsf@merlin.emma.line.org> <20041230235911.4911a20c.hihone@bigpond.net.au> <m3sm5nj2ef.fsf@merlin.emma.line.org> <41D42F93.9060107@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22953-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41D42F93.9060107@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Thu, 30 Dec 2004, Hans Reiser wrote:

> Fixing hash collisions in V3 to do them the way V4 does them would 
> create more bugs and user disruption than the current bug we have all 
> lived with for 5 years until now.  If someone thinks it is a small 
> change to fix it, send me a patch.  Better by far to fix bugs in V4, 
> which is pretty stable these days.

Better to fix a known bug than create a file system vacuum before V4 is
really stable.

Anyways, I don't care any more, I'm phasing out ReiserFS v3 and have no
plans to try V4 before 2006.

-- 
Matthias Andree
