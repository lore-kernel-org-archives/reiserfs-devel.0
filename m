From: Oleg Drokin <green@namesys.com>
Subject: Re: About direntries pointing to nowhere on reiserfs problem in 2.4
Date: Fri, 21 Feb 2003 10:14:53 +0300
Message-ID: <20030221101453.A28902@namesys.com>
References: <20030220175309.A23616@namesys.com> <3E55D114.6040401@mb.tu-ilmenau.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12850-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E55D114.6040401@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: Chris Mason <mason@suse.com>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Fri, Feb 21, 2003 at 08:11:16AM +0100, Manuel Krause wrote:

> Is this fix safe for usage already?

work for me (tm) ;)
It will most probably will be replaced by iget5_locked, though.

> Mmmh. I have some hangs within KDE 2.2.2 Konqueror when copying over 
> (existing) directory links for some weeks now. I don't copy often over 
> links but when it stalls, a directory link is somewhere involved.
> (No crashes, no messages in the logs, just "minutes" for copies or 
> deletes that happened in seconds usually.)
> Should I worry and use the patch
>  -- or finally upgrade my KDE ;-))

This does not look like this bug in reiserfs, the patch is supposed to fix.

Bye,
    Oleg
