From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: Tue, 07 May 2002 22:41:58 +0200
Message-ID: <3CD83C16.2040902@netscape.net>
References: <3CD72AB1.6010607@netscape.net> <3CD7DC32.1D138A59@yura.polnet.botik.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10280-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Yury Yu. Rupasov" <yura@yura.polnet.botik.ru>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hi!

On 05/07/2002 03:52 PM, Yury Yu. Rupasov wrote:

> Manuel Krause wrote:
> 
>>Hi!
>>
[...]
>>
>>4.) a hint why there is iicache code in the latest
>>     speedup-compound-patch (so that the latest iicache patch
>>     would not apply)
>>
> 
> The iicache patch is inside compound-speedup-2.patch already.
> So, you can use just compound-speedup-2.
> 
>>Best regards for your stable ReiserFS, at all,
>>
>>even under "settings" with 2.4.19-pre7 +reiserfs.pending +latest
>>reiserfs.compound-speedup +aa.vm-for-2.4.19-pre7 +akpm.read-latency-2
>>+rml.preempt-kernel + rml.lock-break +some-more nice aa.patches...
>>That's a valuably fast & interactive experience!
>>
>>Manuel
>>
> 
> Thank you Manuel for testing,
> Yura.
> 


O.k. I just assumed that (iicache=in) was true since reading and 
applying the patch and _then_ this "compound" is much more stable than 
the previous versions of iicache. I.e. it does not corrupt my Netscape6 
and KDE files-in-use any more. And it really does not show slowdowns in 
applications load times at all. Maybe Dieter could report the same.

I can't say if it is faster or slower as I revised my systems' chipset 
and bus settings (hdparm, lilo->kernel and powertweak) during the last 
weeks to have an overally more common and stable setup.

Thanks for providing a usable and  applyable patch on Namesys ftp, Yura,

Manuel



