From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: reiserfs partition unmountable
Date: Mon, 4 Apr 2005 15:54:16 +0400
Message-ID: <20050404115415.GC6211@backtop.namesys.com>
References: <1112453207.7750.0.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23770-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1112453207.7750.0.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Segelken <lars.segelken@web.de>
Cc: reiserfs-list@namesys.com

On Sat, Apr 02, 2005 at 04:46:47PM +0200, Lars Segelken wrote:
> Hi,
> i have a reiserfs partition which can't be mounted under Suse 9.2 and
> Unbuntu 5.04 (Linux 2.6.8 and 2.6.10, i think) after there was a system
> crash.
> Same partition can still be mounted with Knoppix 3.2.

what kernel used by Knoppix 3.2?

can you send here output of debugreiserfs -J /dev/<the device>
?

-- 
Alex.
