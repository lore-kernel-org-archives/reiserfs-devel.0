From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Calling finish_unfinished() too often?
Date: Wed, 30 Apr 2008 22:13:35 +0400
Message-ID: <4818B6CF.7080804@gmail.com>
References: <20080430112329.GE19688@duck.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20080430112329.GE19688@duck.suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-devel@vger.kernel.org, Vladimir Saveliev <Vladimir.Saveliev@sun.com>

Jan Kara wrote:

>  Hi,
>
>  I was just looking into reiserfs remount code and it seems it calls
>finish_unfinished() whenever filesystem is remounted and isn't in read-only
>mode. Isn't this unnecessary? I thought finish_unfinished() is needed only
>when we remount from read-only to read-write state for the first time...
>  
>

Perhaps, you are right (if we don't miss some points). But we need to 
keep a track
of first successful remounts to rw state, and it requires a special flag 
in in-memory
superblock (I don't see another way).

>  Well, I wouldn't mind the performance impact to remount that much
>

yeah,  definitely benchmarks lack "1000 remounts"statistics ;)

> but it
>would make my life with journaled quota a bit easier ;). Thanks for an
>answer in advance.
>
>								Honza
>  
>

