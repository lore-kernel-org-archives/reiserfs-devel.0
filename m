From: Tom Vier <tmv@comcast.net>
Subject: Re: $25 question - ReiserFS 3.6 data errors on 2.4.23
Date: Thu, 19 Feb 2004 20:41:53 -0500
Message-ID: <20040220014153.GB14838@zero>
References: <20040218093510.GD21098@backtop.namesys.com> <1077098911.5090.38.camel@tribesman.namesys.com> <c0verm$ps6$1@sea.gmane.org> <40336855.1030400@dsvr.net> <c0vpvs$lir$1@sea.gmane.org>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16863-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <c0vpvs$lir$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Wed, Feb 18, 2004 at 02:42:08PM +0100, Jens Benecke wrote:
> And we don't run reiserfsck at boot time, only manually. ("0 0" in fstab)

if it's done after it boots and it's been mounted rw, you could be reading
stale data.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0xE6CB97DA
