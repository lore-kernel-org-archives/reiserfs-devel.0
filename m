From: Hans Reiser <reiser@namesys.com>
Subject: Re: About direntries pointing to nowhere on reiserfs problem in 2.4
Date: Tue, 25 Feb 2003 15:01:40 +0300
Message-ID: <3E5B5B24.2040002@namesys.com>
References: <20030220175309.A23616@namesys.com> <b3dluc$n39$1@satsuki.furryterror.org> <20030225100459.A23204@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12905-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030225100459.A23204@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Mon, Feb 24, 2003 at 12:49:00PM -0500, Zygo Blaxell wrote:
>  
>
>>>  So we solved that with patch below (Zygo, others who think they have this problem,
>>>  please check).
>>>      
>>>
>>I am building a kernel with the patch as I type this.  I'll know if it works 
>>in a few hours.
>>If it does work, I'll be running reiserfsck for the rest of the week to
>>clean out all those dead direntries on all my systems once and for all.
>>:-P
>>    
>>
>
>Actually I have different version that eventually will be pushed to Marcelo (iget5_locked
>backport). Unfortunatelly it is also touches NFS and Coda.
>(and I am not yet sure for NFS changes, though they are working for me).
>
>  
>
>>Reiserfsck takes 53 hours to scan everything on some of my machines,
>>    
>>
>
>Wow.
>You probably do not have spare filesystem to run reiserfsck with profiling
>compiled in for us, though.
>
>  
>
>>I don't suppose it's a quick or easy task to modify reiserfsck to just fix
>>_one_ missing directory entry, or to allow the kernel to unlink missing
>>direntries instead of returning EPERM?  Would it suffice to simply hack
>>    
>>
>
>Well, that is in fact may be easy. (but that would not be a kernel you want to run
>every day ;) ).
>Also GNU rm checks file's mode prior to unlinking, I believe.
>And that won;t get rid on lost file you might have, too.
>
>Bye,
>    Oleg
>
>
>  
>
I am confused.  What concrete solution are you emailing him?

-- 
Hans


