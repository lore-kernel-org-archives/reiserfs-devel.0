From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: bug report: reiser4 + kde4
Date: Fri, 25 Jan 2008 14:00:15 +0300
Message-ID: <4799C13F.7050600@gmail.com>
References: <20071122101615.178410@gmx.net>	 <200801172200.22182.volker.armin.hemmann@tu-clausthal.de>	 <4790B6DC.8070308@gmail.com>	 <200801181830.55677.volker.armin.hemmann@tu-clausthal.de>	 <47953052.80500@gmail.com> <e85b9d30801221033j29675024vae4eee3a90fcce73@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <e85b9d30801221033j29675024vae4eee3a90fcce73@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthew <jackdachef@gmail.com>
Cc: "Hemmann, Volker Armin" <volker.armin.hemmann@tu-clausthal.de>, reiserfs-devel@vger.kernel.org

Matthew wrote:

>>Eventually I have launched kde4 with the attached patch.
>>The fixed problem is described in the patch header.
>>Would you please try this?
>>
>>Thanks,
>>Edward.
>>
>>P.S.
>>Kde4 is nice :)
>>
>>    
>>
>
>That DID solve it !
>Thanks a ton, Edward, kde4 and reiser4 is the REAL winning combination ;)
>I've tried the patch on 2 different PCs and kde4 is flying fine so far,
>
>there were some other little problems when launching bash-scripts from
>within an reiser4 root-partition which should also be fixed by this
>patch (I hope), I need to have a deeper look at that ..
>  
>

yes, please...

>reiser4 is feeling pretty stable & safe right now :)
>
>Thanks again,
>Mat
>
>P.S.:
>could you safe / host a copy of the original
>http://pub.namesys.com/Reiser4/ToDo list or wiki so that people who
>are interested in working on reiser4 can further do so before it (the
>list) completely vanishes of the net ? (there are still copies in
>google-cache)
>  
>

http://209.85.129.104/search?q=cache:tzvFNZjSsNYJ:pub.namesys.com/Reiser4/ToDo+Waaaaaaaaaaaaaaay+too+many+typedefs&hl=en&ct=clnk&cd=1

Some updates are needed though. In particular, #14 should be marked
as "not done", as eventually Vladimir hasn't supplied a patch for this.

Thanks,
Edward.
