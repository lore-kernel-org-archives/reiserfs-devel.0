From: Tom Vier <tmv@comcast.net>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Wed, 5 Jul 2006 10:42:41 -0400
Message-ID: <20060705144241.GA26588@zero>
References: <1151602916.32453.40.camel@ipso.snappymail.ca> <1151608355.6335.79.camel@tribesman.namesys.com> <1151612146.11510.4.camel@ipso.snappymail.ca> <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com> <1152059846.30139.11.camel@ipso.snappymail.ca> <44AB25EE.8030702@namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28913-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44AB25EE.8030702@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Tue, Jul 04, 2006 at 07:37:34PM -0700, Hans Reiser wrote:
> Mike, thanks so much for going to this much effort.  It is rather likely
> this is a problem affecting many users.

Last weekend, i accidentally filled my /. I noticed when i heard the drives
(it's a 2 drive raid 0) thrashing. I didn't watch the cpu load, which may've
been high, but it seemed to be io bound.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
