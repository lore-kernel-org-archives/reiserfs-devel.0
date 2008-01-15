From: butdiene <butdiene@yahoo.com>
Subject: Re: reiser4 panicked with zam-42245
Date: Tue, 15 Jan 2008 10:58:38 -0800 (PST)
Message-ID: <14844935.post@talk.nabble.com>
References: <14811158.post@talk.nabble.com> <1200354983.31588.13.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1200354983.31588.13.camel@localhost>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


yes, you must be right. I had reiser4 debug option enabled in kernel config.
and it happens only after I enabled it.

I wasn't happy with reiser4 so far. 

1st, after crashes, fsck.reiser4 always found lost+found, while I hoped
transaction support would result in a crash resilient fs.

I couldn't get get rid of the firefox hang problem. whenever "sync" issued,
the hdd spins for long and firefox hangs. this results in a rather slow fs.

now I have switched back to jfs. it's incredibly fast compared with what I
experienced with reiser4.

thanks a lot!
 

Jake Maciejewski wrote:
> 
> On Mon, 2008-01-14 at 11:43 -0800, butdiene wrote:
>> I got this error message reproducibly when building kernel (make).  I
>> don't
>> have the log file since kernel hangs thereafter
>> 
>> it happens only on my laptop but not to several other reiser4 boxes.
>> 
>> Thanks!
> 
> Are you sure it wasn't 32245? That's the one I get compiling. If I
> disable debug, I don't see it, and reiser4 seems completely stable. With
> debug enabled, I always hit zam-32245 eventually.
> 
> -- 
> Jake Maciejewski <maciejej@msoe.edu>
> 
> -
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

-- 
View this message in context: http://www.nabble.com/reiser4-panicked-with-zam-42245-tp14811158p14844935.html
Sent from the ReiserFS - General mailing list archive at Nabble.com.

