From: Oleg Drokin <green@namesys.com>
Subject: Re: 640.0 GB symlink
Date: Wed, 4 Dec 2002 11:01:34 +0300
Message-ID: <20021204110134.A28179@namesys.com>
References: <F166w0wQDoKK0jocxmW00010062@hotmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12104-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <F166w0wQDoKK0jocxmW00010062@hotmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Mancini <jayrusman@hotmail.com>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Dec 03, 2002 at 09:02:38PM -0800, Jason Mancini wrote:

> Should I just erase and remake the symlink?

Yes, that would be the simpliest thing.

> It wasn't like this in July (my last backup, *cough*).

Then somebody corrupted it, or may be even the drive itself.

reiserfsck is generally does not shorten file sizes, but symlink is really
special file, so this will be fixed for next release for sure.
May be we will even include something like that check into the kernel.

Thank you for your report.

Bye,
    Oleg
