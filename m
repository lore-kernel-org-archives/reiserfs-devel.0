From: Chris Mason <mason@suse.com>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: 08 May 2002 09:34:52 -0400
Message-ID: <1020864892.32044.215.camel@tiny>
References: <3CD72AB1.6010607@netscape.net>
	<20020507092207.A6678@namesys.com>  <3CD82C76.2080706@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10289-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CD82C76.2080706@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuelkrause@netscape.net>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>

On Tue, 2002-05-07 at 15:35, Manuel Krause wrote:

> 
> Mmh. I meant to restore the affected files from existing backups. When
> they are  removed by reiserfs on mount I know they are really corrupted
> during crash. It often looks like:
>   Removing [5523 5570 0x0 SD]..done
>   Removing [5523 5569 0x0 SD]..done
>   Removing [5523 5566 0x0 SD]..done
>   There were 3 uncompleted unlinks/truncates. Completed

Just to reiterate what Oleg said, these files were not corrupted during
the crash.  Right before you crashed, something on your box deleted each
of these files, but the delete did not have a chance to finish.  During
the next mount we finish the delete, which brings the FS back to a
consistent state.

-chris


