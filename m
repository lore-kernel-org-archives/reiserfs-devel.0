From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: Bad blocks
Date: Tue, 16 Apr 2002 13:43:04 +0200
Message-ID: <m3pu0z3m47.fsf@merlin.emma.line.org>
References: <E16xHXa-0000Mh-00@hoffman.vilain.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10077-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <E16xHXa-0000Mh-00@hoffman.vilain.net> (Sam Vilain's message of
 "Tue, 16 Apr 2002 02:13:50 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Sam Vilain <sam@vilain.net> writes:

> How can I deal with this?  If anyone knows of a tool to re-format just
> 8 sectors (to let the disk re-map the blocks elsewhere), that also
> would be helpful.

Manufacturers may have these tools, but some do a full low-level
format. Usually, writing the bad blocks will make the drive remap them
if it has spare sectors left to remap to.

-- 
Matthias Andree
