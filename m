From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 11:22:46 +0100
Message-ID: <m3brccxeyx.fsf@merlin.emma.line.org>
References: <20041228221218.GA6412@schmorp.de>
	<20041229185529.GA7513@hello-penguin.com>
	<41D31C22.9060400@namesys.com> <20041229214324.GA5206@schmorp.de>
	<41D36287.4080900@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22944-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41D36287.4080900@namesys.com> (Hans Reiser's message of "Wed, 29
	Dec 2004 18:05:59 -0800")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, Stefan Traby <stefan@hello-penguin.com>

Hans Reiser <reiser@namesys.com> writes:

>>Again, this is a lame excuse for a bug. First you declare some features on
>>your filesystem, later, when it turns out that it isn't being delivered,
>>you act as if this were a known condition.
>>
> Well this is true, you are right.  Reiser4 is the fix though.

No, it isn't. Reiser4 is an alternative beast. Or will it transparently
"fix" the collision problem in a 3.5 or 3.6 file system, in a way that
is backwards compatible with 3.6 drivers? If not, please fix reiser3.6.

Given that Reiser4 isn't "proven" yet in the field (for that, it would
have to be used as the default file system by at least one major
distributor for at least a year), it is certainly not an option for
servers _yet_.

A file system that intransparently (i. e. not inode count or block
count) refuses to create a new file doesn't belong on _my_ production
machines, which shall migrate away from reiserfs on the next suitable
occasion (such as upgrades). There's ext3fs, jfs, xfs, and in 2006 or
2007, we'll talk about reiser4 again. Yes, I am conservative WRT file
systems and storage.

-- 
Matthias Andree
