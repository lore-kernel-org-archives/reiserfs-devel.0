From: Matthew Bloch <matthew@bytemark.co.uk>
Subject: Re: How to recover data with a dead journal?
Date: Fri, 6 Sep 2002 13:43:04 +0100
Message-ID: <200209061343.04582.matthew@bytemark.co.uk>
References: <200209061313.24892.matthew@bytemark.co.uk> <20020906161717.A14965@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11386-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020906161717.A14965@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Friday 06 September 2002 13:17, Oleg Drokin wrote:
> Hello!
>
> On Fri, Sep 06, 2002 at 01:13:24PM +0100, Matthew Bloch wrote:
> > Here's a problem; my drive is on its way out but the latest corrupt
> > sector is the ReiserFS journal (from the ReiserFS in kernel 2.4.18):
>
> Usually we deal with HW problems based on http://namesys.com/support.html
> terms.
> Similar questions were answered on this list already, though, so you might
> want to check the archive.

Fair enough; I thought there might be some experienced users here who could 
help as well.  I'm trying dd with a different set of options to try to make 
it leave gaps where it can't read, so hopefully that should sort it.  If it 
doesn't I'll put a few dollars your way and make an official support request 
out of it.

cheers,

-- 
Matthew Bloch         Bytemark Computer Consulting Limited
                                http://www.bytemark.co.uk/
                                  tel. +44 (0) 8707 455026

