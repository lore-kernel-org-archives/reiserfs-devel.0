From: Hans Reiser <reiser@namesys.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Thu, 27 Jul 2006 20:26:12 -0600
Message-ID: <44C975C4.7040803@namesys.com>
References: <44C12F0A.1010008@namesys.com> <44C28A8F.1050408@garzik.org> <44C32348.8020704@namesys.com> <200607230212.55293.lkml@lpbproductions.com> <44C44622.9050504@namesys.com> <20060724085455.GD24299@merlin.emma.line.org> <44C4813E.2030907@namesys.com> <20060726131709.GB5270@ucw.cz> <44C8FE41.5040909@garzik.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1161122AbWG1J0g@vger.kernel.org>
In-Reply-To: <44C8FE41.5040909@garzik.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Garzik <jeff@garzik.org>
Cc: Pavel Machek <pavel@ucw.cz>, Matthias Andree <matthias.andree@gmx.de>, lkml@lpbproductions.com, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Jeff Garzik wrote:

>
> Actually, there is reiser4 brokenness lurking in Hans' statement, too:

Where!  Someone tell me!;-)

>
> A filesystem WITH plugins must still handle the standard Linux
> compatibility stuff that other filesystems handle.

Hmm, you mean we should first implement regular unix file plugins before
implementing enhanced functionality ones?  Are you aware that reiser4
plugins are per file, and thus if a user selects a plugin that is not
the default, and which has user visible semantic differences, it means
they said they want non-standard behavior?

>
> Plugins --do not-- mean that you can just change the filesystem format
> willy-nilly, with zero impact.

Yes they do.....

>
>     Jeff
>
>
>
>
>
