From: Hans Reiser <reiser@namesys.com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 08:40:51 -0800
Message-ID: <41D42F93.9060107@namesys.com>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>	<m38y7gx8kq.fsf@merlin.emma.line.org>	<20041230235911.4911a20c.hihone@bigpond.net.au> <m3sm5nj2ef.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22952-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3sm5nj2ef.fsf@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Cc: hihone@bigpond.net.au, reiserfs-list@namesys.com

Fixing hash collisions in V3 to do them the way V4 does them would 
create more bugs and user disruption than the current bug we have all 
lived with for 5 years until now.  If someone thinks it is a small 
change to fix it, send me a patch.  Better by far to fix bugs in V4, 
which is pretty stable these days.

Hans
