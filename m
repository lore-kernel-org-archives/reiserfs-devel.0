From: Hans Reiser <reiser@namesys.com>
Subject: Re: The return of the return of crunch time (2.5 merge candidate
 list 1.6)
Date: Mon, 28 Oct 2002 03:27:15 +0300
Message-ID: <3DBC8463.7040909@namesys.com>
References: <200210251557.55202.landley@trommello.org> <3DBA0110.9020206@namesys.com> <200210270911.55926.landley@trommello.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11804-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: landley@trommello.org
Cc: linux-kernel@vger.kernel.org, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, reiserfs mailing list <reiserfs-list@namesys.com>, "Gryaznova E." <grev@namesys.botik.ru>



Rob Landley wrote:

>
>  
>
>>Oh, and it has features too, not just performance....
>>    
>>
>
>I'm all for it.  I just can't put a patch on the list that doesn't exist yet.  
>(I suppose the entry could say "go bug Hans for a patch"... :)
>
>I'll think of something...
>
>  
>
>>Hans
>>    
>>
>
>Rob
>
>  
>

Thanks.  The guys will hopefully put a very beta patch (for developers 
only) on our download page sometime today (I am getting on an airplane 
to the USA, and leaving this to them), and a release appropriate for 
acceptance as an experimental filesystem will ship Halloween day.  

We want to make one last disk format change before it goes into the 
kernel.;-)  Yes, I know, plugins make disk format changes easy, but I 
still don't want there to be plugins that were only used for one week if 
I can avoid it, and our holding a final comprehensive disk format review 
on Friday found something better changed.

Read performance got worse, and write performance got better.  We'll 
have updated benchmarks on our website by the end of the day.

Hans


