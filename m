From: Oleg Drokin <green@namesys.com>
Subject: Re: How to recover data with a dead journal?
Date: Fri, 6 Sep 2002 16:17:17 +0400
Message-ID: <20020906161717.A14965@namesys.com>
References: <200209061313.24892.matthew@bytemark.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11385-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200209061313.24892.matthew@bytemark.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Bloch <matthew@bytemark.co.uk>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Sep 06, 2002 at 01:13:24PM +0100, Matthew Bloch wrote:
> Here's a problem; my drive is on its way out but the latest corrupt sector is 
> the ReiserFS journal (from the ReiserFS in kernel 2.4.18):

Usually we deal with HW problems based on http://namesys.com/support.html
terms.
Similar questions were answered on this list already, though, so you might
want to check the archive.

>   dd if=/dev/hdb3 of=deaddrive conv=noerror

dd still corrupts data in such a case.

>   mount deaddrive /old/ -t reiserfs -o loop
> but mount reports, somewhat cryptically that /old isn't a directory, which it 
> plainly is :)

Data is shifted, so FS structure is destroyed.

Bye,
    Oleg
