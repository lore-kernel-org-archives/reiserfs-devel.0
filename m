From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Data-Logging Progess?!  (was: Oops with in nfsd -
 2.4.19-pre6)
Date: Wed, 27 Nov 2002 21:54:14 +0100
Message-ID: <3DE530F6.3010205@mb.tu-ilmenau.de>
References: <20021031210828.45F4A216991@server5.fastmail.fm>	<1036099804.14984.165.camel@tiny>	<20021112182949.45436c95.philippe.gramoulle@mmania.com>	<1037211258.288.97.camel@tiny> 	<20021113194008.6dadeed5.philippe.gramoulle@mmania.com> 	<1037219001.21957.151.camel@tiny> <1037241197.288.206.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12062-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 11/14/2002 03:33 AM, Chris Mason wrote:
> On Wed, 2002-11-13 at 15:23, Chris Mason wrote:
> 
>>>Being unable to run the quota anyway with 2.4.19-pre6,as it would make the filer crash, i upgraded to
>>>2.4.20rc1 + data-logging patches and mounted the fs witn noatime,nodiratime and data=journal
>>
>>Ok, I'll make a patch against that.
> 
> Ok, I'm sending a beta of the patch, it has been through light testing. 
> I'm going to run extended tests overnight (in data=journal mode for
> Philippe), but I wanted to give Philippe the chance to use this on his
> own non-critical machines as well.
> 
> The patch is fairly simple, but the code involved can be very subtle to
> I'm trying to be as cautious as possible.
> 
> This is against 2.4.20-rc1 + the data logging code.  It should fix
> possible transaction overflows in the journal by pre-reserving space in
> the transaction during unbounded operations (truncate and hole
> creation).
> 
> It also shows that I owe namesys 1 beer, because it makes hole creation
> a whole lot faster (I've been blaming the balancing code for poor hole
> creation speed).
> 
> -chris
> 
> [possible-transaction-overflow-fix.diff]

Hi!

Are there any news regarding the data-logging code? Issues that justify 
the "experimental" status (e.g. root-fs mounting only with 
rootflags=data=...) or are there new fixes?!

Originally I wondered why the patch you, Chris, sent to the list isn't 
on your ftp servers directory for kernel 2.4.20 until now.

My late questions regarding this patch:
Does this patch make sense for people _not_ using
a) nfs
b) quota
c) data=journal
at all ?!

I applied this patch to 2.4.20-rc[1,3] since you posted it and it works 
well for me. I only use the data=ordered mode and nothing of [a,b,c].


Thanks,

Manuel.

