From: Mark Junker <mjscod@gmx.de>
Subject: Re: where are reiser4 sources
Date: Wed, 23 Feb 2005 22:03:21 +0100
Message-ID: <421CEF99.2030901@gmx.de>
References: <421A096F.5040603@gmx.de> <421A941B.5030708@slaphack.com> <421B4DC0.2000006@gmx.de> <421B7CD5.8080001@namesys.com> <421B7FFF.8050201@gmx.de> <421CBB13.4030306@namesys.com> <421CC811.7010002@gmx.de> <Pine.LNX.4.58.0502231935400.20004@kheldar.edsons.demon.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0502231935400.20004@kheldar.edsons.demon.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rudy Zijlstra <rudy@edsons.demon.nl>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Rudy Zijlstra schrieb:

>There is another issue here as well.
>
>Have you checked the Windows licenses (or rather the needed windows
>development kits) and what they allow you to do? If i remember correctly
>you run into problems there as well...
>
>If i remember correctly to interface with windows you have to include some
>SW from MS which is most definitly not GPL, and the license on those
>portions forbid using it with GPL SW.
>  
>
I wouldn't compile against M$ headers and libraries. I would use the 
ones from ReactOS instead.

>And this works from the GPL as well, because you cannot distribute the
>relevant windows code (i do not think you even have the source), you
>cannot distribute the complete set under GPL.
>  
>
This sounds to me that I can only use GPL'd software with other GPL'd 
software but this cannot be true because you're allowed to use it with 
libraries with other licenses too as long as they don't contain 
conflicts ...

>I am open to be corrected here, but this is my understanding.
>  
>
Yes, I know it's a quite difficult area and I'm unsure what's the right 
understanding ...

Regards,
Mark

