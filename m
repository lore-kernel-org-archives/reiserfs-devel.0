From: Rudy Zijlstra <rudy@edsons.demon.nl>
Subject: Re: where are reiser4 sources
Date: Thu, 24 Feb 2005 15:46:32 +0100
Message-ID: <421DE8C8.9030107@edsons.demon.nl>
References: <421A096F.5040603@gmx.de> <421A941B.5030708@slaphack.com> <421B4DC0.2000006@gmx.de> <421B7CD5.8080001@namesys.com> <421B7FFF.8050201@gmx.de> <421CBB13.4030306@namesys.com> <421CC811.7010002@gmx.de> <Pine.LNX.4.58.0502231935400.20004@kheldar.edsons.demon.nl> <421CEF99.2030901@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <421CEF99.2030901@gmx.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mark Junker <mjscod@gmx.de>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Mark Junker wrote:

> Rudy Zijlstra schrieb:
>
>>
> This sounds to me that I can only use GPL'd software with other GPL'd 
> software but this cannot be true because you're allowed to use it with 
> libraries with other licenses too as long as they don't contain 
> conflicts ...
>
Take a look at the difference between GPL and LGPL. LGPL allows dynamic 
linking against non GPL SW, GPL does not. Both allow usage of the 
interfaces *without* linking, either dynamic or static. Neither allow 
static linking to non (L)GPL.

Rudy
