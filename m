From: Hans Reiser <reiser@namesys.com>
Subject: Re: Mounting reiserfs with nonstandard journal size
 fails
Date: Thu, 31 Oct 2002 00:29:29 +0300
Message-ID: <3DC04F39.1030709@namesys.com>
References: <1035934581.1487.1409.camel@rivendell.arnor.net> <20021030093911.B5560@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11844-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1035934581.1487.1409.camel@rivendell.arnor.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Torrey Hoffman <thoffman@arnor.net>, Linux Kernel <linux-kernel@vger.kernel.org>, Reiserfs List <reiserfs-list@namesys.com>

Oleg Drokin wrote:

>Hello!
>
>On Tue, Oct 29, 2002 at 03:36:20PM -0800, Torrey Hoffman wrote:
>  
>
>>I'm having trouble mounting a reiserfs filesystem created with a
>>nonstandard (smaller) journal size.  But if I use the default journal
>>size, it works fine.
>>    
>>
>
>Sure. Non-standard journal is only supported in 2.5 kernel for now.
>
>Bye,
>    Oleg
>-
>To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>Please read the FAQ at  http://www.tux.org/lkml/
>
>
>  
>
That should be in the queue for the next pre1, yes?

-- 
Hans


