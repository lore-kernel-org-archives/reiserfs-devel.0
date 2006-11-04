From: Mark Lord <lkml@rtr.ca>
Subject: Re: 2.6.19-rc3-git7: Oops on shutdown: do_remount_sb (reiserfs)
Date: Sat, 04 Nov 2006 13:43:46 -0500
Message-ID: <454CDF62.2070602@rtr.ca>
References: <45469414.4090108@rtr.ca> <20061104065708.GQ13381@stusta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30099-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20061104065708.GQ13381@stusta.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Adrian Bunk <bunk@stusta.de>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com

Adrian Bunk wrote:
> On Mon, Oct 30, 2006 at 07:08:52PM -0500, Mark Lord wrote:
>> The system is a Core2duo with SATA drives, with a SLES10 install,
>> and a linux-2.6.19-rc3-git7 kernel.  All I did was a fresh boot to
>> the gdm prompt, and then selected "reboot" from the menu.
>>
>> Just as it was closing up shop, an Oops appeared on the screen.
>> I took a photo of it, and transcribed this portion (below).
>> The photograph is available on request.
> 
> Is this reproducible and still present in the latest -git?

Just a one-time event, thus far.  That doesn't mean the bug has gone away
(though it may have), it just means it doesn't happen too often.

I'll email you (Adrian) the photo privately, rather than spam the list with it.

Cheers


