From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: write barrier patches for 2.4.21
Date: Fri, 29 Aug 2003 03:56:08 +0200
Message-ID: <m33cfl9qh3.fsf@merlin.emma.line.org>
References: <20030825170849.GA14811@mfa.kfki.hu> <20030826214624.GA410@zero>
	<20030827064103.GA29131@namesys.com> <20030827220337.GB4886@zero>
	<1062031059.5324.111.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15488-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1062031059.5324.111.camel@tiny.suse.com> (Chris Mason's
 message of "27 Aug 2003 20:37:40 -0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Tom Vier <tmv@comcast.net>, Reiserfs List <reiserfs-list@namesys.com>

Chris Mason <mason@suse.com> writes:

> On Wed, 2003-08-27 at 18:03, Tom Vier wrote:
>> On Wed, Aug 27, 2003 at 10:41:03AM +0400, Oleg Drokin wrote:
>> > There was a discussion about that on Kernel Summit 2003 and general opinion was that SCSI
>> > does not need the WB stuff at all as it does the correct thing anyway.
>> 
>> i found this, but no real details. do you have a better link? or could you
>> tell me why scsi drives don't need wb's? afaik, they don't have nvram cache.
>> so, the danger is still there, even if small (unless i'm wrong).
>> 
>> http://lwn.net/Articles/40850/
>> 
>
> scsi drives don't really need them because most scsi drives don't have
> write back caching on by default,

They don't? That's not what I've seen on some of the recent drives I
bought. The OEM manuals should have details.

-- 
Matthias Andree

Encrypt your mail: my GnuPG key ID is 0x052E7D95
