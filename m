From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Wed, 21 Sep 2005 15:08:25 -0700
Message-ID: <4331D9D9.4060501@namesys.com>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl> <432E5024.20709@namesys.com> <20050920075133.GB4074@elf.ucw.cz> <43301FA0.7030906@slaphack.com> <20050920175727.GA17820@thunk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26223-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050920175727.GA17820@thunk.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Theodore Ts'o <tytso@mit.edu>
Cc: David Masover <ninja@slaphack.com>, Pavel Machek <pavel@suse.cz>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Theodore Ts'o wrote:

>On Tue, Sep 20, 2005 at 09:41:36AM -0500, David Masover wrote:
>  
>
>>And personally, if it was my FS, I'd stop working on fsck after it was 
>>able to "check".  That's what it's for.  To fix an FS, you wipe it and 
>>restore from backups.
>>    
>>
>
>If that's Reiser4's philosophy, just make sure you tell all of your
>prospective users about ahead of time.  Is it really an explicit goal
>that performance is so important beyond all other considerations that
>it's OK if the filesystem is extremely fragile and that if anything
>goes wrong, you have to wipe things and recover from backups?!?
>
>I just want to make sure that's the official word and reflects the
>official philosophy of the reiser4 designers before I start telling
>users that this is a good reason to avoid reiser4 like the plague.
>  
>
Ted, please acknowledge that you read my email replying to David.   I
know you'd really like to get going with the FUD, but.....

David is a Reiser4 user, not a developer, and while he is usually very
savvy and over modest, we all make mistakes in what we say, and this was
his turn.
