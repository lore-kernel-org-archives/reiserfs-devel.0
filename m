From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: 'let the hdd remap the bad blocks'
Date: Mon, 19 Aug 2002 18:23:52 +0200
Message-ID: <m3y9b2keav.fsf@merlin.emma.line.org>
References: <5.1.1.6.2.20020819155611.01ff7af0@pop.tvnet.hu>
	<20020819195906.A19984@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11245-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020819195906.A19984@namesys.com> (Oleg Drokin's message of
 "Mon, 19 Aug 2002 19:59:06 +0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Oleg Drokin <green@namesys.com> writes:

>    Basically uyou'd better search for this on HDD vendors sites.
>    What's going on is simply can be described this way:
>    You write some block to HDD, if HDD decides the block is bad for some reason
>    and remapping is allowed (usually by tiurning on SMART), block is written to
>    different on-platter location and drive adds one more entry to its
>    remaped-blocks list. Next time you read this block, drive consults its
>    remapped blocks list and if block is remapped, reads it from new location
>    with correct content.
>    Described mechanism works for writing.
>    Actually I've seen something that looks like remapping on read, though 
>    I have no meaningful explanation for that (except that they may have some
>    extra redundant info stored when you write data to disk, so that if sector
>    cannot be read, its content is restored with that redundant information and
>    sector is then remapped.). And this process takes a lot of time.

My Fujitsu MAH-3182MP drive (SCSI actually) had ARRE enabled as it
shipped, but ARWE disabled, for reasons I cannot tell, not even from the
data book (PDF). That's Automatic Remap on Read/Write Error. I'm not
sure what it really means, but if the drive really remaps on a read
error, it's going to leak a block at power loss while it is amidst a
block write the next time this block is read. So I switched that to do
ARWE. IDE users are not too lucky unless their vendor provides them with
a tool (and not many ship raw floppy images, many have some multi-MB
Windoze tools just to write some hundred kByte to a floppy disk...)

-- 
Matthias Andree
