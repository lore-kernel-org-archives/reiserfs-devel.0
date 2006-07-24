From: Hans Reiser <reiser@namesys.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Mon, 24 Jul 2006 02:13:50 -0600
Message-ID: <44C4813E.2030907@namesys.com>
References: <44C12F0A.1010008@namesys.com> <44C28A8F.1050408@garzik.org> <44C32348.8020704@namesys.com> <200607230212.55293.lkml@lpbproductions.com> <44C44622.9050504@namesys.com> <20060724085455.GD24299@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751080AbWGXJNp@vger.kernel.org>
In-Reply-To: <20060724085455.GD24299@merlin.emma.line.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthias Andree <matthias.andree@gmx.de>
Cc: lkml@lpbproductions.com, Jeff Garzik <jeff@garzik.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Matthias Andree wrote:

> The father declared his child unsupported, 
>
I never did that.

>and that's the end
>of the story for me. There's nothing wrong about focusing on newer code,
>but the old code needs to be cared for, too, to fix remaining issues
>such as the "can only have N files with the same hash value". 
>
Requires a disk format change, in a filesystem without plugins, to fix it.

>(I am well
>aware this is exploiting worst-case behavior in a malicious sense but I
>simply cannot risk such nonsense on a 270 GB RAID5 if users have shared
>work directories.)
>
>  
>
>
