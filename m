From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Reiserfs fs corruption with 2.5.49
Date: Wed, 27 Nov 2002 16:22:59 +0300
Message-ID: <15844.50995.61298.126680@laputa.namesys.com>
References: <200211270810.06553.tomlins@cam.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12055-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200211270810.06553.tomlins@cam.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ed Tomlinson <tomlins@cam.org>
Cc: reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Ed Tomlinson writes:
 > Hi,
 > 
 > I am seeing reiserfs (3.6 r5 hash) fs corruption in 2.5.49
 > 
 > oscar% ls alsa*
 > zsh: no matches found: alsa*
 > oscar% ls mod*
 > alsa-driver-0.9+0beta4-4
 > oscar% rm "alsa-driver-0.9+0beta4-4"
 > rm: cannot remove `alsa-driver-0.9+0beta4-4': No such file or directory

This can be explained if you have file alsa-driver-0.9+0beta4-4 within
directory named modSOMETHING, right? Can you try 

$ ls -d ls mod*

?

 > 
 > The fs with the above error passed an reiserfsck (3.6.4) 2 and a half days 
 > ago (just before the last reboot) - when I had to do a rebuild tree after 
 > booting 2.5.49-mm1, which did oops.  Looks like the bug is not just in -mm1 
 > though.
 > 
 > 
 > What info can I gather before fixing this fs?
 > 
 > Ed Tomlinson
 > 

Nikita.
