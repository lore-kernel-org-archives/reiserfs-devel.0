From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: Reiserfs fs corruption with 2.5.49
Date: Wed, 27 Nov 2002 08:46:30 -0500
Message-ID: <200211270846.30257.tomlins@cam.org>
References: <200211270810.06553.tomlins@cam.org> <15844.50995.61298.126680@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12057-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <15844.50995.61298.126680@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On November 27, 2002 08:22 am, Nikita Danilov wrote:
> Ed Tomlinson writes:
>  > Hi,
>  >
>  > I am seeing reiserfs (3.6 r5 hash) fs corruption in 2.5.49
>  >
>  > oscar% ls alsa*
>  > zsh: no matches found: alsa*
>  > oscar% ls mod*
>  > alsa-driver-0.9+0beta4-4
>  > oscar% rm "alsa-driver-0.9+0beta4-4"
>  > rm: cannot remove `alsa-driver-0.9+0beta4-4': No such file or directory
>
> This can be explained if you have file alsa-driver-0.9+0beta4-4 within
> directory named modSOMETHING, right? Can you try
>
> $ ls -d ls mod*

YES.  Thanks - stupid me.  I this case I am glad to be wrong though.

Ed Tomlinson
