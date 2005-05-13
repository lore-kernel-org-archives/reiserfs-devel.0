From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS IFSD for Windows
Date: Fri, 13 May 2005 11:14:32 -0700
Message-ID: <4284EE88.2020309@namesys.com>
References: <42838B75.1000605@cs.cmu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24058-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42838B75.1000605@cs.cmu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Piper <mwp@cs.cmu.edu>
Cc: reiserfs-list@namesys.com

Mark Piper wrote:

> This summer, I will be starting a 3.5-month project to create an
> Installable File System Driver (IFSD) to read ReiserFS under Microsoft
> Windows, similar to ext2fsd.   (The project is a practicum to complete
> my degree in software engineering from  Carnegie Mellon.)

I would prefer that you not do it.  Namesys believes that people who use
proprietary operating systems should pay to use reiserfs.

I can suggest quite a few other tasks that would make a more impressive
practicum (copy on write links, various other new and needed plugins).

>
> I have three questions:
>
> * Is anyone out there interested in using the tool as it is developed?
>
> * Is anyone out there interested in mentoring the development of the
> tool?  (This basically consists of answering specific technical
> questions when they arise.)
>
> * Other than compliance to the GPL, are there any other liscensing
> factors I should be aware of?
>
> For anyone interested, my initial plan is to port the read-only
> ReiserFS 3 code from the GRUB bootloader, and turn it into an IFSD
> using the same techniques as in ext2fsd -- although I'd love to hear
> other ideas, and opinions of whether the project might be feasible
> with ReiserFS 4.
>
>  Thanks,
>     Mark Piper
>
>
>
>
>
