From: Hendrik Visage <hvisage@envisage.co.za>
Subject: Re: nvram to protect fs during power loss?
Date: Fri, 31 Dec 2004 19:33:47 +0200
Message-ID: <20041231173347.GF1586@hvs.envisage.co.za>
References: <1062660450.20041231004008@tnonline.net> <20041231094126.GV1586@hvs.envisage.co.za> <273759260.20041231134532@tnonline.net> <20041231164620.GB1586@hvs.envisage.co.za> <ef5e15ed041231085194d6dd9@mail.gmail.com> <1942769981.20041231182849@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23007-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1942769981.20041231182849@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: reiserfs-list@namesys.com

On Fri, Dec 31, 2004 at 06:28:49PM +0100, Spam wrote:
>   How can buying additional hardware be cheaper? Do you expect most
>   users, including Laptop users, to use UPS?

Almost all laptop users already have UPS.. it's called their batteries!!!

> >> Okay, if you want to use the NVRAM on a desktop, it's waaaaayyyyyy too little
> >> to even consider. You'll need NVRAM (battery backed up etc.) in the
> >> order of Megabytes to make it of any use Spam.
> 
>   I thought NVRAM already was battery backed up or was as flash?\

YEs, but those few bytes (not even kilobytes) is one too small to do anything
usefull for a cache/journal/whatever related to a filesystem, and also
way too slow to access.

>   With a simple pointer we can know the latest journal entry that was
>   surely saved before the power loss (you can update the NVRAM when
>   you tell the disk to sync etc). When you reboot the the fsck tools
>   can scan all the journal entries that occurred after to verify that
>   the data is on disk or not. This must be much faster than doing a
>   full scan of the entire filesystem? How can disk require several
>   megabytes? I am not talking about storing the journals in the NVRAM.

I believe the reiserfs team would appreciate the code if you could
prove it usefull ;-)
