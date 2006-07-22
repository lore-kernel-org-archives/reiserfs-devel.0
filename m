From: =?windows-1250?Q?Maciej_So=B3tysiak?= <pysiak.satriani@wp.pl>
Subject: Re: reiser4 status (correction)
Date: Sat, 22 Jul 2006 22:07:54 +0200
Message-ID: <1081099469.20060722220754@wp.pl>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com> <44C093D2.1040703@namesys.com> <1153514509.6659.41.camel@ipso.snappymail.ca> <44C141C4.1030802@slaphack.com> <1153517853.6659.56.camel@ipso.snappymail.ca> <20060721222917.GA15944@wintermute> <44C1590E.7020401@slaphack.com> <20060721230654.GA17510@wintermute>
Reply-To: =?windows-1250?Q?Maciej_So=B3tysiak?= <pysiak.satriani@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29148-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060721230654.GA17510@wintermute>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello Andreas,

Saturday, July 22, 2006, 1:06:54 AM, you wrote:

> On 17:45 Fri 21 Jul     , David Masover wrote:
>> Question, then:  Can the ext2 defrag work on a raw ext3 partition, without having to convert it first?

> Dunno, but I don't think so
I tried that once, back in 2002 i think. defrag seemed doing things fine, but thrashed the
filesystem very badly. The good thing is, that I was able to fsck it and recover
most of my files. However it is not something you should try.

-- 
Best regards,
Maciej


