From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: reiserfs corruption: --rebuild-tree bug report
Date: Tue, 20 Jan 2004 16:03:11 +0100
Sender: bernd-schubert@web.de
Message-ID: <200401201603.11653.bernd-schubert@web.de>
References: <400D372C.5010903@upfrontsystems.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16586-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <400D372C.5010903@upfrontsystems.co.za>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

>
> I'm sending you the output of my 'reiserfck --rebuild-tree'.
> It saved my ass, so I'm not complaining! However, I have no
> idea how the filesystem got into this state. If you want me


You didn't mention that you used the wrong commands to test which drive had 
failed, then used improper commands to restart the drive again and that you 
had a quite long discussion with Neil Brown on the raid-list who suggested to 
run a fsck, since  the the raid-reconstruction might cause data-corruption 
now.
Well, I really would blame any reiserfs-code for this ;-)

Cheers,
	Bernd
