From: Tom Vier <tmv@comcast.net>
Subject: Re: reiser4 data journalling?
Date: Thu, 28 Aug 2003 20:18:14 -0400
Message-ID: <20030829001814.GB9019@zero>
References: <3F4E3AF9.2060100@tupshin.com> <16206.16138.72832.920045@laputa.namesys.com> <3F4E6AA4.3030900@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15481-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F4E6AA4.3030900@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs List <reiserfs-list@namesys.com>

On Fri, Aug 29, 2003 at 12:48:36AM +0400, Hans Reiser wrote:
> full data journaling means that if you perform writes that are 4k or 
> less, and page align them, they will be performed atomically. 

would it be much more difficult to allow non-page aligned bufs to be written
atomically? a fully atomic fs would be very nice. otherwise, a lot of utils
and shell builtins would have to be modded to insure page alignment. it
would be neat if all the regular builtins (cp, mv, ln) were atomic. of
course, even neater would be the ability to group multiple ops into one
atomic action. (this is probably already planned - it's been a while since i
read the reiserfs4 paper on the namesys site.)

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
