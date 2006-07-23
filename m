From: Toby Thain <toby@smartgames.ca>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Sun, 23 Jul 2006 13:43:47 -0400
Message-ID: <BAYC1-PASMTP072AFC813FC1F2F87D10C8BF640@CEZ.ICE>
References: <44C12F0A.1010008@namesys.com> <20060722130219.GB7321@thunk.org> <44C26F65.4000103@namesys.com> <44C28A8F.1050408@garzik.org> <44C32348.8020704@namesys.com> <20060723114828.GC27825@lug-owl.de>
Mime-Version: 1.0 (Apple Message framework v750)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29161-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060723114828.GC27825@lug-owl.de>
Message-Id: <D798DA48-2B56-4943-BE2A-4A3983B00B80@smartgames.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>


On 23-Jul-06, at 7:48 AM, Jan-Benedict Glaw wrote:

> On Sun, 2006-07-23 01:20:40 -0600, Hans Reiser <reiser@namesys.com>  
> wrote:
>> There is nothing about small patches that makes them better code.   
>> There
>
> Erm, a small patch is something which should _obviously_ fix one
> issue. A small patch, containing at max some 100 lines, can easily be
> read and understood.
>
> A complete filesystem (I'm co-maintaining one for an ancient on-disk
> format, too) isn't really easy to understand or to verify from looking
> at it for 5min.

Nonetheless, "There is nothing about small patches that makes them  
better code".

Hans is quite right. Long patches just take longer to read. This can  
make them harder to penetrate review, as he describes, with analogy.

>
>> is no reason we should favor them, if the developers are willing  
>> to work
>> on something for 5 years to escape a local optimum, that is often the
>> RIGHT thing to do.
>
> I give a shit of nothing to some 5 year work if I cannot verify that
> it won't hurt me at some point.

Do you really review all patches to ensure this? It is well  
understood that only once r4 reaches mainline will it get the wider  
testing it must have to shake down.

Lucky Namesys is not deterred by ingratitude or there would be no "5  
year work" for us to contemplate at all.

>
>> It is importand that we embrace our diversity, and be happy for the
>> strength it gives us.  Some of us are good at small patches that  
>> evolve,
>> and some are good at escaping local optimums.  We all have value,  
>> both
>> trees and grass have their place in the world.
>
> Just put reiser4 in some GIT tree and publish it. Maybe you can place
> it on git.kernel.org .

Why should Hans give up the aspiration to have r4 in mainline due to  
a small number of regressive personalities (a.k.a. politics)?

To much of the Linux world R3 has been an extremely valuable  
contribution; r4 promises to be even more so.

--T

>
> MfG, JBG
>
> -- 
>        Jan-Benedict Glaw       jbglaw@lug-owl.de                 
> +49-172-7608481
>  Signature of:                     ...und wenn Du denkst, es geht  
> nicht mehr,
>  the second  :                            kommt irgendwo ein  
> Lichtlein her.

